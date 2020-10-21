#==============================================================================
# Project: HEALPix 
# File which contains setup for current project 
# Author: Maksym Brilenkov
#==============================================================================

message(STATUS "---------------------------------------------------------------")
if(NOT HEALPIX_FORCE_COMPILE)
	find_package(HEALPIX 3.70 COMPONENTS SHARP Fortran)
endif()

if(NOT HEALPIX_FOUND)
	# Writing this to be consistent with fftw.cmake, otherwise 
	# the if statement is unnecessary.
	if(NOT HEALPIX_Fortran_FOUND)
		message(STATUS "Missing component - Fortran - will be compiled from source")	
	endif()
	# Creating configure command for HEALPix
	# Below flags used to configure Libsharp as part of HEALPix
	if(CMAKE_Fortran_COMPILER_ID MATCHES Intel)
		set(healpix_sharp2_C_FLAGS "-O3 -ffast-math -march=native -std=c99 -DUSE_MPI -qopenmp")
	elseif(CMAKE_Fortran_COMPILER_ID MATCHES GNU)
		set(healpix_sharp2_C_FLAGS "-O3 -ffast-math -march=native -std=c99 -DUSE_MPI -fopenmp")
	elseif(CMAKE_Fortran_COMPILER_ID MATCHES PGI)
		set(healpix_sharp2_C_FLAGS "-O4 -fast -Mipa=fast,inline -Msmartalloc -std=c99 -DUSE_MPI -mp")
	endif()
	set(healpix_configure_command 
		"${CMAKE_COMMAND}" "-E" "env" 
		"FITSDIR=${CMAKE_LIBRARY_OUTPUT_DIRECTORY}"
		"FITSINC=${CMAKE_INSTALL_PREFIX}/include"
		"FC=${COMMANDER3_Fortran_COMPILER}" 
		"CXX=${COMMANDER3_CXX_COMPILER}" 
		"CPP=${COMMANDER3_CPP_COMPILER}" 
		"CC=${COMMANDER3_C_COMPILER}" 
		"SHARP_COPT=${healpix_sharp2_C_FLAGS}"
		"./configure" 
		"--auto=f90" #${healpix_components}" #profile,f90,c,cxx;" 
		)
	#------------------------------------------------------------------------------
	# Getting Healpix from source
	ExternalProject_Add(${project}
		URL "${${project}_url}"
		URL_MD5 "${${project}_md5}"
		PREFIX "${CMAKE_DOWNLOAD_DIRECTORY}/${project}"
		DOWNLOAD_DIR "${CMAKE_DOWNLOAD_DIRECTORY}"
		#SOURCE_DIR "${download_dir}/${project}/src/${project}"
		BINARY_DIR "${CMAKE_DOWNLOAD_DIRECTORY}/${project}/src/${project}" 
		INSTALL_DIR "${CMAKE_INSTALL_PREFIX}"
		LOG_DIR "${CMAKE_LOG_DIR}"
		LOG_DOWNLOAD ON
		LOG_CONFIGURE ON
		LOG_BUILD ON
		LOG_INSTALL ON
		BUILD_ALWAYS FALSE
		# commands how to build the project
		CONFIGURE_COMMAND "${${project}_configure_command}"
		# making healpix to be installed the last before commander3
		DEPENDS cfitsio 
						#hdf5 
						#sharp2 
						#fftw 
						#fftw_double 
						#fftw_float 
						#doxygen 
						#tempita 
						#blas 
						#openmp 
						#curl 
						#mpi 
						#zlib
		#
		INSTALL_COMMAND ""
		# copying Healpix and all its files (src and compiled) into CMAKE_INSTALL_PREFIX directory
		#COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_DOWNLOAD_DIRECTORY}/${project}/src/${project}" "${CMAKE_INSTALL_PREFIX}/healpix"
		COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_DOWNLOAD_DIRECTORY}/${project}/src/${project}" "${HEALPIX_INSTALL_PREFIX}"
		)

	#ExternalProject_Add_Step(${project} ${project}_copy_step
	#		COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_DOWNLOAD_DIRECTORY}/${project}/src/${project}" "${HEALPIX_INSTALL_PREFIX}"
	#	ALWAYS FALSE
	#		)
	#ExternalProject_Add_StepTargets(${project} ${project}_copy_step)

	#set(HEALPIX_LIBRARIES 
	#	${CMAKE_INSTALL_PREFIX}/healpix/lib/${CMAKE_STATIC_LIBRARY_PREFIX}sharp${CMAKE_STATIC_LIBRARY_SUFFIX}
	#	${CMAKE_INSTALL_PREFIX}/healpix/lib/${CMAKE_STATIC_LIBRARY_PREFIX}${project}${CMAKE_STATIC_LIBRARY_SUFFIX}
	#	)
	set(HEALPIX_LIBRARIES 
		${HEALPIX_INSTALL_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}sharp${CMAKE_STATIC_LIBRARY_SUFFIX}
		${HEALPIX_INSTALL_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}${project}${CMAKE_STATIC_LIBRARY_SUFFIX}
		)
	#include_directories("${CMAKE_INSTALL_PREFIX}/healpix/include")
	include_directories("${HEALPIX_INSTALL_PREFIX}/include")
	message(STATUS "HEALPIX LIBRARIES will be: ${HEALPIX_LIBRARIES}")
else()
	add_custom_target(${project} ALL "")
	message(STATUS "HEALPIX LIBRARIES are: ${HEALPIX_LIBRARIES}")
	include_directories("${HEALPIX_INCLUDE_DIRS}")
endif()
