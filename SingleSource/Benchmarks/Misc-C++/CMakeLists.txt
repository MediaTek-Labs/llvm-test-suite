if(NOT ARCH STREQUAL "nanoMIPS")
  add_subdirectory(Large)
endif()

file(GLOB Source RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.c *.cpp)

if(ARCH STREQUAL "nanoMIPS")
  list(APPEND LDFLAGS "-Wl,--whole-archive")
  list(APPEND LDFLAGS "-lstubs")
  list(APPEND LDFLAGS "-Wl,--no-whole-archive")
  list(REMOVE_ITEM Source stepanov_v1p2.cpp)
endif()

list(APPEND LDFLAGS -lm)
set(FP_ABSTOLERANCE 0.01)
llvm_singlesource()
