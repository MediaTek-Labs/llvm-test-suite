set(CMAKE_CXX_STANDARD 14)
add_subdirectory(EH)

file(GLOB Source RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.c *.cpp)

if(ARCH STREQUAL "nanoMIPS")
  list(REMOVE_ITEM Source BuiltinTypeInfo.cpp)
  list(REMOVE_ITEM Source ofstream_ctor.cpp)
endif()

llvm_singlesource(PREFIX "Regression-C++-")
