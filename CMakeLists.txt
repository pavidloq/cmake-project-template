# Disable in-source builds
if(${CMAKE_CURRENT_SOURCE_DIR} STREQUAL ${CMAKE_CURRENT_BINARY_DIR})
  message(FATAL_ERROR "Prevented in-tree build. Please create a build directory outside of the source code and run \"cmake -S ${CMAKE_SOURCE_DIR} -B .\" from there!")
endif()


# Project setup
cmake_minimum_required(VERSION 3.25.1)

set(PROJECT_NAME TemplateProject)

project(${PROJECT_NAME} LANGUAGES CXX VERSION "0.0.1")


# C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


# IDE options
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER "cmake-predefined-targets")


# Project options
option(LIBRARY_BUILD_SHARED "Build library as shared library" OFF)

# Projects
add_subdirectory(library)
add_subdirectory(executable)
