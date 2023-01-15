# blink (build-in) led

include(${PROJECT_SOURCE_DIR}/addProgram.cmake)

if (${PICO_BOARD} STREQUAL "pico")
    addProgram("blink" "")
endif()
