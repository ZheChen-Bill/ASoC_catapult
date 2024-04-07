// ----------------------------------------------------------------------------
// User Testbench Interface Header
//
//    HLS version: 2023.1/1033555 Production Release
//       HLS date: Mon Feb 13 11:32:25 PST 2023
//  Flow Packages: HDL_Tcl 8.0a, SCVerify 10.4
//
//   Generated by: m111061545@ws41
// Generated date: Tue Mar 26 18:25:27 CST 2024
//
// ----------------------------------------------------------------------------

#ifndef CCS_TESTBENCH_H
#define CCS_TESTBENCH_H

#include <ac_int.h>
#include <ac_channel.h>
#include "mc_wait_ctrl.h"
#include <string.h>
#include <iostream>

class testbench
{
   public:
   int argc;
   char** argv;
   int main(); //CCS_MAIN
   static bool enable_idle_sync_mode;
   static unsigned short idle_sync_stable_cycles;
   static void set_enable_stalls(bool flag);
   static void reset_request();
   static void* _dut_inst;
   static void* dut_inst();
   static void* set_dut_inst( void* _inst );
   static bool input_ignore;
   static bool input_skip;
   static bool input_skip_quiet;
   static bool input_skip_once;
   static bool input_skip_noerr;
   static int  input_array_comp_first;
   static int  input_array_comp_last;
   static mc_wait_ctrl input_wait_ctrl;
   static bool coeffs_ignore;
   static bool coeffs_skip;
   static bool coeffs_skip_quiet;
   static bool coeffs_skip_once;
   static bool coeffs_skip_noerr;
   static int  coeffs_array_comp_first;
   static int  coeffs_array_comp_last;
   static mc_wait_ctrl coeffs_wait_ctrl;
   static bool coeff_addr_ignore;
   static bool coeff_addr_skip;
   static bool coeff_addr_skip_quiet;
   static bool coeff_addr_skip_once;
   static bool coeff_addr_skip_noerr;
   static int  coeff_addr_array_comp_first;
   static int  coeff_addr_array_comp_last;
   static mc_wait_ctrl coeff_addr_wait_ctrl;
   static bool output_ignore;
   static bool output_skip;
   static bool output_skip_quiet;
   static bool output_skip_once;
   static bool output_skip_noerr;
   static int  output_array_comp_first;
   static int  output_array_comp_last;
   static bool output_use_mask;
   static ac_int<8, true > output_output_mask;
   static mc_wait_ctrl output_wait_ctrl;
   #ifndef CCS_SCVERIFY_USE_CCS_BLOCK
   static void exec_run(ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[32][8], ac_channel<ac_int<5, false> > &coeff_addr, ac_channel<ac_int<8, true> > &output);
   #endif
   explicit testbench(int _argc, const char* const *_argv)
      :argc(_argc), argv(const_cast<char**>(_argv))
   {
   }
   ~testbench()
   {
   }
   private:
   testbench() {}
};
extern void mc_testbench_reset_request();
extern void* mc_testbench_dut_inst();
extern void* mc_testbench_set_dut_inst( void* _inst );
extern void mc_testbench_wait_for_idle_sync();
extern void mc_testbench_input_skip(bool v);
extern void mc_testbench_coeffs_skip(bool v);
extern void mc_testbench_coeff_addr_skip(bool v);
extern void mc_testbench_output_skip(bool v);
#endif //CCS_TESTBENCH_H
