list(APPEND CXXFLAGS -std=c++11)
if(NOT ARCH STREQUAL "nanoMIPS")
  llvm_multisource(frame_layout)
endif()
