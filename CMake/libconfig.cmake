# Add libconfig

set( LIBCONFIG_INCLUDE_DIR 
     "${prefix}/libconfig_install/include" 
     CACHE PATH "" FORCE )

set( LIBCONFIG_LIBRARY 
     "${prefix}/libconfig_install/lib/libconfig${suffix}" 
     CACHE FILEPATH "" FORCE )

set( LIBCONFIGPP_INCLUDE_DIR 
     "${prefix}/libconfig_install/include" 
     CACHE PATH "" FORCE )


set( LIBCONFIGPP_LIBRARY
     "${prefix}/libconfig_install/lib/libconfig++${suffix}" 
     CACHE FILEPATH "" FORCE )

if( NOT EXISTS ${LIBCONFIG_INCLUDE_DIR} OR
    NOT EXISTS ${LIBCONFIGPP_LIBRARY} OR
    NOT EXISTS ${LIBCONFIGPP_INCLUDE_DIR} OR
    NOT EXISTS ${LIBCONFIG_LIBRARY} )

  message( "libconfig will be downloaded..." )

  set( libconfig_url "https://github.com/hyperrealm/libconfig.git" )

  if( EXISTS ${prefix}/libconfig )

    set( download_command "" )

  else()

    set( download_command 
         git clone --depth 1 --branch v1.7.3
         ${libconfig_url}
         ${prefix}/libconfig )

  endif()

  set( configure_command
       ${CMAKE_COMMAND}
       -S ${prefix}/libconfig
       -B ${prefix}/libconfig_build
       -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
       -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
       -DCMAKE_INSTALL_PREFIX=${prefix}/libconfig_install )

    ExternalProject_Add( libconfig_download
                         PREFIX ${prefix}
                         DOWNLOAD_COMMAND ${download_command}
                         CONFIGURE_COMMAND ${configure_command}
                         BUILD_BYPRODUCTS ${LIBCONFIG_LIBRARY} ${LIBCONFIGPP_LIBRARY}
                         BUILD_COMMAND ${CMAKE_COMMAND} --build ${prefix}/libconfig_build -- -j
                         INSTALL_COMMAND ${CMAKE_COMMAND} --install ${prefix}/libconfig_build ) 

endif()

add_library( libconfig INTERFACE )

if( TARGET libconfig_download )

  add_dependencies( libconfig libconfig_download )

endif()

include_directories( ${LIBCONFIG_INCLUDE_DIR} )

include_directories( ${LIBCONFIGPP_INCLUDE_DIR} )

target_include_directories( libconfig INTERFACE 
                            ${LIBCONFIG_INCLUDE_DIR}
                            ${LIBCONFIGPP_INCLUDE_DIR} )

target_link_libraries( libconfig INTERFACE
                       ${LIBCONFIG_LIBRARY}
                       ${LIBCONFIGPP_LIBRARY} )
