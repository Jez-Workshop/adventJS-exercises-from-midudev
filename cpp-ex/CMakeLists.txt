cmake_minimum_required(VERSION 3.20)
project(adventCpp)

set(CMAKE_CXX_STANDARD 20)

# List all source files manually
set(SOURCES
    src/main.cpp
    src/adventExamples/ex-0.cpp
    src/adventExamples/getExample2Execute.cpp
)

# add_executable(myFirstCppCode src/main.cpp)
add_executable(adventCpp ${SOURCES})

# Include folders for header search paths
target_include_directories(adventCpp PRIVATE
    src/
    src/adventExamples/
)