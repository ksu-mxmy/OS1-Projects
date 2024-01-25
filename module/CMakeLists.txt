cmake_minimum_required (VERSION 3.5)
project(module)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "-std=c++0x -g -Wall -Werror")
set(CMAKE_C_FLAGS "-std=c11 -g -Wall -Wextra")

if (CMAKE_SYSTEM_VERSION STREQUAL "6.2.0-1018-azure") # this runs on github codespaces
  set(GTest_DIR /usr/local/vcpkg/installed/x64-linux/share/gtest/)
  find_package(GTest CONFIG REQUIRED)
  include_directories(${GTEST_INCLUDE_DIRS})
endif()

add_executable(${PROJECT_NAME}_test test/tests.cpp src/${PROJECT_NAME}.c)
target_link_libraries(${PROJECT_NAME}_test GTest::gtest GTest::gtest_main pthread)

enable_testing()
add_test(NAME    ${PROJECT_NAME}_test
         COMMAND ${PROJECT_NAME}_test)
