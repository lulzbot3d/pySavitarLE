cmake_minimum_required(VERSION 3.20)
project(pysavitarle)

# Set LC_LIBRARY_PATH variable to ensure CMake can actually use the CPython library
set(ENV{LD_LIBRARY_PATH} "${CMAKE_LIBRARY_PATH}:${LD_LIBRARY_PATH}")
find_package(Python3 REQUIRED)
find_package(savitarle REQUIRED)

find_package(standardprojectsettings REQUIRED)
find_package(sipbuildtool REQUIRED)

add_library(pySavitar INTERFACE)
use_threads(pySavitar)

target_include_directories(pySavitar
        INTERFACE
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/>
        )
target_link_libraries(pySavitar INTERFACE savitarle::savitarle cpython::cpython)
add_sip_module(pySavitar)
install_sip_module(pySavitar)

