# SDL library
URL_OR_FILE(  "${PROJECT_DOWNLOAD_DIR}/SDL2-${SDL2_VERSION}.tar.gz"
              "http://www.libsdl.org/release/SDL2-${SDL2_VERSION}.tar.gz" 
)

set(SDL2_INSTALL_PREFIX      ${CMAKE_BINARY_DIR}/external-libs/installed)
set(SDL2_INCLUDE_DIR ${SDL2_INSTALL_PREFIX}/${CMAKE_INSTALL_INCLUDEDIR}/include/SDL2)
set(SDL2_LIB_DIR     ${SDL2_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/lib)

ExternalProject_Add(SDL2-external
  URL ${CURL}
  PREFIX ${SDL2_INSTALL_PREFIX}/source-tree
  URL_MD5 6ff7cbe9f77fc5afa79d54895dc6becc
  DOWNLOAD_DIR ${PROJECT_DOWNLOAD_DIR}
  CMAKE_ARGS 
        -DCMAKE_INSTALL_PREFIX=${SDL2_INSTALL_PREFIX}
        -DBUILD_SHARED_LIBS:BOOL=OFF
        -DCMAKE_BUILD_TYPE=Release
  UPDATE_DISCONNECTED ON
)

add_dependencies(external_all SDL2-external)
