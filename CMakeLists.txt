cmake_minimum_required(VERSION 3.18)

set(PICO_SDK_PATH $ENV{HOME}/pico-sdk/)
include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

project(pico-projects)

set(CMAKE_C_STANDARD 17)
set(CMAKE_CXX_STANDARD 20)

set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

pico_sdk_init()

add_subdirectory(test)
add_subdirectory(utility)
add_subdirectory(blink)