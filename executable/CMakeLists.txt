
# Target

set(EXECUTABLE_TARGET_NAME TemplateExecutable)

add_executable(${EXECUTABLE_TARGET_NAME})

add_executable("${PROJECT_NAME}::${EXECUTABLE_TARGET_NAME}" ALIAS ${EXECUTABLE_TARGET_NAME})


# Source files

file(GLOB_RECURSE EXECUTABLE_PUBLIC_SOURCES include/*.hpp)
file(GLOB_RECURSE EXECUTABLE_PRIVATE_SOURCES source/*.hpp source/*.cpp)

set(EXECUTABLE_SOURCES ${EXECUTABLE_PUBLIC_SOURCES} ${EXECUTABLE_PRIVATE_SOURCES})


target_sources(${EXECUTABLE_TARGET_NAME} PRIVATE ${EXECUTABLE_SOURCES})


# Include directories

target_include_directories(${EXECUTABLE_TARGET_NAME} PUBLIC include)
target_include_directories(${EXECUTABLE_TARGET_NAME} PRIVATE source)


# Linking

# target_include_directories(${EXECUTABLE_TARGET_NAME} PRIVATE libraries/include)
# target_link_directories(${EXECUTABLE_TARGET_NAME} PRIVATE libraries/binaries)

target_link_libraries(${EXECUTABLE_TARGET_NAME} PRIVATE "${PROJECT_NAME}::TemplateLibrary")


# IDE options

set_target_properties(${EXECUTABLE_TARGET_NAME} PROPERTIES FOLDER "Executable")
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${EXECUTABLE_SOURCES})
