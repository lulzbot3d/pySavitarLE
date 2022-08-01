cmake_policy(SET CMP0091 NEW)

project(pysavitar)
cmake_minimum_required(VERSION 3.20)
include(cmake/StandardProjectSettings.cmake)
include(cmake/SIPMacros.cmake)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

find_package(cpython ${PYTHON_VERSION} REQUIRED)
find_package(savitar REQUIRED)

add_library(pysavitar INTERFACE)
set_project_warnings(pysavitar)

target_include_directories(pysavitar
        INTERFACE
            $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
            $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/src/>
        )

target_link_libraries(pysavitar INTERFACE savitar::savitar cpython::cpython)

add_sip_module(pysavitar)

if(Python_SITELIB_LOCAL)
    install_sip_module(pysavitar ${Python_SITELIB_LOCAL})
else()
    install_sip_module(pysavitar)
endif()
