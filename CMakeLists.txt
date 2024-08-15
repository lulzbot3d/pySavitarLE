cmake_policy(SET CMP0091 NEW)
project(pysavitarle)
cmake_minimum_required(VERSION 3.20)

find_package(cpython REQUIRED)
find_package(savitarle REQUIRED)

find_package(standardprojectsettings REQUIRED)
find_package(sipbuildtool REQUIRED)

add_library(pySavitarLE INTERFACE)
use_threads(pySavitarLE)

target_include_directories(pySavitarLE
        INTERFACE
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/>
        )
target_link_libraries(pySavitarLE INTERFACE savitarle::savitarle cpython::cpython)
add_sip_module(pySavitarLE)
install_sip_module(pySavitarLE)

