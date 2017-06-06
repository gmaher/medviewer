cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
project(test)

set(CMAKE_INCLUDE_CURRENT_DIR True)
find_package(ITK REQUIRED)
include(${ITK_USE_FILE})

find_package(Boost REQUIRED)
if(Boost_FOUND)
  include_directories(${Boost_INCLUDE_DIR})
  link_directories(${Boost_LIBRARY_DIRS})
endif()
include_directories(${PROJECT_SOURCE_DIR})

# ADD_EXECUTABLE(itkMultiScaleTubularityMeasureImageFilter itkMultiScaleTubularityMeasureImageFilter.cxx)
# TARGET_LINK_LIBRARIES(itkMultiScaleTubularityMeasureImageFilter ${Libraries} boost_math_tr1)

add_executable(test main.cpp)
target_link_libraries(test ${ITK_LIBRARIES})
