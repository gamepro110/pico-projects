cmake_minimum_required(VERSION 3.18)
include_guard(GLOBAL)

function(addProgram exeName LibList)
    file(
        GLOB_RECURSE
        ${exeName}_src
        "src/*.cpp"
        "src/*.h"
    )

    add_executable(
        ${exeName}
        ${${exeName}_src}
    )

    target_include_directories(
        ${exeName}
        PUBLIC
        "$ENV{PICO_SDK_PATH}/src/rp2_common/**/include/"
    )

    target_link_libraries(
        ${exeName}
        pico_stdlib
        ${LibList}
    )

    # enable usb output, disable uart output
    pico_enable_stdio_usb(${exeName} 1)
    pico_enable_stdio_uart(${exeName} 0)

    pico_add_extra_outputs(
        ${exeName}
    )
endfunction(addProgram exeName LibList)
