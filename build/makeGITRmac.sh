#!/bin/bash
source ../env.mac.sh

cmake -DCMAKE_CXX_FLAGS="-g" -DCMAKE_C_FLAGS="-g" \
    -DTHRUST_INCLUDE_DIR=$THRUST_DIR \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DNETCDF_CXX_INCLUDE_DIR=$NETCDFCXX4INCLUDE \
    -DNETCDF_CXX_LIBRARY=$NETCDFLIB_CPP \
    -DNETCDF_DIR=$NETCDFDIR \
    -DNETCDF_INCLUDE_DIR=$NETCDFINCLUDE \
    -DNETCDF_LIBRARY=$NETCDFLIB \
    -DNETCDF_CXX_INCLUDE_DIR=$NETCDFCXX4INCLUDE \
    -DLIBCONFIGPP_INCLUDE_DIR=$LIBCONFIGPP_INCLUDE \
    -DBoost_DIR=$Boost_DIR \
    -DBoost_INCLUDE_DIR=$Boost_INCLUDE_DIR \
    -DUSE_CUDA=0 \
    -DUSEMPI=0 \
    -DUSE_MPI=1 \
    -DUSE_OPENMP=0 \
    -DUSE_BOOST=1 \
    -DUSEIONIZATION=1 \
    -DUSERECOMBINATION=1 \
    -DUSEPERPDIFFUSION=1 \
    -DUSECOULOMBCOLLISIONS=1 \
    -DUSEFRICTION=0 \
    -DUSEANGLESCATTERING=0 \
    -DUSEHEATING=0 \
    -DUSEPARDIFFUSION=0 \
    -DUSETHERMALFORCE=0 \
    -DUSESURFACEMODEL=0 \
    -DUSESHEATHEFIELD=1 \
    -DBIASED_SURFACE=0 \
    -DUSEPRESHEATHEFIELD=0 \
    -DBFIELD_INTERP=2 \
    -DLC_INTERP=0 \
    -DGENERATE_LC=0 \
    -DEFIELD_INTERP=0 \
    -DPRESHEATH_INTERP=0 \
    -DDENSITY_INTERP=2 \
    -DTEMP_INTERP=2 \
    -DFLOWV_INTERP=0 \
    -DGRADT_INTERP=0 \
    -DODEINT=0 \
    -DFIXEDSEEDS=1 \
    -DPARTICLESEEDS=1 \
    -DGEOM_TRACE=0 \
    -DGEOM_HASH=0 \
    -DGEOM_HASH_SHEATH=0 \
    -DPARTICLE_TRACKS=1 \
    -DPARTICLE_SOURCE_SPACE=0 \
    -DPARTICLE_SOURCE_ENERGY=0 \
    -DPARTICLE_SOURCE_ANGLE=0 \
    -DPARTICLE_SOURCE_FILE=0 \
    -DSPECTROSCOPY=2 \
    -DUSE3DTETGEOM=0 \
    -DUSECYLSYMM=1 \
    -DUSEFIELDALIGNEDVALUES=0 \
    -DFLUX_EA=1 \
    -DFORCE_EVAL=0 \
    -DUSE_SORT=0 \
    -DCHECK_COMPATIBILITY=1 \
    ..
