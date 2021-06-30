list(APPEND LDFLAGS -lm )
list(APPEND LDFLAGS "-Wl,--whole-archive -lstubs -Wl,--no-whole-archive")
set(FP_TOLERANCE 0.001)
set(Source
  ReedSolomon.c
  evalloop.c
  fbench.c
  ffbench.c
  flops-1.c
  flops-2.c
  flops-3.c
  flops-4.c
  flops-5.c
  flops-6.c
  flops-7.c
  flops-8.c
  fp-convert.c
  lowercase.c
  mandel-2.c
  mandel.c
  matmul_f64_4x4.c
  oourafft.c
  perlin.c
  pi.c
  revertBits.c
  richards_benchmark.c
  salsa20.c
  whetstone.c
)
if(NOT ARCH STREQUAL "PowerPC" OR NOT TARGET_OS STREQUAL "Darwin")
  list(APPEND Source dt.c)
endif()
if (ARCH STREQUAL "nanoMIPS")
  list(REMOVE_ITEM Source mandel.c)
endif()
llvm_singlesource()
