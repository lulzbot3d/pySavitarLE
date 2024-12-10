cmake_minimum_required(VERSION 3.20)
project(pysavitarle)
cmake_policy(SET CMP0091 NEW)

find_package(Python REQUIRED)
find_package(savitar REQUIRED)

find_package(standardprojectsettings REQUIRED)
find_package(sipbuildtool REQUIRED)

add_library(pySavitar INTERFACE)
use_threads(pySavitar)

target_include_directories(pySavitar
        INTERFACE
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/>
        )
target_link_libraries(pySavitar INTERFACE savitar::savitar cpython::cpython)
add_sip_module(pySavitar)
install_sip_module(pySavitar)

