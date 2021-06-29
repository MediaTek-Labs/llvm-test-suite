if(ARCH STREQUAL "nanoMIPS")
  list(APPEND LDFLAGS "-Wl,--whole-archive -lstubs -Wl,--no-whole-archive")
endif()

list(APPEND LDFLAGS -lm)
set(FP_ABSTOLERANCE 0.01)
llvm_singlesource()
