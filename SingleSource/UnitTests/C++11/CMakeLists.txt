list(APPEND CXXFLAGS -std=c++11 -pthread)
list(APPEND LDFLAGS -pthread)

file(GLOB Source RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.c *.cpp)
if(${CMAKE_EXE_LINKER_FLAGS} MATCHES "-static")
	list(APPEND LDFLAGS -Wl,--whole-archive -lpthread -Wl,--no-whole-archive)
endif()

if(ARCH STREQUAL "nanoMIPS")
  list(REMOVE_ITEM Source stdthreadbug.cpp)
endif()

llvm_singlesource()
