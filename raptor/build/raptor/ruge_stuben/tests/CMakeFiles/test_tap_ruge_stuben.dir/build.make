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
include raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/compiler_depend.make

# Include the progress variables for this target.
include raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/progress.make

# Include the compile flags for this target's objects.
include raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/flags.make

raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.o: raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/flags.make
raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.o: ../raptor/ruge_stuben/tests/test_tap_ruge_stuben.cpp
raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.o: raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhangxin/draft/multgrid/raptor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.o"
	cd /home/zhangxin/draft/multgrid/raptor/build/raptor/ruge_stuben/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.o -MF CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.o.d -o CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.o -c /home/zhangxin/draft/multgrid/raptor/raptor/ruge_stuben/tests/test_tap_ruge_stuben.cpp

raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.i"
	cd /home/zhangxin/draft/multgrid/raptor/build/raptor/ruge_stuben/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhangxin/draft/multgrid/raptor/raptor/ruge_stuben/tests/test_tap_ruge_stuben.cpp > CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.i

raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.s"
	cd /home/zhangxin/draft/multgrid/raptor/build/raptor/ruge_stuben/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhangxin/draft/multgrid/raptor/raptor/ruge_stuben/tests/test_tap_ruge_stuben.cpp -o CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.s

# Object files for target test_tap_ruge_stuben
test_tap_ruge_stuben_OBJECTS = \
"CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.o"

# External object files for target test_tap_ruge_stuben
test_tap_ruge_stuben_EXTERNAL_OBJECTS =

raptor/ruge_stuben/tests/test_tap_ruge_stuben: raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/test_tap_ruge_stuben.cpp.o
raptor/ruge_stuben/tests/test_tap_ruge_stuben: raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/build.make
raptor/ruge_stuben/tests/test_tap_ruge_stuben: lib/libraptor.so
raptor/ruge_stuben/tests/test_tap_ruge_stuben: /home/zhangxin/openmpi/lib/libmpi.so
raptor/ruge_stuben/tests/test_tap_ruge_stuben: /usr/lib/x86_64-linux-gnu/liblapack.so.3
raptor/ruge_stuben/tests/test_tap_ruge_stuben: /usr/lib/x86_64-linux-gnu/libblas.so.3
raptor/ruge_stuben/tests/test_tap_ruge_stuben: lib/libgtest_main.so.1.12.1
raptor/ruge_stuben/tests/test_tap_ruge_stuben: lib/libgtest.so.1.12.1
raptor/ruge_stuben/tests/test_tap_ruge_stuben: raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhangxin/draft/multgrid/raptor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_tap_ruge_stuben"
	cd /home/zhangxin/draft/multgrid/raptor/build/raptor/ruge_stuben/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_tap_ruge_stuben.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/build: raptor/ruge_stuben/tests/test_tap_ruge_stuben
.PHONY : raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/build

raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/clean:
	cd /home/zhangxin/draft/multgrid/raptor/build/raptor/ruge_stuben/tests && $(CMAKE_COMMAND) -P CMakeFiles/test_tap_ruge_stuben.dir/cmake_clean.cmake
.PHONY : raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/clean

raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/depend:
	cd /home/zhangxin/draft/multgrid/raptor/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhangxin/draft/multgrid/raptor /home/zhangxin/draft/multgrid/raptor/raptor/ruge_stuben/tests /home/zhangxin/draft/multgrid/raptor/build /home/zhangxin/draft/multgrid/raptor/build/raptor/ruge_stuben/tests /home/zhangxin/draft/multgrid/raptor/build/raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : raptor/ruge_stuben/tests/CMakeFiles/test_tap_ruge_stuben.dir/depend

