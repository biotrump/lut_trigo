#!/bin/bash
mkdir -p build
pushd build
cmake ..
if [ $? != 0 ]; then
	echo "cmake error"
	exit -1
fi
make
if [ $? != 0 ]; then
	echo "make error"
	exit -1
fi

#the f90.f90 is the sine,cosine lookup table!
if [ -f bin/c2f_lut ]; then
	./bin/c2f_lut > trigo_lut.f90
	cat ../lut.f90 >> trigo_lut.f90
	echo "building trigo_lut.f90"
	gfortran -o test_lut  ../test_lt.F90 trigo_lut.f90
	if [ $? != 0 ]; then
		echo "make test_lut error"
		exit -1
	fi
	echo "running sine, cosine lut test"
	./test_lut
	if [ $? == 0 ]; then
		cp trigo_lut.f90 ..
	fi
fi
popd
