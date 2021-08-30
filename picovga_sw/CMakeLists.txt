# Generated Cmake Pico project file

cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# initalize pico_sdk from installed location
# (note this can come from environment, CMake cache etc)
set(PICO_SDK_PATH "C:/Users/Anton/Documents/Pico/pico-sdk")

# Pull in Raspberry Pi Pico SDK (must be before project)
include(pico_sdk_import.cmake)

project(picovga_sw C CXX ASM)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()

# Add executable. Default name is the project name, version 0.1

add_executable(picovga_sw picovga_sw.c )

pico_set_program_name(picovga_sw "picovga_sw")
pico_set_program_version(picovga_sw "0.1")

pico_enable_stdio_uart(picovga_sw 0)
pico_enable_stdio_usb(picovga_sw 1)

# Add the standard library to the build
target_link_libraries(picovga_sw pico_stdlib)

# Add any user requested libraries
target_link_libraries(picovga_sw
        hardware_pio
        )

pico_add_extra_outputs(picovga_sw)

