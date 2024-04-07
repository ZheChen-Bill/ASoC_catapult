// ccs_block_macros.h
#include "ccs_testbench.h"

#ifndef EXCLUDE_CCS_BLOCK_INTERCEPT
#ifndef INCLUDE_CCS_BLOCK_INTERCEPT
#define INCLUDE_CCS_BLOCK_INTERCEPT
#ifdef  CCS_DESIGN_FUNC_top_run
#define ccs_intercept_top_run_24 \
  run(ac_channel<ac_int<8, true> > &din, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &dout);\
  void ccs_real_run
#else
#define ccs_intercept_top_run_24 run
#endif //CCS_DESIGN_FUNC_top_run
#endif //INCLUDE_CCS_BLOCK_INTERCEPT
#endif //EXCLUDE_CCS_BLOCK_INTERCEPT

// top::run 24 TOP
#define ccs_intercept_run_24 ccs_intercept_top_run_24
// decimator::run 22 MODULE
#define ccs_intercept_run_22 run
#define ccs_intercept_decimator_run_22 run
// fir::run 23 MODULE
#define ccs_intercept_run_23 run
#define ccs_intercept_fir_run_23 run
