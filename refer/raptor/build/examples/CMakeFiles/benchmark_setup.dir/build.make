# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zhangxin/draft/multgrid/raptor

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zhangxin/draft/multgrid/raptor/build

# Include any dependencies generated for this target.
include examples/CMakeFiles/benchmark_setup.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/CMakeFiles/benchmark_setup.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/benchmark_setup.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/benchmark_setup.dir/flags.make

examples/CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.o: examples/CMakeFiles/benchmark_setup.dir/flags.make
examples/CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.o: ../examples/benchmark_setup.cpp
examples/CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.o: examples/CMakeFiles/benchmark_setup.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhangxin/draft/multgrid/raptor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.o"
	cd /home/zhangxin/draft/multgrid/raptor/build/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.o -MF CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.o.d -o CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.o -c /home/zhangxin/draft/multgrid/raptor/examples/benchmark_setup.cpp

examples/CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.i"
	cd /home/zhangxin/draft/multgrid/raptor/build/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhangxin/draft/multgrid/raptor/examples/benchmark_setup.cpp > CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.i

examples/CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.s"
	cd /home/zhangxin/draft/multgrid/raptor/build/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhangxin/draft/multgrid/raptor/examples/benchmark_setup.cpp -o CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.s

# Object files for target benchmark_setup
benchmark_setup_OBJECTS = \
"CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.o"

# External object files for target benchmark_setup
benchmark_setup_EXTERNAL_OBJECTS =

examples/benchmark_setup: examples/CMakeFiles/benchmark_setup.dir/benchmark_setup.cpp.o
examples/benchmark_setup: examples/CMakeFiles/benchmark_setup.dir/build.make
examples/benchmark_setup: lib/libraptor.so
examples/benchmark_setup: /home/zhangxin/openmpi/lib/libmpi.so
examples/benchmark_setup: /usr/lib/x86_64-linux-gnu/liblapack.so.3
examples/benchmark_setup: /usr/lib/x86_64-linux-gnu/libblas.so.3
examples/benchmark_setup: examples/CMakeFiles/benchmark_setup.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhangxin/draft/multgrid/raptor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable benchmark_setup"
	cd /home/zhangxin/draft/multgrid/raptor/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/benchmark_setup.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/benchmark_setup.dir/build: examples/benchmark_setup
.PHONY : examples/CMakeFiles/benchmark_setup.dir/build

examples/CMakeFiles/benchmark_setup.dir/clean:
	cd /home/zhangxin/draft/multgrid/raptor/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/benchmark_setup.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/benchmark_setup.dir/clean

examples/CMakeFiles/benchmark_setup.dir/depend:
	cd /home/zhangxin/draft/multgrid/raptor/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhangxin/draft/multgrid/raptor /home/zhangxin/draft/multgrid/raptor/examples /home/zhangxin/draft/multgrid/raptor/build /home/zhangxin/draft/multgrid/raptor/build/examples /home/zhangxin/draft/multgrid/raptor/build/examples/CMakeFiles/benchmark_setup.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/benchmark_setup.dir/depend

