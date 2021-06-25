list(APPEND LDFLAGS "-Wl,--whole-archive -lstubs -Wl,--no-whole-archive")
llvm_singlesource()
