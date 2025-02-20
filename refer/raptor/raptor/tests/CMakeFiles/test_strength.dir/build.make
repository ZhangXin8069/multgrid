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
CMAKE_BINARY_DIR = /home/zhangxin/draft/multgrid/raptor

# Include any dependencies generated for this target.
include raptor/tests/CMakeFiles/test_strength.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include raptor/tests/CMakeFiles/test_strength.dir/compiler_depend.make

# Include the progress variables for this target.
include raptor/tests/CMakeFiles/test_strength.dir/progress.make

# Include the compile flags for this target's objects.
include raptor/tests/CMakeFiles/test_strength.dir/flags.make

raptor/tests/CMakeFiles/test_strength.dir/test_strength.cpp.o: raptor/tests/CMakeFiles/test_strength.dir/flags.make
raptor/tests/CMakeFiles/test_strength.dir/test_strength.cpp.o: raptor/tests/test_strength.cpp
raptor/tests/CMakeFiles/test_strength.dir/test_strength.cpp.o: raptor/tests/CMakeFiles/test_strength.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhangxin/draft/multgrid/raptor/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object raptor/tests/CMakeFiles/test_strength.dir/test_strength.cpp.o"
	cd /home/zhangxin/draft/multgrid/raptor/raptor/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT raptor/tests/CMakeFiles/test_strength.dir/test_strength.cpp.o -MF CMakeFiles/test_strength.dir/test_strength.cpp.o.d -o CMakeFiles/test_strength.dir/test_strength.cpp.o -c /home/zhangxin/draft/multgrid/raptor/raptor/tests/test_strength.cpp

raptor/tests/CMakeFiles/test_strength.dir/test_strength.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_strength.dir/test_strength.cpp.i"
	cd /home/zhangxin/draft/multgrid/raptor/raptor/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhangxin/draft/multgrid/raptor/raptor/tests/test_strength.cpp > CMakeFiles/test_strength.dir/test_strength.cpp.i

raptor/tests/CMakeFiles/test_strength.dir/test_strength.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_strength.dir/test_strength.cpp.s"
	cd /home/zhangxin/draft/multgrid/raptor/raptor/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhangxin/draft/multgrid/raptor/raptor/tests/test_strength.cpp -o CMakeFiles/test_strength.dir/test_strength.cpp.s

# Object files for target test_strength
test_strength_OBJECTS = \
"CMakeFiles/test_strength.dir/test_strength.cpp.o"

# External object files for target test_strength
test_strength_EXTERNAL_OBJECTS =

raptor/tests/test_strength: raptor/tests/CMakeFiles/test_strength.dir/test_strength.cpp.o
raptor/tests/test_strength: raptor/tests/CMakeFiles/test_strength.dir/build.make
raptor/tests/test_strength: lib/libraptor.so
raptor/tests/test_strength: /home/zhangxin/openmpi/lib/libmpi.so
raptor/tests/test_strength: lib/libgtest_main.so.1.12.1
raptor/tests/test_strength: lib/libgtest.so.1.12.1
raptor/tests/test_strength: raptor/tests/CMakeFiles/test_strength.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhangxin/draft/multgrid/raptor/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_strength"
	cd /home/zhangxin/draft/multgrid/raptor/raptor/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_strength.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
raptor/tests/CMakeFiles/test_strength.dir/build: raptor/tests/test_strength
.PHONY : raptor/tests/CMakeFiles/test_strength.dir/build

raptor/tests/CMakeFiles/test_strength.dir/clean:
	cd /home/zhangxin/draft/multgrid/raptor/raptor/tests && $(CMAKE_COMMAND) -P CMakeFiles/test_strength.dir/cmake_clean.cmake
.PHONY : raptor/tests/CMakeFiles/test_strength.dir/clean

raptor/tests/CMakeFiles/test_strength.dir/depend:
	cd /home/zhangxin/draft/multgrid/raptor && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhangxin/draft/multgrid/raptor /home/zhangxin/draft/multgrid/raptor/raptor/tests /home/zhangxin/draft/multgrid/raptor /home/zhangxin/draft/multgrid/raptor/raptor/tests /home/zhangxin/draft/multgrid/raptor/raptor/tests/CMakeFiles/test_strength.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : raptor/tests/CMakeFiles/test_strength.dir/depend

