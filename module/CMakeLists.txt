cmake_minimum_required(VERSION 3.22)
set(moduleName "module")
project(${moduleName})

include(CTest)
enable_testing()
add_subdirectory(test)

# Add your source files here
set(SOURCES
  src/${moduleName}.c
)

# Add your include directories here
include_directories(
  include/${moduleName}.h
)

# Add your library dependencies here
# find_package(stdio REQUIRED)

# Add your executable target here
# add_executable(${moduleName} ${SOURCES})

# Link your libraries here
# target_link_libraries(MyExecutable PRIVATE Threads::Threads)
