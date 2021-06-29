if(ARCH STREQUAL "nanoMIPS")
  list(APPEND LDFLAGS "-Wl,--whole-archive -lstubs -Wl,--no-whole-archive")
endif()

list(APPEND LDFLAGS -lm)
set(FP_TOLERANCE 0.0001)
llvm_singlesource()
