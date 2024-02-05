cmake_minimum_required(VERSION 3.5)
project(module)
set(p_name module)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "-std=c++0x -g -Wall -Werror")
set(CMAKE_C_FLAGS "-std=c11 -g -Wall -Wextra")

if (NOT CMAKE_SYSTEM_VERSION STREQUAL "3.10.0-1160.108.1.el7.x86_64")
    set(GTest_DIR /usr/local/vcpkg/installed/x64-linux/share/gtest/)
    find_package(GTest CONFIG REQUIRED)
    include_directories(${GTEST_INCLUDE_DIRS})
    add_executable(${p_name}_test test/tests.cpp src/${p_name}.c)
    target_link_libraries(${p_name}_test GTest::gtest GTest::gtest_main pthread)
else()
    add_executable(${p_name}_test test/tests.cpp src/${p_name}.c)
    target_link_libraries(${p_name}_test gtest pthread)

endif()

enable_testing()
add_test(NAME    ${p_name}_test
         COMMAND ${p_name}_test)
