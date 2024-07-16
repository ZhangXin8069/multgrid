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
include raptor/util/tests/CMakeFiles/test_spmv_random.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include raptor/util/tests/CMakeFiles/test_spmv_random.dir/compiler_depend.make

# Include the progress variables for this target.
include raptor/util/tests/CMakeFiles/test_spmv_random.dir/progress.make

# Include the compile flags for this target's objects.
include raptor/util/tests/CMakeFiles/test_spmv_random.dir/flags.make

raptor/util/tests/CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.o: raptor/util/tests/CMakeFiles/test_spmv_random.dir/flags.make
raptor/util/tests/CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.o: ../raptor/util/tests/test_spmv_random.cpp
raptor/util/tests/CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.o: raptor/util/tests/CMakeFiles/test_spmv_random.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhangxin/draft/multgrid/raptor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object raptor/util/tests/CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.o"
	cd /home/zhangxin/draft/multgrid/raptor/build/raptor/util/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT raptor/util/tests/CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.o -MF CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.o.d -o CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.o -c /home/zhangxin/draft/multgrid/raptor/raptor/util/tests/test_spmv_random.cpp

raptor/util/tests/CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.i"
	cd /home/zhangxin/draft/multgrid/raptor/build/raptor/util/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhangxin/draft/multgrid/raptor/raptor/util/tests/test_spmv_random.cpp > CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.i

raptor/util/tests/CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.s"
	cd /home/zhangxin/draft/multgrid/raptor/build/raptor/util/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhangxin/draft/multgrid/raptor/raptor/util/tests/test_spmv_random.cpp -o CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.s

# Object files for target test_spmv_random
test_spmv_random_OBJECTS = \
"CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.o"

# External object files for target test_spmv_random
test_spmv_random_EXTERNAL_OBJECTS =

raptor/util/tests/test_spmv_random: raptor/util/tests/CMakeFiles/test_spmv_random.dir/test_spmv_random.cpp.o
raptor/util/tests/test_spmv_random: raptor/util/tests/CMakeFiles/test_spmv_random.dir/build.make
raptor/util/tests/test_spmv_random: lib/libraptor.so
raptor/util/tests/test_spmv_random: /home/zhangxin/openmpi/lib/libmpi.so
raptor/util/tests/test_spmv_random: /usr/lib/x86_64-linux-gnu/liblapack.so.3
raptor/util/tests/test_spmv_random: /usr/lib/x86_64-linux-gnu/libblas.so.3
raptor/util/tests/test_spmv_random: lib/libgtest_main.so.1.12.1
raptor/util/tests/test_spmv_random: lib/libgtest.so.1.12.1
raptor/util/tests/test_spmv_random: raptor/util/tests/CMakeFiles/test_spmv_random.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhangxin/draft/multgrid/raptor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_spmv_random"
	cd /home/zhangxin/draft/multgrid/raptor/build/raptor/util/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_spmv_random.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
raptor/util/tests/CMakeFiles/test_spmv_random.dir/build: raptor/util/tests/test_spmv_random
.PHONY : raptor/util/tests/CMakeFiles/test_spmv_random.dir/build

raptor/util/tests/CMakeFiles/test_spmv_random.dir/clean:
	cd /home/zhangxin/draft/multgrid/raptor/build/raptor/util/tests && $(CMAKE_COMMAND) -P CMakeFiles/test_spmv_random.dir/cmake_clean.cmake
.PHONY : raptor/util/tests/CMakeFiles/test_spmv_random.dir/clean

raptor/util/tests/CMakeFiles/test_spmv_random.dir/depend:
	cd /home/zhangxin/draft/multgrid/raptor/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhangxin/draft/multgrid/raptor /home/zhangxin/draft/multgrid/raptor/raptor/util/tests /home/zhangxin/draft/multgrid/raptor/build /home/zhangxin/draft/multgrid/raptor/build/raptor/util/tests /home/zhangxin/draft/multgrid/raptor/build/raptor/util/tests/CMakeFiles/test_spmv_random.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : raptor/util/tests/CMakeFiles/test_spmv_random.dir/depend

