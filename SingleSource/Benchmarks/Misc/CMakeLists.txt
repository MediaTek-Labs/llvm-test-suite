list(APPEND LDFLAGS -lm )
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
  flops.c
  fp-convert.c
  lowercase.c
  mandel-2.c
  matmul_f64_4x4.c
  perlin.c
  pi.c
  revertBits.c
  richards_benchmark.c
  salsa20.c
)
llvm_singlesource()
