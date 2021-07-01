if(ARCH MATCHES "x86" OR ARCH MATCHES "riscv" OR
   ARCH MATCHES "SystemZ" OR ARCH MATCHES "Mips" OR
   ARCH MATCHES "AArch64" OR ARCH MATCHES "ARM" OR
   ARCH MATCHES "nanoMIPS")
  add_subdirectory(gcc-c-torture)
endif()

file(GLOB Source RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.c)
if(ARCH STREQUAL "nanoMIPS")
  list(REMOVE_ITEM Source uint64_to_float.c)
endif()

list(APPEND LDFLAGS -lm)
llvm_singlesource(PREFIX "Regression-C-")
