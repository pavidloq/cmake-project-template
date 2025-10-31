
## Target definition

set(LIBRARY_TARGET_NAME TemplateLibrary)

if(LIBRARY_BUILD_SHARED)
    add_library(${LIBRARY_TARGET_NAME} SHARED)
else()
    add_library(${LIBRARY_TARGET_NAME} STATIC)
endif()

add_library("${PROJECT_NAME}::${LIBRARY_TARGET_NAME}" ALIAS ${LIBRARY_TARGET_NAME})


## Source files

file(GLOB_RECURSE LIBRARY_PUBLIC_SOURCES include/*.hpp)
file(GLOB_RECURSE LIBRARY_PRIVATE_SOURCES source/*.hpp source/*.cpp)

set(LIBRARY_SOURCES ${LIBRARY_PUBLIC_SOURCES} ${LIBRARY_PRIVATE_SOURCES})

target_sources(${LIBRARY_TARGET_NAME} PRIVATE ${LIBRARY_SOURCES})


## Include directories
target_include_directories(${LIBRARY_TARGET_NAME} PUBLIC include)
target_include_directories(${LIBRARY_TARGET_NAME} PRIVATE source)


## Linking external libraries

# Precompiled libraries
# target_include_directories(${LIBRARY_TARGET_NAME} PRIVATE libraries/include)
# target_link_directories(${LIBRARY_TARGET_NAME} PRIVATE libraries/binaries/...)  # platform-specific

# Vendored libraries
# add_subdirectory(libraries/vendored/...)

# target_link_libraries(${LIBRARY_TARGET_NAME} PRIVATE ...)


## IDE options
set_target_properties(${LIBRARY_TARGET_NAME} PROPERTIES FOLDER "Library")
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${LIBRARY_SOURCES})
