# blink (build-in) led

include(${PROJECT_SOURCE_DIR}/addProgram.cmake)

if (${PICO_BOARD} STREQUAL "pico_w")
    addProgram("blink" "pico_cyw43_arch_none")
endif()
