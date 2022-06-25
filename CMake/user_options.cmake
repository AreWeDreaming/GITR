# String description for each option
set( description "(no description added - see define_options.cmake)" )
set( GITR_USE_CUDA 1 CACHE STRING "${description}" FORCE )
set( GITR_USE_OPENMP 0 CACHE STRING "${description}" FORCE )
set( GITR_USE_MPI 0 CACHE STRING "${description}" FORCE )
set( GITR_USE_DOUBLE 1 CACHE STRING "${description}" FORCE )
set( GITR_USE_IONIZATION 1 CACHE STRING "${description}" FORCE ) # if ionization is on, recombination on

add_compile_definitions( 
        USE_CUDA=${GITR_USE_CUDA}
        USE_MPI=${GITR_USE_MPI}
        USE_OPENMP=${GITR_USE_OPENMP}
	      USE_DOUBLE=${GITR_USE_DOUBLE}
        LC_INTERP=0
        GENERATE_LC=0
        ODEINT=0 )
