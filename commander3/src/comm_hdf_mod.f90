!================================================================================
!
! Copyright (C) 2020 Institute of Theoretical Astrophysics, University of Oslo.
!
! This file is part of Commander3.
!
! Commander3 is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.
!
! Commander3 is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
! GNU General Public License for more details.
!
! You should have received a copy of the GNU General Public License
! along with Commander3. If not, see <https://www.gnu.org/licenses/>.
!
!================================================================================
! Due to the extreme amount of redundancy in hdf_mod, it is now generated
! by using the handy tempita template language. All the machinery for
! doing this is included in the repository, so this should just work.
module comm_hdf_mod
  use healpix_types
  use comm_utils
  use hdf5
  implicit none

  type hdf_file
     character(len=512) :: filename, setname
     integer(hid_t)     :: filehandle, sethandle
     integer            :: status
  end type hdf_file

  interface read_hdf
     module procedure read_hdf_0d_dp
     module procedure read_hdf_0d_sp
     module procedure read_hdf_0d_int
     module procedure read_hdf_0d_char
     module procedure read_hdf_1d_dp
     module procedure read_hdf_1d_sp
     module procedure read_hdf_1d_int
     module procedure read_hdf_1d_char
     module procedure read_hdf_2d_dp
     module procedure read_hdf_2d_sp
     module procedure read_hdf_2d_int
     module procedure read_hdf_2d_char
     module procedure read_hdf_3d_dp
     module procedure read_hdf_3d_sp
     module procedure read_hdf_3d_int
     module procedure read_hdf_3d_char
     module procedure read_hdf_4d_dp
     module procedure read_hdf_4d_sp
     module procedure read_hdf_4d_int
     module procedure read_hdf_4d_char
     module procedure read_hdf_5d_dp
     module procedure read_hdf_5d_sp
     module procedure read_hdf_5d_int
     module procedure read_hdf_5d_char
     module procedure read_hdf_6d_dp
     module procedure read_hdf_6d_sp
     module procedure read_hdf_6d_int
     module procedure read_hdf_6d_char
     module procedure read_hdf_7d_dp
     module procedure read_hdf_7d_sp
     module procedure read_hdf_7d_int
     module procedure read_hdf_7d_char
     module procedure read_hdf_slice_0d_dp
     module procedure read_hdf_slice_0d_sp
     module procedure read_hdf_slice_0d_int
     module procedure read_hdf_slice_0d_char
     module procedure read_hdf_slice_1d_dp
     module procedure read_hdf_slice_1d_sp
     module procedure read_hdf_slice_1d_int
     module procedure read_hdf_slice_1d_char
     module procedure read_hdf_slice_2d_dp
     module procedure read_hdf_slice_2d_sp
     module procedure read_hdf_slice_2d_int
     module procedure read_hdf_slice_2d_char
     module procedure read_hdf_slice_3d_dp
     module procedure read_hdf_slice_3d_sp
     module procedure read_hdf_slice_3d_int
     module procedure read_hdf_slice_3d_char
     module procedure read_hdf_slice_4d_dp
     module procedure read_hdf_slice_4d_sp
     module procedure read_hdf_slice_4d_int
     module procedure read_hdf_slice_4d_char
     module procedure read_hdf_slice_5d_dp
     module procedure read_hdf_slice_5d_sp
     module procedure read_hdf_slice_5d_int
     module procedure read_hdf_slice_5d_char
     module procedure read_hdf_slice_6d_dp
     module procedure read_hdf_slice_6d_sp
     module procedure read_hdf_slice_6d_int
     module procedure read_hdf_slice_6d_char
     module procedure read_hdf_slice_7d_dp
     module procedure read_hdf_slice_7d_sp
     module procedure read_hdf_slice_7d_int
     module procedure read_hdf_slice_7d_char
  end interface

  interface read_alloc_hdf
     module procedure read_alloc_hdf_1d_dp
     module procedure read_alloc_hdf_1d_sp
     module procedure read_alloc_hdf_1d_int
     module procedure read_alloc_hdf_1d_char
     module procedure read_alloc_hdf_2d_dp
     module procedure read_alloc_hdf_2d_sp
     module procedure read_alloc_hdf_2d_int
     module procedure read_alloc_hdf_2d_char
     module procedure read_alloc_hdf_3d_dp
     module procedure read_alloc_hdf_3d_sp
     module procedure read_alloc_hdf_3d_int
     module procedure read_alloc_hdf_3d_char
     module procedure read_alloc_hdf_4d_dp
     module procedure read_alloc_hdf_4d_sp
     module procedure read_alloc_hdf_4d_int
     module procedure read_alloc_hdf_4d_char
     module procedure read_alloc_hdf_5d_dp
     module procedure read_alloc_hdf_5d_sp
     module procedure read_alloc_hdf_5d_int
     module procedure read_alloc_hdf_5d_char
     module procedure read_alloc_hdf_6d_dp
     module procedure read_alloc_hdf_6d_sp
     module procedure read_alloc_hdf_6d_int
     module procedure read_alloc_hdf_6d_char
     module procedure read_alloc_hdf_7d_dp
     module procedure read_alloc_hdf_7d_sp
     module procedure read_alloc_hdf_7d_int
     module procedure read_alloc_hdf_7d_char
  end interface

  interface write_hdf
     module procedure write_hdf_0d_dp
     module procedure write_hdf_0d_sp
     module procedure write_hdf_0d_int
     module procedure write_hdf_0d_char
     module procedure write_hdf_1d_dp
     module procedure write_hdf_1d_sp
     module procedure write_hdf_1d_int
     module procedure write_hdf_1d_char
     module procedure write_hdf_2d_dp
     module procedure write_hdf_2d_sp
     module procedure write_hdf_2d_int
     module procedure write_hdf_2d_char
     module procedure write_hdf_3d_dp
     module procedure write_hdf_3d_sp
     module procedure write_hdf_3d_int
     module procedure write_hdf_3d_char
     module procedure write_hdf_4d_dp
     module procedure write_hdf_4d_sp
     module procedure write_hdf_4d_int
     module procedure write_hdf_4d_char
     module procedure write_hdf_5d_dp
     module procedure write_hdf_5d_sp
     module procedure write_hdf_5d_int
     module procedure write_hdf_5d_char
     module procedure write_hdf_6d_dp
     module procedure write_hdf_6d_sp
     module procedure write_hdf_6d_int
     module procedure write_hdf_6d_char
     module procedure write_hdf_7d_dp
     module procedure write_hdf_7d_sp
     module procedure write_hdf_7d_int
     module procedure write_hdf_7d_char
     module procedure write_hdf_slice_0d_dp
     module procedure write_hdf_slice_0d_sp
     module procedure write_hdf_slice_0d_int
     module procedure write_hdf_slice_0d_char
     module procedure write_hdf_slice_1d_dp
     module procedure write_hdf_slice_1d_sp
     module procedure write_hdf_slice_1d_int
     module procedure write_hdf_slice_1d_char
     module procedure write_hdf_slice_2d_dp
     module procedure write_hdf_slice_2d_sp
     module procedure write_hdf_slice_2d_int
     module procedure write_hdf_slice_2d_char
     module procedure write_hdf_slice_3d_dp
     module procedure write_hdf_slice_3d_sp
     module procedure write_hdf_slice_3d_int
     module procedure write_hdf_slice_3d_char
     module procedure write_hdf_slice_4d_dp
     module procedure write_hdf_slice_4d_sp
     module procedure write_hdf_slice_4d_int
     module procedure write_hdf_slice_4d_char
     module procedure write_hdf_slice_5d_dp
     module procedure write_hdf_slice_5d_sp
     module procedure write_hdf_slice_5d_int
     module procedure write_hdf_slice_5d_char
     module procedure write_hdf_slice_6d_dp
     module procedure write_hdf_slice_6d_sp
     module procedure write_hdf_slice_6d_int
     module procedure write_hdf_slice_6d_char
     module procedure write_hdf_slice_7d_dp
     module procedure write_hdf_slice_7d_sp
     module procedure write_hdf_slice_7d_int
     module procedure write_hdf_slice_7d_char
  end interface

  interface slice
     module procedure slice_0d
     module procedure slice_1d
     module procedure slice_2d
     module procedure slice_3d
     module procedure slice_4d
     module procedure slice_5d
     module procedure slice_6d
     module procedure slice_7d
  end interface

contains

  ! *****************************************************
  ! Initialization and cleanup routines
  ! *****************************************************
  subroutine initialize_comm_hdf_mod
    implicit none
    logical(lgt), save :: initialized = .false.
    integer(i4b)       :: status
    if(initialized) return
    call h5open_f(status)
    call assert(status==0, 'comm_hdf_mod: Could not initialize hdf module')
    initialized = .true.
  end subroutine initialize_comm_hdf_mod

  subroutine cleanup_comm_hdf_mod
    implicit none
    integer(i4b) :: status
    call h5close_f(status)
    call assert(status==0, 'comm_hdf_mod: Could not close hdf module')
  end subroutine cleanup_comm_hdf_mod

  subroutine copy_hdf_struct(file_in, file_out)
    implicit none
    type(hdf_file), intent(in)  :: file_in
    type(hdf_file), intent(out) :: file_out

    file_out%filename   = file_in%filename
    file_out%setname    = file_in%setname
    file_out%filehandle = file_in%filehandle
    file_out%sethandle  = file_in%sethandle
    file_out%status     = file_in%status

  end subroutine copy_hdf_struct
    

  ! *****************************************************
  ! Basic file open and close routines
  ! *****************************************************
  subroutine open_hdf_file(filename, file, mode)
    implicit none
    character(len=*), intent(in) :: filename
    character(len=1), intent(in) :: mode
    type(hdf_file)               :: file

    ! Initialize
    call initialize_comm_hdf_mod

    ! Open file in either read or write mode
    file%filename = filename
    file%status   = 0
    if (mode == 'r') then
       call h5fopen_f(file%filename, H5F_ACC_RDONLY_F, file%filehandle, file%status)
    else if (mode == 'w') then
       call h5fcreate_f(file%filename, H5F_ACC_TRUNC_F, file%filehandle, file%status)
    else if (mode == 'b') then
       call h5fopen_f(file%filename, H5F_ACC_RDWR_F, file%filehandle, file%status)
    else
       write(*,*) 'comm_hdf_mod: Unknown hdf file mode =', mode
       stop
    end if

    ! Initalize sethandle to empty value
    file%setname   = ''
    file%sethandle = -1
  end subroutine open_hdf_file

  subroutine close_hdf_file(file)
    implicit none
    type(hdf_file) :: file
    call close_hdf_set(file)
    call h5fclose_f(file%filehandle, file%status)
    call assert(file%status>=0, 'comm_hdf_mod: Could not close file')
  end subroutine close_hdf_file

  subroutine open_hdf_set(file, setname)
    implicit none
    type(hdf_file)               :: file
    character(len=*), intent(in) :: setname
    if (trim(file%setname) == trim(setname)) return
    call close_hdf_set(file)
    file%setname = setname
    call h5dopen_f(file%filehandle, file%setname, file%sethandle, file%status)
  end subroutine open_hdf_set

  subroutine close_hdf_set(file)
    implicit none
    type(hdf_file) :: file
    if (file%sethandle == -1) return
    call h5dclose_f(file%sethandle, file%status)
    call assert(file%status>=0, 'comm_hdf_mod: Could not close set')
    file%sethandle = -1
    file%setname   = ''
  end subroutine close_hdf_set

  ! *****************************************************
  ! Query operations
  ! *****************************************************
  function get_rank_hdf(file, setname) result(rank)
    implicit none
    type(hdf_file)                :: file
    character(len=*), intent(in)  :: setname
    integer(i4b)                  :: rank
    integer(hid_t)                :: space
    call open_hdf_set(file, setname)
    call h5dget_space_f(file%sethandle, space, file%status)
    call h5sget_simple_extent_ndims_f(space, rank, file%status)
    call h5sclose_f(space, file%status)
  end function

  subroutine get_size_hdf(file, setname, ext)
    implicit none
    type(hdf_file)                  :: file
    character(len=*),   intent(in)  :: setname
    integer(i4b),       intent(out) :: ext(:)
    integer(i4b)                    :: rank
    integer(hid_t)                  :: space, n
    integer(hsize_t), allocatable, dimension(:) :: ext_hdf, mext_hdf
    call open_hdf_set(file, setname)
    call h5dget_space_f(file%sethandle, space, file%status)
    call h5sget_simple_extent_ndims_f(space, rank, file%status)
    allocate(ext_hdf(rank), mext_hdf(rank))
    call h5sget_simple_extent_dims_f(space, ext_hdf, mext_hdf, file%status)
    call h5sclose_f(space, file%status)
    n = min(size(ext),rank)
    ext(:n) = int(ext_hdf(:n),i4b)
    deallocate(ext_hdf, mext_hdf)
  end subroutine get_size_hdf

!!$  function hdf_group_exist(file, group)
!!$    implicit none
!!$    type(hdf_file)                  :: file
!!$    character(len=*),   intent(in)  :: group
!!$    type(hf
!!$    
!!$
!!$
!!$  end function hdf_group_exist
  
  ! *****************************************************
  ! Set read operations
  ! *****************************************************

  subroutine read_hdf_dp_2d_buffer(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(2), ext2(2)
    integer(i4b)     :: ext(2)
    real(dp), dimension(:,:), intent(out) :: val
    real(dp), dimension(:,:), allocatable :: buffer
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    allocate(buffer(ext(1),ext(2)))
    ext2 = ext
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, buffer, ext2, file%status)
    val = buffer(1:s(1),1:s(2))
    deallocate(buffer)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_int_2d_buffer(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(2), ext2(2)
    integer(i4b)     :: ext(2)
    integer(i4b), dimension(:,:), intent(out) :: val
    integer(i4b), dimension(:,:), allocatable :: buffer
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    allocate(buffer(ext(1),ext(2)))
    ext2 = ext
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, buffer, ext2, file%status)
    val = buffer(1:s(1),1:s(2))
    deallocate(buffer)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_0d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(0), ext2(0)
    integer(i4b)     :: ext(0)
    real(dp) , intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_0d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(0), ext2(0)
    integer(i4b)     :: ext(0)
    real(sp) , intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_0d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(0), ext2(0)
    integer(i4b)     :: ext(0)
    integer(i4b) , intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_0d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(0), ext2(0)
    integer(i4b)     :: ext(0)
    character(len=*) , intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_1d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(1), ext2(1)
    integer(i4b)     :: ext(1)
    real(dp) ,dimension(:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_1d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(1), ext2(1)
    integer(i4b)     :: ext(1)
    real(sp) ,dimension(:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_1d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(1), ext2(1)
    integer(i4b)     :: ext(1)
    integer(i4b) ,dimension(:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_1d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(1), ext2(1)
    integer(i4b)     :: ext(1)
    character(len=*) ,dimension(:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_2d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(2), ext2(2)
    integer(i4b)     :: ext(2)
    real(dp) ,dimension(:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_2d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(2), ext2(2)
    integer(i4b)     :: ext(2)
    real(sp) ,dimension(:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_2d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(2), ext2(2)
    integer(i4b)     :: ext(2)
    integer(i4b) ,dimension(:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_2d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(2), ext2(2)
    integer(i4b)     :: ext(2)
    character(len=*) ,dimension(:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_3d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(3), ext2(3)
    integer(i4b)     :: ext(3)
    real(dp) ,dimension(:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_3d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(3), ext2(3)
    integer(i4b)     :: ext(3)
    real(sp) ,dimension(:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_3d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(3), ext2(3)
    integer(i4b)     :: ext(3)
    integer(i4b) ,dimension(:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_3d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(3), ext2(3)
    integer(i4b)     :: ext(3)
    character(len=*) ,dimension(:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_4d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(4), ext2(4)
    integer(i4b)     :: ext(4)
    real(dp) ,dimension(:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_4d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(4), ext2(4)
    integer(i4b)     :: ext(4)
    real(sp) ,dimension(:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_4d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(4), ext2(4)
    integer(i4b)     :: ext(4)
    integer(i4b) ,dimension(:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_4d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(4), ext2(4)
    integer(i4b)     :: ext(4)
    character(len=*) ,dimension(:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_5d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(5), ext2(5)
    integer(i4b)     :: ext(5)
    real(dp) ,dimension(:,:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_5d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(5), ext2(5)
    integer(i4b)     :: ext(5)
    real(sp) ,dimension(:,:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_5d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(5), ext2(5)
    integer(i4b)     :: ext(5)
    integer(i4b) ,dimension(:,:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_5d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(5), ext2(5)
    integer(i4b)     :: ext(5)
    character(len=*) ,dimension(:,:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_6d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(6), ext2(6)
    integer(i4b)     :: ext(6)
    real(dp) ,dimension(:,:,:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_6d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(6), ext2(6)
    integer(i4b)     :: ext(6)
    real(sp) ,dimension(:,:,:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_6d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(6), ext2(6)
    integer(i4b)     :: ext(6)
    integer(i4b) ,dimension(:,:,:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_6d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(6), ext2(6)
    integer(i4b)     :: ext(6)
    character(len=*) ,dimension(:,:,:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_7d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(7), ext2(7)
    integer(i4b)     :: ext(7)
    real(dp) ,dimension(:,:,:,:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_7d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(7), ext2(7)
    integer(i4b)     :: ext(7)
    real(sp) ,dimension(:,:,:,:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_7d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(7), ext2(7)
    integer(i4b)     :: ext(7)
    integer(i4b) ,dimension(:,:,:,:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_hdf_7d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    TYPE(h5o_info_t) :: object_info
    integer(i4b) :: hdferr, v(100)
    integer(hsize_t) :: s(7), ext2(7)
    integer(i4b)     :: ext(7)
    character(len=*) ,dimension(:,:,:,:,:,:,:), intent(out) :: val
    call h5eset_auto_f(0, hdferr)
    call h5oget_info_by_name_f(file%filehandle, setname, object_info, hdferr)
    if (hdferr /= 0) then
       write(*,*) 'Warning: HDF field does not exist in '//trim(file%filename)//' = ', trim(setname)
       return
    end if
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call get_size_hdf(file, setname, ext)
    ! Validate that sizes are consistent
    if (any(ext /= s)) then
       write(*,*) 'HDF error -- inconsistent array sizes'
       write(*,*) '             Filename       = ', trim(file%filename)
       write(*,*) '             Setname        = ', trim(setname)
       write(*,*) '             HDF size       = ', ext
       write(*,*) '             Requested size = ', int(s,i4b)
       stop
    end if
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set " // setname)
  end subroutine

  subroutine read_alloc_hdf_1d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(dp) ,dimension(:), allocatable, intent(out) :: val
    integer(i4b) :: n(1)
    integer(hsize_t) :: s(1)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_1d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(sp) ,dimension(:), allocatable, intent(out) :: val
    integer(i4b) :: n(1)
    integer(hsize_t) :: s(1)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_1d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    integer(i4b) ,dimension(:), allocatable, intent(out) :: val
    integer(i4b) :: n(1)
    integer(hsize_t) :: s(1)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_1d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    character(len=*) ,dimension(:), allocatable, intent(out) :: val
    integer(i4b) :: n(1)
    integer(hsize_t) :: s(1)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_2d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(dp) ,dimension(:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(2)
    integer(hsize_t) :: s(2)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_2d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(sp) ,dimension(:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(2)
    integer(hsize_t) :: s(2)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_2d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    integer(i4b) ,dimension(:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(2)
    integer(hsize_t) :: s(2)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_2d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    character(len=*) ,dimension(:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(2)
    integer(hsize_t) :: s(2)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_3d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(dp) ,dimension(:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(3)
    integer(hsize_t) :: s(3)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_3d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(sp) ,dimension(:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(3)
    integer(hsize_t) :: s(3)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_3d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    integer(i4b) ,dimension(:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(3)
    integer(hsize_t) :: s(3)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_3d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    character(len=*) ,dimension(:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(3)
    integer(hsize_t) :: s(3)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_4d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(dp) ,dimension(:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(4)
    integer(hsize_t) :: s(4)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_4d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(sp) ,dimension(:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(4)
    integer(hsize_t) :: s(4)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_4d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    integer(i4b) ,dimension(:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(4)
    integer(hsize_t) :: s(4)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_4d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    character(len=*) ,dimension(:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(4)
    integer(hsize_t) :: s(4)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_5d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(dp) ,dimension(:,:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(5)
    integer(hsize_t) :: s(5)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4),n(5)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_5d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(sp) ,dimension(:,:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(5)
    integer(hsize_t) :: s(5)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4),n(5)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_5d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    integer(i4b) ,dimension(:,:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(5)
    integer(hsize_t) :: s(5)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4),n(5)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_5d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    character(len=*) ,dimension(:,:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(5)
    integer(hsize_t) :: s(5)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4),n(5)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_6d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(dp) ,dimension(:,:,:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(6)
    integer(hsize_t) :: s(6)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4),n(5),n(6)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_6d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(sp) ,dimension(:,:,:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(6)
    integer(hsize_t) :: s(6)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4),n(5),n(6)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_6d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    integer(i4b) ,dimension(:,:,:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(6)
    integer(hsize_t) :: s(6)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4),n(5),n(6)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_6d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    character(len=*) ,dimension(:,:,:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(6)
    integer(hsize_t) :: s(6)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4),n(5),n(6)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_7d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(dp) ,dimension(:,:,:,:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(7)
    integer(hsize_t) :: s(7)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4),n(5),n(6),n(7)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_7d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    real(sp) ,dimension(:,:,:,:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(7)
    integer(hsize_t) :: s(7)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4),n(5),n(6),n(7)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_7d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    integer(i4b) ,dimension(:,:,:,:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(7)
    integer(hsize_t) :: s(7)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4),n(5),n(6),n(7)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine

  subroutine read_alloc_hdf_7d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    character(len=*) ,dimension(:,:,:,:,:,:,:), allocatable, intent(out) :: val
    integer(i4b) :: n(7)
    integer(hsize_t) :: s(7)
    if(allocated(val)) deallocate(val)
    call get_size_hdf(file, setname, n)
    allocate(val(n(1),n(2),n(3),n(4),n(5),n(6),n(7)))
    call open_hdf_set(file, setname)
    s = int(shape(val))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, val, s, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot read data from hdf set")
  end subroutine



  subroutine read_hdf_opaque(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*),                                    intent(in)  :: setname
    byte,     allocatable, dimension(:), target, intent(out) :: val

    integer(hid_t)  :: dtype
    integer(size_t) :: len, numint
    type(c_ptr)     :: f_ptr
    call open_hdf_set(file, setname)
    call h5dget_type_f(file%sethandle, dtype, file%status)
    call h5tget_size_f(dtype, len, file%status)
    numint = len
    allocate(val(numint))
    f_ptr = c_loc(val)
    call h5dread_f(file%sethandle, dtype, f_ptr, file%status)
    call h5tclose_f(dtype, file%status)
  end subroutine read_hdf_opaque

  subroutine read_hdf_string(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    character(len=*), intent(out) :: val

    integer(i4b), parameter :: mlen=10000
    integer(hid_t)  :: filetype, space
    integer(size_t), dimension(1)  :: len
    integer(hsize_t), dimension(1:2)  :: data_dims
    integer         :: hdferr
    character(mlen), allocatable, dimension(:) :: rdata

    call open_hdf_set(file, setname)
    CALL H5Dget_type_f(file%sethandle, filetype, hdferr)
    CALL H5Dget_space_f(file%sethandle, space, hdferr)
    ALLOCATE(rdata(1))
    len=mlen
    data_dims = [mlen,1]
    CALL h5dread_vl_f(file%sethandle, filetype, rdata, data_dims, len, hdferr, space)
        val = rdata(1)
    DEALLOCATE(rdata)
    call close_hdf_set(file)
    CALL h5sclose_f(space, hdferr)
    CALL H5Tclose_f(filetype, hdferr)
    
  end subroutine read_hdf_string


  subroutine read_hdf_string2(file, setname, val, n)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in)  :: setname
    character(len=*), intent(out) :: val
    integer(i4b),     intent(out) :: n

    integer(i4b), parameter :: mlen=10000
    integer(hid_t)  :: filetype, space
    INTEGER(SIZE_T) :: size
    !integer(size_t), dimension(1)  :: len
    !integer(hsize_t), dimension(1:2)  :: data_dims
    INTEGER(HSIZE_T), DIMENSION(1:1) :: dims = (/mlen/)
    INTEGER(HSIZE_T), DIMENSION(1:1) :: maxdims
    integer         :: hdferr
    !character(len=mlen), dimension(1) :: rdata
    character(len=mlen) :: rdata

    call open_hdf_set(file, setname)
    CALL H5Dget_type_f(file%sethandle, filetype, hdferr)
    CALL H5Tget_size_f(filetype, size, hdferr)
    CALL H5Dget_space_f(file%sethandle, space, hdferr)
    CALL H5Sget_simple_extent_dims_f(space, dims, maxdims, hdferr)

    call h5dread_f(file%sethandle, filetype, rdata, dims, hdferr, H5S_ALL_F, H5S_ALL_F, H5P_DEFAULT_F)
    val = rdata(1:size)
    n   = int(size,i4b)

    call close_hdf_set(file)
    CALL h5sclose_f(space, hdferr)
    CALL H5Tclose_f(filetype, hdferr)
    
  end subroutine read_hdf_string2



  ! *****************************************************
  ! Set write operations
  ! *****************************************************

  subroutine write_hdf_0d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(dp) , intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F64LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_0d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(sp) , intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_0d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    integer(i4b) , intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_STD_I32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_0d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    character(len=*) , intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_C_S1)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_1d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(dp) ,dimension(:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F64LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_1d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(sp) ,dimension(:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_1d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    integer(i4b) ,dimension(:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_STD_I32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_1d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    character(len=*) ,dimension(:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_C_S1)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_2d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(dp) ,dimension(:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F64LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_2d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(sp) ,dimension(:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_2d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    integer(i4b) ,dimension(:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_STD_I32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_2d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    character(len=*) ,dimension(:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_C_S1)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_3d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(dp) ,dimension(:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F64LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_3d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(sp) ,dimension(:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_3d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    integer(i4b) ,dimension(:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_STD_I32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_3d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    character(len=*) ,dimension(:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_C_S1)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_4d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(dp) ,dimension(:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F64LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_4d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(sp) ,dimension(:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_4d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    integer(i4b) ,dimension(:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_STD_I32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_4d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    character(len=*) ,dimension(:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_C_S1)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_5d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(dp) ,dimension(:,:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F64LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_5d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(sp) ,dimension(:,:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_5d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    integer(i4b) ,dimension(:,:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_STD_I32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_5d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    character(len=*) ,dimension(:,:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_C_S1)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_6d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(dp) ,dimension(:,:,:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F64LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_6d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(sp) ,dimension(:,:,:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_6d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    integer(i4b) ,dimension(:,:,:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_STD_I32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_6d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    character(len=*) ,dimension(:,:,:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_C_S1)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_7d_dp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(dp) ,dimension(:,:,:,:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F64LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_7d_sp(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    real(sp) ,dimension(:,:,:,:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_IEEE_F32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_7d_int(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    integer(i4b) ,dimension(:,:,:,:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_STD_I32LE)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine

  subroutine write_hdf_7d_char(file, setname, val)
    implicit none
    type(hdf_file) :: file
    character(len=*), intent(in) :: setname
    character(len=*) ,dimension(:,:,:,:,:,:,:), intent(in) :: val
    call create_hdf_set(file, setname, shape(val), H5T_C_S1)
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, val, int(shape(val),hsize_t), file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot write data set")
  end subroutine


  ! *****************************************************
  ! Sliced set operations.
  !  These are like read/write, but the dataset is
  !  indexed with a slice. Note that the dataset must
  !  exist beforehand. Use crate_hdf_set for this.
  ! *****************************************************

  subroutine read_hdf_slice_0d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) , intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(0)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_0d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) , intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(0)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_0d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) , intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(0)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_0d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) , intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(0)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_1d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(1)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_1d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(1)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_1d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(1)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_1d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(1)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_2d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(2)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_2d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(2)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_2d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(2)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_2d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(2)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_3d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(3)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_3d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(3)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_3d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(3)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_3d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(3)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_4d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(4)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_4d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(4)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_4d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(4)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_4d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(4)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_5d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:,:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(5)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_5d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:,:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(5)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_5d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:,:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(5)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_5d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:,:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(5)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_6d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:,:,:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(6)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_6d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:,:,:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(6)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_6d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:,:,:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(6)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_6d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:,:,:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(6)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_7d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:,:,:,:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(7)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_7d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:,:,:,:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(7)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_7d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:,:,:,:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(7)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine read_hdf_slice_7d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:,:,:,:,:,:,:), intent(out) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(7)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dread_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_0d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) , intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(0)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_0d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) , intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(0)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_0d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) , intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(0)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_0d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) , intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(0)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_1d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(1)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_1d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(1)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_1d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(1)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_1d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(1)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_2d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(2)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_2d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(2)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_2d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(2)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_2d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(2)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_3d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(3)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_3d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(3)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_3d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(3)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_3d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(3)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_4d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(4)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_4d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(4)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_4d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(4)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_4d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(4)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_5d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:,:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(5)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_5d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:,:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(5)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_5d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:,:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(5)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_5d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:,:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(5)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_6d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:,:,:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(6)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_6d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:,:,:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(6)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_6d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:,:,:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(6)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_6d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:,:,:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(6)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_7d_dp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(dp) ,dimension(:,:,:,:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(7)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_DOUBLE, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_7d_sp(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    real(sp) ,dimension(:,:,:,:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(7)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_REAL, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_7d_int(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    integer(i4b) ,dimension(:,:,:,:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(7)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_INTEGER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine

  subroutine write_hdf_slice_7d_char(file, setname, slice, arr)
    implicit none
    type(hdf_file) :: file
    character(len=*),  intent(in) :: setname
    integer(i4b),      intent(in) :: slice(:,:)
    character(len=*) ,dimension(:,:,:,:,:,:,:), intent(in) :: arr
    integer(hid_t)                :: dspace, mspace
    integer(i4b),     allocatable :: ext(:)
    integer(hsize_t)              :: hslice(3,size(slice,2))
    integer(hsize_t)              :: s(7)
    ! Set up data spaces for memory and disk
    s = int(shape(arr))
    call h5screate_simple_f(size(shape(arr)), s, mspace, file%status)
    call open_hdf_set(file, setname)
    allocate(ext(get_rank_hdf(file, setname)))
    call get_size_hdf(file, setname, ext)
    call h5screate_simple_f(size(ext), int(ext,hsize_t), dspace, file%status)
    ! Specify the slice
    hslice = int(parse_hdf_slice(slice, ext),hsize_t)
    call h5sselect_hyperslab_f(dspace, H5S_SELECT_SET_F, hslice(1,:), hslice(2,:), &
     & file%status, stride=hslice(3,:))
    call h5dwrite_f(file%sethandle, H5T_NATIVE_CHARACTER, arr, s, &
     & file%status, file_space_id=dspace, mem_space_id=mspace)
    call h5sclose_f(dspace, file%status)
    call h5sclose_f(mspace, file%status)
    deallocate(ext)
  end subroutine


  ! *****************************************************
  ! Dataset creation operation
  ! *****************************************************
  subroutine create_hdf_set(file, setname, ext, type_id)
    implicit none

    type(hdf_file)                               :: file
    character(len=*),                 intent(in) :: setname
    integer(i4b),     dimension(:),   intent(in) :: ext
    integer(hid_t)                               :: type_id
    integer(hid_t) :: space
    if (trim(file%setname) /= trim(setname)) call close_hdf_set(file)
    !write(*,*) trim(file%setname), trim(setname)
    file%setname = setname
    call h5screate_simple_f(size(ext), int(ext,hsize_t), space, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot create data space, "//trim(file%filename)//', '//trim(setname))
    !write(*,*) trim(file%setname), type_id, space, file%sethandle, file%status, ext
    call h5dcreate_f(file%filehandle, file%setname, type_id, space, file%sethandle, file%status)
    !write(*,*) ' HDF status = ', file%status
    !call h5eprint_f(file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot create data set "//trim(file%filename)//', '//trim(setname))
    call h5sclose_f(space, file%status)
    call assert(file%status>=0, "comm_hdf_mod: Cannot close data space")
  end subroutine create_hdf_set

  ! Group creation. Once created, they can be used by specifying "group/dset" instead
  ! of just "dset".
  subroutine create_hdf_group(file, group)
    implicit none
    type(hdf_file)   :: file
    character(len=*) :: group
    integer(hid_t)   :: gid
    call h5gcreate_f(file%filehandle, group, gid, file%status)
    call h5gclose_f(gid, file%status)
  end subroutine

  ! **********************
  ! Helper functions
  ! **********************

  function slice_0d() result(res)
    implicit none
    integer(i4b) :: res(3,0)
    res = 0
  end function

  function slice_1d(s0) result(res)
    implicit none
    integer(i4b), dimension(:) :: s0(:)
    integer(i4b)               :: res(3,1)
    select case(size(s0))
       case(0);  res(:,1) = [1,-1,1]
       case(1);  res(:,1) = [s0(1),s0(1),1]
       case(2);  res(:,1) = [s0(1),s0(2),1]
       case(3:); res(:,1) = s0
    end select
  end function

  function slice_2d(s0,s1) result(res)
    implicit none
    integer(i4b), dimension(:) :: s0,s1
    integer(i4b)               :: res(3,2)
    res(:,1:1) = slice_1d(s0)
    res(:,2:2) = slice_1d(s1)
  end function

  function slice_3d(s0,s1,s2) result(res)
    implicit none
    integer(i4b), dimension(:) :: s0,s1,s2
    integer(i4b)               :: res(3,3)
    res(:,1:1) = slice_1d(s0)
    res(:,2:2) = slice_1d(s1)
    res(:,3:3) = slice_1d(s2)
  end function

  function slice_4d(s0,s1,s2,s3) result(res)
    implicit none
    integer(i4b), dimension(:) :: s0,s1,s2,s3
    integer(i4b)               :: res(3,4)
    res(:,1:1) = slice_1d(s0)
    res(:,2:2) = slice_1d(s1)
    res(:,3:3) = slice_1d(s2)
    res(:,4:4) = slice_1d(s3)
  end function

  function slice_5d(s0,s1,s2,s3,s4) result(res)
    implicit none
    integer(i4b), dimension(:) :: s0,s1,s2,s3,s4
    integer(i4b)               :: res(3,5)
    res(:,1:1) = slice_1d(s0)
    res(:,2:2) = slice_1d(s1)
    res(:,3:3) = slice_1d(s2)
    res(:,4:4) = slice_1d(s3)
    res(:,5:5) = slice_1d(s4)
  end function

  function slice_6d(s0,s1,s2,s3,s4,s5) result(res)
    implicit none
    integer(i4b), dimension(:) :: s0,s1,s2,s3,s4,s5
    integer(i4b)               :: res(3,6)
    res(:,1:1) = slice_1d(s0)
    res(:,2:2) = slice_1d(s1)
    res(:,3:3) = slice_1d(s2)
    res(:,4:4) = slice_1d(s3)
    res(:,5:5) = slice_1d(s4)
    res(:,6:6) = slice_1d(s5)
  end function

  function slice_7d(s0,s1,s2,s3,s4,s5,s6) result(res)
    implicit none
    integer(i4b), dimension(:) :: s0,s1,s2,s3,s4,s5,s6
    integer(i4b)               :: res(3,7)
    res(:,1:1) = slice_1d(s0)
    res(:,2:2) = slice_1d(s1)
    res(:,3:3) = slice_1d(s2)
    res(:,4:4) = slice_1d(s3)
    res(:,5:5) = slice_1d(s4)
    res(:,6:6) = slice_1d(s5)
    res(:,7:7) = slice_1d(s6)
  end function

  function parse_hdf_slice(slice, ext) result(hslice)
    implicit none
    integer(i4b), intent(in) :: slice(:,:), ext(:)
    integer(i4b)             :: hslice(3,size(slice,2))
    hslice = slice
    ! Negative indices count from the end, with -1 being the last valid index
    where(hslice([1,2],:) < 0) hslice([1,2],:) = hslice([1,2],:) + spread(ext,1,2) + 1
    ! We need to translate "to" into "count"
    hslice(2,:) = (hslice(2,:)-hslice(1,:)+hslice(3,:))/hslice(3,:)
    ! 0 based
    hslice(1,:) = hslice(1,:) - 1
  end function

end module comm_hdf_mod

