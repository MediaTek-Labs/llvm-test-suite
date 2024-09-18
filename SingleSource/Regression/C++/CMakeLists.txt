if(NOT ARCH STREQUAL "nanoMIPS")
  add_subdirectory(EH)
endif()

file(GLOB Source RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.c *.cpp)

if(ARCH STREQUAL "nanoMIPS")
  list(REMOVE_ITEM Source BuiltinTypeInfo.cpp)
  list(REMOVE_ITEM Source ofstream_ctor.cpp)
endif()

llvm_singlesource(PREFIX "Regression-C++-")
