list(APPEND LDFLAGS "-Wl,--whole-archive")
list(APPEND LDFLAGS "-lstubs")
list(APPEND LDFLAGS "-Wl,--no-whole-archive")

llvm_multisource(shapes)
