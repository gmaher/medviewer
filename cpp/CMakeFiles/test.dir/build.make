# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /media/gabriel/Data/projects/medviewer/cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/gabriel/Data/projects/medviewer/cpp

# Include any dependencies generated for this target.
include CMakeFiles/test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test.dir/flags.make

CMakeFiles/test.dir/main.cpp.o: CMakeFiles/test.dir/flags.make
CMakeFiles/test.dir/main.cpp.o: main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/gabriel/Data/projects/medviewer/cpp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test.dir/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test.dir/main.cpp.o -c /media/gabriel/Data/projects/medviewer/cpp/main.cpp

CMakeFiles/test.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test.dir/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /media/gabriel/Data/projects/medviewer/cpp/main.cpp > CMakeFiles/test.dir/main.cpp.i

CMakeFiles/test.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test.dir/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /media/gabriel/Data/projects/medviewer/cpp/main.cpp -o CMakeFiles/test.dir/main.cpp.s

CMakeFiles/test.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/test.dir/main.cpp.o.requires

CMakeFiles/test.dir/main.cpp.o.provides: CMakeFiles/test.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/test.dir/build.make CMakeFiles/test.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/test.dir/main.cpp.o.provides

CMakeFiles/test.dir/main.cpp.o.provides.build: CMakeFiles/test.dir/main.cpp.o


# Object files for target test
test_OBJECTS = \
"CMakeFiles/test.dir/main.cpp.o"

# External object files for target test
test_EXTERNAL_OBJECTS =

test: CMakeFiles/test.dir/main.cpp.o
test: CMakeFiles/test.dir/build.make
test: /usr/local/lib/libitkdouble-conversion-4.12.a
test: /usr/local/lib/libitksys-4.12.a
test: /usr/local/lib/libitkvnl_algo-4.12.a
test: /usr/local/lib/libitkvnl-4.12.a
test: /usr/local/lib/libitkv3p_netlib-4.12.a
test: /usr/local/lib/libitknetlib-4.12.a
test: /usr/local/lib/libitkvcl-4.12.a
test: /usr/local/lib/libITKCommon-4.12.a
test: /usr/local/lib/libitkNetlibSlatec-4.12.a
test: /usr/local/lib/libITKStatistics-4.12.a
test: /usr/local/lib/libITKTransform-4.12.a
test: /usr/local/lib/libITKIOImageBase-4.12.a
test: /usr/local/lib/libITKIOBMP-4.12.a
test: /usr/local/lib/libITKEXPAT-4.12.a
test: /usr/local/lib/libitkzlib-4.12.a
test: /usr/local/lib/libitkgdcmDICT-4.12.a
test: /usr/local/lib/libitkgdcmMSFF-4.12.a
test: /usr/local/lib/libITKIOGDCM-4.12.a
test: /usr/local/lib/libITKIOGIPL-4.12.a
test: /usr/local/lib/libitkjpeg-4.12.a
test: /usr/local/lib/libITKIOJPEG-4.12.a
test: /usr/local/lib/libITKMetaIO-4.12.a
test: /usr/local/lib/libITKIOMeta-4.12.a
test: /usr/local/lib/libITKznz-4.12.a
test: /usr/local/lib/libITKniftiio-4.12.a
test: /usr/local/lib/libITKIONIFTI-4.12.a
test: /usr/local/lib/libITKNrrdIO-4.12.a
test: /usr/local/lib/libITKIONRRD-4.12.a
test: /usr/local/lib/libitkpng-4.12.a
test: /usr/local/lib/libITKIOPNG-4.12.a
test: /usr/local/lib/libitktiff-4.12.a
test: /usr/local/lib/libITKIOTIFF-4.12.a
test: /usr/local/lib/libITKIOVTK-4.12.a
test: /usr/local/lib/libITKLabelMap-4.12.a
test: /usr/local/lib/libITKMesh-4.12.a
test: /usr/local/lib/libITKSpatialObjects-4.12.a
test: /usr/local/lib/libITKPath-4.12.a
test: /usr/local/lib/libITKQuadEdgeMesh-4.12.a
test: /usr/local/lib/libITKOptimizers-4.12.a
test: /usr/local/lib/libITKPolynomials-4.12.a
test: /usr/local/lib/libITKBiasCorrection-4.12.a
test: /usr/local/lib/libITKBioCell-4.12.a
test: /usr/local/lib/libITKDICOMParser-4.12.a
test: /usr/local/lib/libITKIOXML-4.12.a
test: /usr/local/lib/libITKIOSpatialObjects-4.12.a
test: /usr/local/lib/libITKFEM-4.12.a
test: /usr/local/lib/libITKgiftiio-4.12.a
test: /usr/local/lib/libITKIOMesh-4.12.a
test: /usr/local/lib/libitkhdf5_cpp.a
test: /usr/local/lib/libitkhdf5.a
test: /usr/local/lib/libITKIOBioRad-4.12.a
test: /usr/local/lib/libITKIOCSV-4.12.a
test: /usr/local/lib/libITKIOIPL-4.12.a
test: /usr/local/lib/libITKIOGE-4.12.a
test: /usr/local/lib/libITKIOSiemens-4.12.a
test: /usr/local/lib/libITKIOHDF5-4.12.a
test: /usr/local/lib/libITKIOLSM-4.12.a
test: /usr/local/lib/libITKIOMRC-4.12.a
test: /usr/local/lib/libITKIOStimulate-4.12.a
test: /usr/local/lib/libITKTransformFactory-4.12.a
test: /usr/local/lib/libITKIOTransformBase-4.12.a
test: /usr/local/lib/libITKIOTransformHDF5-4.12.a
test: /usr/local/lib/libITKIOTransformInsightLegacy-4.12.a
test: /usr/local/lib/libITKIOTransformMatlab-4.12.a
test: /usr/local/lib/libITKKLMRegionGrowing-4.12.a
test: /usr/local/lib/libITKVTK-4.12.a
test: /usr/local/lib/libITKWatersheds-4.12.a
test: /usr/local/lib/libITKOptimizersv4-4.12.a
test: /usr/local/lib/libITKVideoCore-4.12.a
test: /usr/local/lib/libITKVideoIO-4.12.a
test: /usr/local/lib/libITKVtkGlue-4.12.a
test: /home/gabriel/anaconda2/lib/libpython2.7.so
test: /home/gabriel/anaconda2/lib/libvtkIOMINC-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersSelection-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkImagingStencil-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingLOD-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOParallel-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIONetCDF-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingMatplotlib-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkPythonInterpreter-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkWrappingTools-6.3.a
test: /home/gabriel/anaconda2/lib/libvtkInteractionImage-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOImport-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkImagingStatistics-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOParallelXML-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOSQL-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtksqlite-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingLIC-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersVerdict-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkverdict-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersProgrammable-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkViewsContext2D-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOInfovis-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOPLY-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOExport-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOExodus-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingImage-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersSMP-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkDomainsChemistry-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersHyperTree-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOLSDyna-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersPython-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkGeovisCore-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOEnSight-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersFlowPaths-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOAMR-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersAMR-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersGeneric-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOVideo-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkImagingMath-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersParallelImaging-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOMovie-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkoggtheora-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkViewsInfovis-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersTexture-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkImagingMorphological-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingVolumeOpenGL-6.3.so.1
test: /usr/local/lib/libitkgdcmMSFF-4.12.a
test: /usr/local/lib/libitkgdcmDICT-4.12.a
test: /usr/local/lib/libitkgdcmIOD-4.12.a
test: /usr/local/lib/libitkgdcmDSED-4.12.a
test: /usr/local/lib/libitkgdcmCommon-4.12.a
test: /usr/local/lib/libitkgdcmjpeg8-4.12.a
test: /usr/local/lib/libitkgdcmjpeg12-4.12.a
test: /usr/local/lib/libitkgdcmjpeg16-4.12.a
test: /usr/local/lib/libitkgdcmopenjpeg-4.12.a
test: /usr/local/lib/libitkgdcmcharls-4.12.a
test: /usr/local/lib/libitkgdcmuuid-4.12.a
test: /usr/local/lib/libITKNrrdIO-4.12.a
test: /usr/local/lib/libitkpng-4.12.a
test: /usr/local/lib/libITKIOXML-4.12.a
test: /usr/local/lib/libITKMetaIO-4.12.a
test: /usr/local/lib/libITKgiftiio-4.12.a
test: /usr/local/lib/libITKEXPAT-4.12.a
test: /usr/local/lib/libITKniftiio-4.12.a
test: /usr/local/lib/libITKznz-4.12.a
test: /usr/local/lib/libITKIOIPL-4.12.a
test: /usr/local/lib/libITKIOTIFF-4.12.a
test: /usr/local/lib/libitktiff-4.12.a
test: /usr/local/lib/libitkjpeg-4.12.a
test: /usr/local/lib/libitkhdf5_cpp.a
test: /usr/local/lib/libitkhdf5.a
test: /usr/local/lib/libitkzlib-4.12.a
test: /usr/local/lib/libITKIOTransformBase-4.12.a
test: /usr/local/lib/libITKTransformFactory-4.12.a
test: /usr/local/lib/libITKSpatialObjects-4.12.a
test: /usr/local/lib/libITKMesh-4.12.a
test: /usr/local/lib/libITKTransform-4.12.a
test: /usr/local/lib/libITKPath-4.12.a
test: /usr/local/lib/libITKOptimizers-4.12.a
test: /usr/local/lib/libITKStatistics-4.12.a
test: /usr/local/lib/libitkNetlibSlatec-4.12.a
test: /usr/local/lib/libITKIOImageBase-4.12.a
test: /usr/local/lib/libITKVideoCore-4.12.a
test: /usr/local/lib/libITKVTK-4.12.a
test: /usr/local/lib/libITKCommon-4.12.a
test: /usr/local/lib/libitkdouble-conversion-4.12.a
test: /usr/local/lib/libitksys-4.12.a
test: /usr/local/lib/libITKVNLInstantiation-4.12.a
test: /usr/local/lib/libitkvnl_algo-4.12.a
test: /usr/local/lib/libitkvnl-4.12.a
test: /usr/local/lib/libitkv3p_netlib-4.12.a
test: /usr/local/lib/libitknetlib-4.12.a
test: /usr/local/lib/libitkvcl-4.12.a
test: /home/gabriel/anaconda2/lib/libvtkjsoncpp-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtklibxml2-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingGL2PS-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingContextOpenGL-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkgl2ps-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkexoIIc-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkNetCDF_cxx-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkNetCDF-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkWrappingPython27Core-6.3.so.1
test: /home/gabriel/anaconda2/lib/libpython2.7.so
test: /home/gabriel/anaconda2/lib/libvtkIOXML-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOGeometry-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOXMLParser-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkexpat-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkproj4-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkhdf5_hl-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkhdf5-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersParallel-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkParallelCore-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOLegacy-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkViewsCore-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkInteractionWidgets-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingAnnotation-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkImagingColor-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersHybrid-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkInteractionStyle-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingLabel-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersImaging-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkInfovisLayout-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersModeling-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkChartsCore-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingContext2D-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingFreeType-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkftgl-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkfreetype-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkInfovisCore-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkImagingGeneral-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkImagingSources-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingOpenGL-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkImagingHybrid-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOImage-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkIOCore-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkDICOMParser-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkmetaio-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkpng-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtktiff-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkzlib-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkjpeg-6.3.so.1
test: /usr/lib64/libGLU.so
test: /usr/lib64/libGL.so
test: /usr/lib64/libSM.so
test: /usr/lib64/libICE.so
test: /usr/lib64/libX11.so
test: /usr/lib64/libXext.so
test: /usr/lib64/libXt.so
test: /home/gabriel/anaconda2/lib/libvtkRenderingVolume-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkRenderingCore-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersSources-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkCommonColor-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersExtraction-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersGeneral-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkCommonComputationalGeometry-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersStatistics-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkImagingFourier-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkImagingCore-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkalglib-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersGeometry-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkFiltersCore-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkCommonExecutionModel-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkCommonDataModel-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkCommonMisc-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkCommonSystem-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtksys-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkCommonTransforms-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkCommonMath-6.3.so.1
test: /home/gabriel/anaconda2/lib/libvtkCommonCore-6.3.so.1
test: CMakeFiles/test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/gabriel/Data/projects/medviewer/cpp/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test.dir/build: test

.PHONY : CMakeFiles/test.dir/build

CMakeFiles/test.dir/requires: CMakeFiles/test.dir/main.cpp.o.requires

.PHONY : CMakeFiles/test.dir/requires

CMakeFiles/test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test.dir/clean

CMakeFiles/test.dir/depend:
	cd /media/gabriel/Data/projects/medviewer/cpp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/gabriel/Data/projects/medviewer/cpp /media/gabriel/Data/projects/medviewer/cpp /media/gabriel/Data/projects/medviewer/cpp /media/gabriel/Data/projects/medviewer/cpp /media/gabriel/Data/projects/medviewer/cpp/CMakeFiles/test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test.dir/depend

