if(NOT ARCH STREQUAL "nanoMIPS")
  add_subdirectory(Large)
endif()

list(APPEND LDFLAGS -lm)
llvm_singlesource()
