// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_fir_run
#define ccs_intercept_fir_run_23 \
  run(ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[32][8], ac_channel<ac_int<5, false> > &coeff_addr, ac_channel<ac_int<8, true> > &output);\
  void ccs_real_run
#else
#define ccs_intercept_fir_run_23 run
#endif //CCS_DESIGN_FUNC_fir_run
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// fir::run 23 TOP
#define ccs_intercept_run_23 ccs_intercept_fir_run_23
