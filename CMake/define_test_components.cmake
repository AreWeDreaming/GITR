# define test components - CMake "targets" - as separate compilation components
include( CTest ) 

enable_testing()

set( non_gpu_test_targets
     slow_math_tests
     interpolator_tests
     config_interface_tests )

# atomic tests does not compile and is disabled
set( gpu_test_targets
     file_io_tests
     coulomb_tests 
     field_tests
     atomic_tests 
     boris_tests
     cross_field_diffusion_tests )

if( NOT GITR_USE_CUDA )

  set( non_gpu_test_targets ${non_gpu_test_targets} ${gpu_test_targets} )

endif()

foreach( component IN LISTS non_gpu_test_targets )

  add_executable( ${component} test_src/${component}.cpp )

  add_test( NAME ${component} COMMAND ${component} )

  target_include_directories( ${component} PUBLIC include test_include )

endforeach()

if( GITR_USE_CUDA )

  foreach( component IN LISTS gpu_test_targets )

    add_executable( ${component} test_src/${component}.cpp )

    add_test( NAME ${component} COMMAND ${component} )

    target_include_directories( ${component} PUBLIC include test_include )

    set_source_files_properties( test_src/${component}.cpp PROPERTIES LANGUAGE CUDA )

    set_target_properties( ${component} PROPERTIES COMPILE_FLAGS "-dc" )

    set_target_properties( ${component} PROPERTIES CUDA_RESOLVE_DEVICE_SYMBOLS ON )

    target_compile_options( ${component} PUBLIC --expt-relaxed-constexpr )

  endforeach()

endif()

# Captain! system tests
# add simple system tests
add_test(NAME sample_test COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/examples/sft_a/test.py WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/examples/sft_a )


