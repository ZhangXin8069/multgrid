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
include examples/CMakeFiles/coo_example.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/CMakeFiles/coo_example.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/coo_example.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/coo_example.dir/flags.make

examples/CMakeFiles/coo_example.dir/coo_example.cpp.o: examples/CMakeFiles/coo_example.dir/flags.make
examples/CMakeFiles/coo_example.dir/coo_example.cpp.o: ../examples/coo_example.cpp
examples/CMakeFiles/coo_example.dir/coo_example.cpp.o: examples/CMakeFiles/coo_example.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhangxin/draft/multgrid/raptor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/coo_example.dir/coo_example.cpp.o"
	cd /home/zhangxin/draft/multgrid/raptor/build/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/CMakeFiles/coo_example.dir/coo_example.cpp.o -MF CMakeFiles/coo_example.dir/coo_example.cpp.o.d -o CMakeFiles/coo_example.dir/coo_example.cpp.o -c /home/zhangxin/draft/multgrid/raptor/examples/coo_example.cpp

examples/CMakeFiles/coo_example.dir/coo_example.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/coo_example.dir/coo_example.cpp.i"
	cd /home/zhangxin/draft/multgrid/raptor/build/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhangxin/draft/multgrid/raptor/examples/coo_example.cpp > CMakeFiles/coo_example.dir/coo_example.cpp.i

examples/CMakeFiles/coo_example.dir/coo_example.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/coo_example.dir/coo_example.cpp.s"
	cd /home/zhangxin/draft/multgrid/raptor/build/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhangxin/draft/multgrid/raptor/examples/coo_example.cpp -o CMakeFiles/coo_example.dir/coo_example.cpp.s

# Object files for target coo_example
coo_example_OBJECTS = \
"CMakeFiles/coo_example.dir/coo_example.cpp.o"

# External object files for target coo_example
coo_example_EXTERNAL_OBJECTS =

examples/coo_example: examples/CMakeFiles/coo_example.dir/coo_example.cpp.o
examples/coo_example: examples/CMakeFiles/coo_example.dir/build.make
examples/coo_example: lib/libraptor.so
examples/coo_example: /home/zhangxin/openmpi/lib/libmpi.so
examples/coo_example: /usr/lib/x86_64-linux-gnu/liblapack.so.3
examples/coo_example: /usr/lib/x86_64-linux-gnu/libblas.so.3
examples/coo_example: examples/CMakeFiles/coo_example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhangxin/draft/multgrid/raptor/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable coo_example"
	cd /home/zhangxin/draft/multgrid/raptor/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/coo_example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/coo_example.dir/build: examples/coo_example
.PHONY : examples/CMakeFiles/coo_example.dir/build

examples/CMakeFiles/coo_example.dir/clean:
	cd /home/zhangxin/draft/multgrid/raptor/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/coo_example.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/coo_example.dir/clean

examples/CMakeFiles/coo_example.dir/depend:
	cd /home/zhangxin/draft/multgrid/raptor/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhangxin/draft/multgrid/raptor /home/zhangxin/draft/multgrid/raptor/examples /home/zhangxin/draft/multgrid/raptor/build /home/zhangxin/draft/multgrid/raptor/build/examples /home/zhangxin/draft/multgrid/raptor/build/examples/CMakeFiles/coo_example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/coo_example.dir/depend

