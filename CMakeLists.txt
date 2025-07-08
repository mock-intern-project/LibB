## PROJECT SETTINGS ##
cmake_minimum_required(VERSION 3.15.0)
project(LibB
VERSION 1.0.0 
LANGUAGES C CXX
)

## CXX SETTINGS ##
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_DEBUG_POSTFIX -d)

## COMMON SETTINGS ##
set(PROJECT_MODULE_NAME intern_repo)

## DEPENDENCIES CONFIGURATIONS ##
set(INSTALL_ROOT_DIR C:/in_house_software)
if(DEFINED ENV{INSTALL_ROOT_DIR})
    set(INSTALL_ROOT_DIR $ENV{INSTALL_ROOT_DIR})
endif()

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(Dependencies)

## BUILD CONFIGURATIONS ##
set(LIB_B_TARGET_NAME ${PROJECT_NAME})

file(GLOB_RECURSE sources_cpp ${CMAKE_CURRENT_LIST_DIR}/development/src/*.cpp)
file(GLOB_RECURSE sources_cxx ${CMAKE_CURRENT_LIST_DIR}/development/src/*.cxx)
file(GLOB_RECURSE sources_cc  ${CMAKE_CURRENT_LIST_DIR}/development/src/*.cc)
set(sources "${sources_cpp};${sources_cxx};${sources_cc}")

file(GLOB_RECURSE headers_h   ${CMAKE_CURRENT_LIST_DIR}/development/inc/*.h)
file(GLOB_RECURSE headers_hpp ${CMAKE_CURRENT_LIST_DIR}/development/inc/*.hpp)
set(headers "${headers_h};${headers_hpp}")

add_library(${LIB_B_TARGET_NAME} STATIC ${sources})
add_library(${PROJECT_NAME}::${LIB_B_TARGET_NAME} ALIAS ${LIB_B_TARGET_NAME})

set_target_properties(${LIB_B_TARGET_NAME} 
    PROPERTIES
        PUBLIC_HEADER
            "${headers}"
)

target_include_directories(${LIB_B_TARGET_NAME} 
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/development/inc>
)

target_link_libraries(${LIB_B_TARGET_NAME} 
    PUBLIC
        ${${LIB_A_LIB_NAME}_LIBRARIES}
)

## INSTALL CONFIGURATIONS ##
include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

set(CMAKE_INSTALL_PREFIX
    "${INSTALL_ROOT_DIR}/${PROJECT_MODULE_NAME}/${CMAKE_PROJECT_NAME}/v${PROJECT_VERSION}/${CMAKE_SYSTEM_NAME}/${CMAKE_SYSTEM_VERSION}" CACHE PATH "..." FORCE
)

install(TARGETS ${LIB_B_TARGET_NAME} 
    EXPORT ${LIB_B_TARGET_NAME}Targets
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    PUBLIC_HEADER DESTINATION ../../${CMAKE_INSTALL_INCLUDEDIR}
    INCLUDES DESTINATION ../../${CMAKE_INSTALL_INCLUDEDIR}
)

install(EXPORT ${LIB_B_TARGET_NAME}Targets
    FILE ${LIB_B_TARGET_NAME}Targets.cmake
    NAMESPACE ${CMAKE_PROJECT_NAME}::
    DESTINATION cmake
)

write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/${LIB_B_TARGET_NAME}ConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)

configure_package_config_file(
    ${CMAKE_SOURCE_DIR}/cmake/Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/${LIB_B_TARGET_NAME}Config.cmake
    INSTALL_DESTINATION cmake
)

install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/${LIB_B_TARGET_NAME}Config.cmake    
    ${CMAKE_CURRENT_BINARY_DIR}/${LIB_B_TARGET_NAME}ConfigVersion.cmake    
    DESTINATION cmake
)