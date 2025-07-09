cmake_minimum_required(VERSION 3.10)
project(adventCpp)

set(CMAKE_CXX_STANDARD 17)

set(SOURCES
    src/main.cpp
    src/advent/ex_0.cpp
    src/advent/getEx.cpp
)

add_executable(adventCpp ${SOURCES})


target_include_directories(adventCpp PRIVATE
    src/
    src/advent/
)