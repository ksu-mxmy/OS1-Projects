# This is used by GitHub Actions to build and test the project
cmake_minimum_required(VERSION 3.22)
project(ProjectSpace)

include(CTest)
enable_testing()
add_subdirectory(module)
