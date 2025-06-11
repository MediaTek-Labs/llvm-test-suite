add_subdirectory(EH)

list(APPEND CXXFLAGS -Wno-deprecated)
list(APPEND LDFLAGS "-Wl,--whole-archive")
list(APPEND LDFLAGS "-lstubs")
list(APPEND LDFLAGS "-Wl,--no-whole-archive")
set(FP_TOLERANCE 0.00000001)
set(Source
  ackermann.cpp
  ary.cpp
  ary2.cpp
  ary3.cpp
  fibo.cpp
  hash.cpp
  hash2.cpp
  heapsort.cpp
  lists.cpp
  lists1.cpp
  matrix.cpp
  methcall.cpp
  moments.cpp
  nestedloop.cpp
  objinst.cpp
  random.cpp
  sieve.cpp
  strcat.cpp
)
if(NOT TEST_SUITE_BENCHMARKING_ONLY)
  list(APPEND Source
    hello.cpp
    reversefile.cpp
    sumcol.cpp
    wc.cpp
    wordfreq.cpp
  )
  if(NOT ARCH STREQUAL "nanoMIPS")
    list(APPEND Source spellcheck.cpp)
  endif()
endif()
list(APPEND LDFLAGS -lm)
if(TARGET_OS STREQUAL "Darwin")
  # Necessary for ackermann on iOS
  list(APPEND LDFLAGS -Xlinker -stack_size -Xlinker 0x800000)
endif()
llvm_singlesource(PREFIX Shootout-C++-)
