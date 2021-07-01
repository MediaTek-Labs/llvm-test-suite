if(ARCH STREQUAL "nanoMIPS")
  list(APPEND LDFLAGS "-Wl,--whole-archive -lstubs -Wl,--no-whole-archive")
endif()
llvm_singlesource()
