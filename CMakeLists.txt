cmake_policy(SET CMP0091 NEW)

project(pySavitar)
cmake_minimum_required(VERSION 3.20)
include(cmake/StandardProjectSettings.cmake)
include(cmake/SIPMacros.cmake)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

find_package(cpython ${PYTHON_VERSION} REQUIRED)
find_package(savitar REQUIRED)

add_library(pySavitar INTERFACE)
set_project_warnings(pySavitar)

target_include_directories(savitar
        INTERFACE
            $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
            $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/src/>
        )

target_link_libraries(pySavitar INTERFACE savitar::savitar cpython::cpython)

add_sip_module(pySavitar)

if(Python_SITELIB_LOCAL)
    install_sip_module(pySavitar ${Python_SITELIB_LOCAL})
else()
    install_sip_module(pySavitar)
endif()
