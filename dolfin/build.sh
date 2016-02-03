#!/bin/bash

mkdir build
cd build

CC=$PREFIX/bin/cc
CXX=$PREFIX/bin/c++

export LIBRARY_PATH=$PREFIX/lib
export INCLUDE_PATH=$PREFIX/include

export BLAS_DIR=$LIBRARY_PATH

cmake .. \
  -DDOLFIN_ENABLE_VTK:BOOL=TRUE \
  -DDOLFIN_ENABLE_QT:BOOL=FALSE \
\
  -DCMAKE_C_COMPILER=$CC \
  -DCMAKE_CXX_COMPILER=$CXX \
\
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_INCLUDE_PATH=$INCLUDE_PATH \
  -DCMAKE_LIBRARY_PATH=$LIBRARY_PATH \
\
  -DBoost_INCLUDE_DIR=$INCLUDE_PATH \
  -DBoost_LIBRARY_DIRS=$LIBRARY_PATH \
  -DBoost_FILESYSTEM_LIBRARY=$LIBRARY_PATH/libboost_filesystem.so \
\
  -DMPI_C_LIBRARIES=$LIBRARY_PATH/libmpich.so \
  -DMPI_C_INCLUDE_PATH=$INCLUDE_PATH \
  -DMPI_CXX_LIBRARIES=$LIBRARY_PATH/libmpichcxx.so \
  -DMPI_CXX_INCLUDE_PATH=$INCLUDE_PATH \
  -DMPI_Fortran_LIBRARIES=$LIBRARY_PATH/libmpichf90.so \
  -DMPI_Fortran_INCLUDE_PATH=$INCLUDE_PATH

make -j${CPU_COUNT}
make install
