cmake_minimum_required(VERSION 3.18)

set(PICO_BOARD "pico" CACHE STRING "select which rp2040 board is used for compiling")
set_property(CACHE PICO_BOARD PROPERTY STRINGS pico pico_w)

set(PICO_SDK_PATH $ENV{HOME}/pico-sdk/)
include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

project(pico-projects)

set(CMAKE_C_STANDARD 17)
set(CMAKE_CXX_STANDARD 20)

set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

pico_sdk_init()

if(NOT TARGET tinyusb_device)
    message(ERROR "TunyUSB submodule is not initialized in the sdk")
endif(NOT TARGET tinyusb_device)

add_subdirectory(test)
add_subdirectory(utility)
add_subdirectory(blink)
