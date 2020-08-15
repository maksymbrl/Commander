import numpy as np
import matplotlib.pyplot as plt
import healpy as hp
import h5py

import huffman

from multiprocessing import Pool

from time import time
from tqdm import tqdm


from scipy import sparse
import sys
from glob import glob

version = 9

def make_dipole(amp, lon, lat, nside):
    vec = hp.ang2vec(lon, lat, lonlat=True)
    x,y,z = hp.pix2vec(nside, np.arange(hp.nside2npix(nside)))
    dip_map = x*vec[0] + y*vec[1] + z*vec[2]
    return dip_map*amp

def pointing(pixA, pixB, x):
    times = np.arange(len(pixA))
    P_A = sparse.csr_matrix((np.ones_like(times), (times, pixA)))
    P_B = sparse.csr_matrix((np.ones_like(times), (times, pixB)))
    P = P_A - P_B

    # y = A.dot(x)
    # where A is P.T.dot(P)

    return y

def cg_solve(A, b, Minv, imax=1000, eps=1e-6):
    x = np.zeros_like(b)
    i = 0
    r = b - A.dot(x)
    d = Minv.dot(r)
    delta_new = r.dot(d)
    delta_0 = r.dot(d)
    while ((i < imax) & (delta_new > eps**2*delta_0)):
        q = A.dot(d)
        alpha = delta_new/d.dot(q)
        x = x + alpha*d
        if (i % 50 == 0):
            r = b - A.dot(x)
        else:
            r = r - alpha*q
        s = Minv.dot(r)
        delta_old = np.copy(delta_new)
        delta_new = r.dot(s)
        beta = delta_new/delta_old
        d = s + beta*d
        i += 1
    return x

def cg_solve_map(A, b, Minv, imax=1000, eps=1e-6):
    '''
    Try to rewrite this so that A is an operator, not a matrix that needs to be
    held in memory.
    '''
    x = np.zeros_like(b)
    i = 0
    r = b - A.dot(x)
    d = Minv.dot(r)
    delta_new = r.dot(d)
    delta_0 = r.dot(d)
    while ((i < imax) & (delta_new > eps**2*delta_0)):
        q = A.dot(d)
        alpha = delta_new/d.dot(q)
        x = x + alpha*d
        if (i % 50 == 0):
            r = b - A.dot(x)
        else:
            r = r - alpha*q
        s = Minv.dot(r)
        delta_old = np.copy(delta_new)
        delta_new = r.dot(s)
        beta = delta_new/delta_old
        d = s + beta*d
        i += 1
    return x


def cg_test():
    A = np.array([[3,2],
                  [2,6]])
    b = np.array([2,-8])
    Minv = np.eye(2)

    x = cg_solve(A, b, Minv)
    assert np.allclose(A.dot(x), b), 'CG solution is not close enough'
    return

def get_data(fname, band, nside=256):
    ntodsigma = 100
    npix = hp.nside2npix(nside)
    M = np.zeros(npix)
    b = np.zeros(npix)
    labels = [f'{band}13', f'{band}14',f'{band}23',f'{band}24']
    f= h5py.File(fname, 'r')
    obsid = str(list(f.keys())[0])
    huffTree = f[obsid+'/common/hufftree']
    huffSymb = f[obsid+'/common/huffsymb']
    h = huffman.Huffman(tree=huffTree, symb=huffSymb)


    TOD0 = np.array(f[obsid + '/' + labels[0] + '/tod'])
    if band == 'K1':
        if len(TOD0) != 675000:
            print(f'{fname} has wrong length')
            return None
    elif band == 'V1':
        if len(TOD0) != 1125000:
            print(f'{fname} has wrong length')
            return None
    
    
    DAs = [[], [], [], []]
    pixAs = []
    pixBs = []
    sigmas = []
    gains = np.zeros(len(labels))
    for num, label in enumerate(labels):
        TODs = np.array(f[obsid + '/' + label + '/tod'])
        scalars = f[obsid + '/' + label + '/scalars']
        gains[num] = scalars[0]
        #TODs -= TODs.mean()
        DAs[num] = DAs[num] + TODs.tolist()
        sigmas.append(TODs.std())
        if label == f'{band}13':
            pixA = h.Decoder(np.array(f[obsid + '/' + label + \
                '/pixA'])).astype('int')
            pixB = h.Decoder(np.array(f[obsid + '/' + label + \
                '/pixB'])).astype('int')

    DAs = np.array(DAs)/gains.reshape(4,1)
    sigma0 = np.mean(np.array(sigmas)**2)**0.5

    
    
    d1 = 0.5*(DAs[0] + DAs[1])
    d2 = 0.5*(DAs[2] + DAs[3])
    
    d = 0.5*(d1 + d2) # = i_A - i_B
    p = 0.5*(d1 - d2) # = q_A*cos(2*g_A) + u_A*sin(2*g_A) - q_B*cos(2*g_B) - u_B*sin(2*g_B)


    for t in range(len(d)):
        # needs to be divided by 4 because pointing matrix
        # is defined to be P=(P13+P14+P23+P24)/4
        b[pixA[t]] += d[t]/4
        b[pixB[t]] -= d[t]/4

        M[pixA[t]] += 1
        M[pixB[t]] += 1

    return M, b, pixA, pixB, sigma0

def inner_productdq(t):
    global d, sigma0, pixA, pixB
    dq = (d[pixA[t]] - d[pixB[t]])
    return pixA[t], pixB[t], dq

def inner_productxr(t):
    global x, sigma0, pixA, pixB
    dr = (x[pixA[t]] - x[pixB[t]])
    return pixA[t], pixB[t], dr

def inner_product(pixA, pixB, dA, dB, sigma0, sign=1):
    dq = (dA - dB)*sign
    return pixA, pixB, dq


def get_cg(band='K1', nside=256, nfiles=200, sparse_test=False,
        sparse_only=False):
    global x, d, sigma0, pixA, pixB
    npix = hp.nside2npix(nside)
    b = np.zeros(hp.nside2npix(nside))
    M_diag = np.zeros(npix)

    fnames = glob(f'/mn/stornext/d16/cmbco/bp/wmap/data/wmap_{band}_*v{version}.h5')
    fnames.sort()
    print(len(fnames))
    if nfiles == 1:
        fnames = [fnames[0]]
    elif nfiles < len(fnames):
        fnames = fnames[:nfiles]
    else:
        fnames = fnames

    pool = Pool(processes=120)
    funcs = [pool.apply_async(get_data, args=[fname, band]) for fname in fnames]
    pixA = []
    pixB = []
    sigma0s = []
    for res in funcs:
        result = res.get()
        if result is not None:
            M_i, b_i, pixA_i, pixB_i, sigma_i = result
            M_diag += M_i
            b += b_i
            pixA += pixA_i.tolist()
            pixB += pixB_i.tolist()
            sigma0s += [sigma_i]
    sigma0 = np.mean(sigma0s)
    print('Loaded data')



    if sparse_test or sparse_only:
        times = np.arange(len(pixA))
        print('Creating the sparse matrices')
        t0 = time()
        P_A = sparse.csr_matrix((np.ones_like(times), (times, pixA)))
        P_B = sparse.csr_matrix((np.ones_like(times), (times, pixB)))
        print(f'sparse matrix construction takes {time()-t0} seconds')
        P = (P_A - P_B)/2
        #print(P.data.nbytes + P.indptr.nbytes + P.indices.nbytes)
        plt.close()


        print('Constructing the CG matrix A')
        t0 = time()
        A = P.T.dot(P)
        #print(A.data.nbytes + A.indptr.nbytes + A.indices.nbytes)
        print(f'Inner product takes {time()-t0} seconds')




    dts = []
    i = 0
    x = np.zeros_like(b)
    d = np.zeros_like(b)
    q = np.zeros_like(b)
    s = np.zeros_like(b)
    r = b
    p = (M_diag != 0)
    d[p] = r[p]/M_diag[p]
    delta_new = r.dot(d)
    delta_0 = np.copy(delta_new)
    i_max = npix
    i_max = 1000
    eps = 1e-7
    
    print('starting while loop')
    while (i < i_max) & (delta_new > eps**2*delta_0):
        t0 = time()
        if sparse_only:
            q = A.dot(d)
        else:
            q *= 0
            funcs = [pool.apply_async(inner_productdq, args=[i]) for i in tqdm(range(len(pixA)))]
            for res in funcs:
                result = res.get()
                pA, pB, dq = result
                q[pA] += dq
                q[pB] -= dq
            #for t in tqdm(range(len(pixA))):
            #    pA, pB, dq = inner_productdq(t)
            #    q[pA] += dq
            #    q[pB] -= dq
            if (i < 10) and sparse_test:
                q_test = A.dot(d)
                print(np.allclose(q_test, q))
        alpha = delta_new/d.dot(q)
        x = x + alpha*d
        if i % 50 == 0:
            print('Divisible by 50')
            if sparse_only:
                r_test = b - A.dot(x)
            else:
                r = 0 + b
                for t in tqdm(range(len(pixA))):
                    pA, pB, dr = inner_productxr(t)
                    r[pA] -= dr
                    r[pB] += dr
                if (i < 10) and sparse_test:
                    r_test = b - A.dot(x)
                    print(np.allclose(r_test, r))
        else:
            r = r - alpha*q
        if i % 10 == 0:
            print(np.round(i/i_max,3),\
                    np.round(1/np.log10(delta_new/(delta_0*eps**2)),3),\
                    int(delta_new))
        s[p] = r[p]/M_diag[p]
        delta_old = np.copy(delta_new)
        delta_new = r.dot(s)
        beta = delta_new/delta_old
        d = s + beta*d
        i += 1
        dts.append(time()-t0)
    hp.write_map(f'cg_v{version}.fits', x, overwrite=True)

    print(f'Done with {i} iterations, delta is {delta_new}')
    print(f"Each iteration is {np.mean(dts)}\pm{np.std(dts)}")


    amp = 0.35
    hp.mollview(b, min=-amp, max=amp, cmap='coolwarm', title='Noise-weighted average')
    plt.savefig('noise_avg1.png')
    hp.mollview(b, min=-10*amp, max=10*amp, cmap='coolwarm', title='Noise-weighted average')
    plt.savefig('noise_avg2.png')
    hp.mollview(M_diag, norm='hist', title='Preconditioner')
    hp.mollview(x, min=-amp, max=amp, title='Solution', cmap='coolwarm')
    plt.savefig('solution.png', bbox_inches='tight')
    hp.mollview(x, min=-10*amp, max=10*amp, title='Solution', cmap='coolwarm')
    plt.savefig('solution2.png', bbox_inches='tight')
    hp.mollview(x, min=-100*amp, max=100*amp, title='Solution', cmap='coolwarm')
    plt.savefig('solution3.png', bbox_inches='tight')



    data = hp.ud_grade(hp.read_map('data/wmap_imap_r9_9yr_K1_v5.fits'), nside)
    A = 3.346 # mK
    lon = 263.85
    lat = 48.25
    dipole = make_dipole(A, lon, lat, nside)
    hp.mollview(data+dipole, min=-10*amp, max=10*amp, title='WMAP K1', cmap='coolwarm')
    plt.savefig('wmap_sol.png', bbox_inches='tight')


    hp.mollview(x - data - dipole, norm='hist', title='CG - WMAP')
    plt.savefig('wmap_diff.png', bbox_inches='tight')


    #plt.show()

    

    return


def check_hdf5(nside=256, version=8, band='K1'):
    # Take official W-band K-band, scan it with the same pointing matrix, divide
    # by gain, subtract from timestream, check the gain and pointing solution
    # directly. Should just be white noise.
    npix = hp.nside2npix(nside)
    b = np.zeros(hp.nside2npix(nside))
    M_diag = np.zeros(npix)

    from glob import glob
    fnames = glob(f'/mn/stornext/d16/cmbco/bp/wmap/data/wmap_{band}_*v{version}.h5')
    fnames.sort()
    fname = fnames[0]
    f= h5py.File(fname, 'r')
    obsid = str(list(f.keys())[0])
    labels = [f'{band}13', f'{band}14',f'{band}23',f'{band}24']

    huffTree = f[obsid+'/common/hufftree']
    huffSymb = f[obsid+'/common/huffsymb']
    h = huffman.Huffman(tree=huffTree, symb=huffSymb)


    TOD0 = np.array(f[obsid + '/' + labels[0] + '/tod'])
    if band == 'K1':
        if len(TOD0) != 675000:
            print(f'{fname} has wrong length')
            return None
    elif band == 'V1':
        if len(TOD0) != 1125000:
            print(f'{fname} has wrong length')
            return None
    
    
    DAs = [[], [], [], []]
    pixAs = []
    pixBs = []
    sigmas = []
    gains = np.zeros(len(labels))
    for num, label in enumerate(labels):
        TODs = np.array(f[obsid + '/' + label + '/tod'])
        scalars = f[obsid + '/' + label + '/scalars']
        gains[num] = scalars[0]
        TODs = TODs - np.median(TODs)
        DAs[num] = DAs[num] + TODs.tolist()
        sigmas.append(TODs.std())
        if label == f'{band}13':
            pixA = h.Decoder(np.array(f[obsid + '/' + label + \
                '/pixA'])).astype('int')
            pixB = h.Decoder(np.array(f[obsid + '/' + label + \
                '/pixB'])).astype('int')

    DAs = np.array(DAs)/gains.reshape(4,1)
    
    d1 = 0.5*(DAs[0] + DAs[1])
    d2 = 0.5*(DAs[2] + DAs[3])
    
    d = 0.5*(d1 + d2) # = i_A - i_B
    p = 0.5*(d1 - d2) # = q_A*cos(2*g_A) + u_A*sin(2*g_A) - q_B*cos(2*g_B) - u_B*sin(2*g_B)


    cg = hp.read_map(f'cg_v{version}.fits')
    # dipole
    amp = 3.346 # mK
    lon = 263.85
    lat = 48.25
    dipole = make_dipole(amp, lon, lat, nside)
    # all in mK
    sol = hp.read_map(f'data/wmap_imap_r9_9yr_{band}_v5.fits')
    sol = hp.ud_grade(sol, nside)


    dip_sub = hp.remove_dipole(cg, gal_cut=10)

    hp.mollview(sol, min=-2.5, max=2.5, title='WMAP', cmap='RdBu_r')
    plt.savefig('wmap.png', bbox_inches='tight')
    hp.mollview(dip_sub, min=-2.5, max=2.5, title='CG Dipole Subtracted', cmap='RdBu_r')
    plt.savefig('cg_dipsub.png', bbox_inches='tight')
    hp.mollview(sol - dip_sub, min=-2.5, max=0.25, title='Difference', cmap='RdBu_r')
    plt.savefig('diff.png', bbox_inches='tight')

    sol += dipole

    max_t = 10000

    d_sol = np.zeros(len(pixA))
    d_cg = np.zeros(len(pixA))
    for t in range(len(pixA)):
        d_sol[t] = sol[pixA[t]] - sol[pixB[t]]
        d_cg[t] = cg[pixA[t]] - cg[pixB[t]]
    fig, axes = plt.subplots(nrows=2, sharex=True, sharey=True)
    axes[0].plot(d_sol[:max_t])
    axes[0].set_ylabel('WMAP solution (mK)')
    #axes[1].plot(d[:max_t])
    #axes[1].set_ylabel('(Raw timestream - baseline) x g (mK)')

    axes[1].plot(d_cg[:max_t])
    axes[1].set_ylabel('CG solution')

    #plt.figure()
    #bins = np.linspace(-15, 15,  100)
    #plt.hist(d, label='CG Solution', alpha=0.5, bins=bins)
    #plt.hist(d_sol, label='WMAP solution', alpha=0.5, bins=bins)
    #plt.legend(loc='best')
    plt.show()


    plt.show()


    return


if __name__ == '__main__':
    #cg_test()
    get_cg(band='K1', nfiles=200, sparse_test=False, sparse_only=True)
    #get_cg(band='V1')
    #check_hdf5()


