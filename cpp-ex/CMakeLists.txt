cmake_minimum_required(VERSION 3.10)
project(adventCpp)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(nlohmann_json REQUIRED)

set(SOURCES
    src/main.cpp
    src/advent/ex_0.cpp
    src/advent/testJsonLib.cpp
    src/advent/testEnvFile.cpp
    src/utils/utils.cpp
    src/utils/globals.cpp
)

add_executable(adventCpp ${SOURCES})

target_link_libraries(adventCpp PRIVATE nlohmann_json::nlohmann_json)

target_include_directories(adventCpp PRIVATE
    src/
    src/advent/
    src/utils/
    # third-libs/nlohmann/
)