cmake_minimum_required(VERSION 2.8.10)
project(C2F_LUT Fortran C CXX)

set(C2F_LUT_VERSION 6.0.0)

if("${CMAKE_BUILD_TYPE}" MATCHES "Debug")
  add_definitions(-DDEBUG)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O0 -fPIC")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99 -g -O0 -fPIC -D_POSIX_C_SOURCE=200112L")
else("${CMAKE_BUILD_TYPE}" MATCHES "Debug")
  add_definitions(-DARMA_NO_DEBUG)
  add_definitions(-DNDEBUG)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fPIC")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99 -O3 -fPIC -D_POSIX_C_SOURCE=200112L")
endif("${CMAKE_BUILD_TYPE}" MATCHES "Debug")


message ("*** Fortran compiler: " ${Fortran_COMPILER_NAME})
if (UNIX)
#unix, linux
	if ( "${CMAKE_Fortran_COMPILER}" MATCHES "ifort" )
		set( CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fltconsistency -fp_port" )
	endif ()
	if ( "${CMAKE_Fortran_COMPILER}" MATCHES "xlf" )
		set( CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -qnosave -qstrict=none" )
	endif ()
	# Delete libmtsk in linking sequence for Sun/Oracle Fortran Compiler.
	# This library is not present in the Sun package SolarisStudio12.3-linux-x86-bin
	STRING(REPLACE \;mtsk\; \; CMAKE_Fortran_IMPLICIT_LINK_LIBRARIES "${CMAKE_Fortran_IMPLICIT_LINK_LIBRARIES}")
endif ()
message ("*** Fortran compiler RELEASE FLAGS: " ${CMAKE_Fortran_FLAGS_RELEASE})
message ("*** Fortran compiler DEBUG FLAGS: " ${CMAKE_Fortran_FLAGS_DEBUG})

# --------------------------------------------------
# Testing

enable_testing()
#BUILD_TESTING is turned ON by enable_testing()
include(CTest)
enable_testing()
# --------------------------------------------------

# Organize output files.  On Windows this also keeps .dll files next
# to the .exe files that need them, making tests easy to run.
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${C2F_LUT_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${C2F_LUT_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${C2F_LUT_BINARY_DIR}/lib)

add_executable(c2f_lut c2f_lut.c)
target_link_libraries(c2f_lut
	m)

#add_executable(test_lut c2f_lut.c)
#target_link_libraries(c2f_lut
#	m)

