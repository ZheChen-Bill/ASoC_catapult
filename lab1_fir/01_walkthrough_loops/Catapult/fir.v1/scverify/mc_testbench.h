// ----------------------------------------------------------------------------
// SystemC Testbench Header
//
//    HLS version: 2023.1/1033555 Production Release
//       HLS date: Mon Feb 13 11:32:25 PST 2023
//  Flow Packages: HDL_Tcl 8.0a, SCVerify 10.4
//
//   Generated by: m111061545@ws41
// Generated date: Tue Mar 26 18:29:01 CST 2024
//
// ----------------------------------------------------------------------------
#ifdef CCS_SCVERIFY

// 
// -------------------------------------
// mc_testbench
// SCVerify mc_testbench SC_MODULE
// -------------------------------------
// 
#ifndef INCLUDED_MC_TESTBENCH_H
#define INCLUDED_MC_TESTBENCH_H

#ifdef __SYNTHESIS__
#error __SYNTHESIS__ is a predefined, reserved Catapult macro and cannot be user defined.
#endif

#ifndef SC_USE_STD_STRING
#define SC_USE_STD_STRING
#endif

#include "../../fir.h"
#include "ccs_testbench.h"
#include <systemc.h>
#include <tlm.h>
#include <ac_int.h>
#include <ac_channel.h>
#include <mc_container_types.h>
#include <mc_typeconv.h>
#include <mc_transactors.h>
#include <mc_comparator.h>
#include <mc_end_of_testbench.h>
#include <vector>
#include <ac_read_env.h>


class mc_testbench : public sc_module
{
public:
   // Module instance pointers
   mc_comparator< ac_int<8, true > , MaskPacket< 1, 8 > > *output_comp;
   
   // Interface Ports
   sc_in< bool > clk;
   sc_port< tlm::tlm_fifo_put_if< ac_int<8, true > > > ccs_input;
   sc_port< tlm::tlm_fifo_put_if< mc_wait_ctrl > > ccs_wait_ctrl_input;
   sc_port< tlm::tlm_fifo_put_if< int > > ccs_sizecount_input;
   sc_port< tlm::tlm_fifo_put_if< mgc_sysc_ver_array1D<ac_int<8, true >,8> > > ccs_coeffs;
   sc_port< tlm::tlm_fifo_put_if< mc_wait_ctrl > > ccs_wait_ctrl_coeffs;
   sc_port< tlm::tlm_fifo_get_if< ac_int<8, true > > > ccs_output;
   sc_port< tlm::tlm_fifo_put_if< mc_wait_ctrl > > ccs_wait_ctrl_output;
   sc_in< bool > design_is_idle;
   sc_out< sc_logic > enable_stalls;
   sc_in< unsigned short > stall_coverage;
   
   // Named Objects
   
   // Data objects
   int end_of_sim_wait_count;
   bool testbench_ended;
   int main_exit_code;
   bool atleast_one_active_input;
   sc_time last_event_time;
   sc_time last_event_time2;
   sc_signal< bool >                          cpp_testbench_active;
   sc_event testbench_end_event;
   sc_event testbench_aw_event;
   sc_event reset_request_event;
   bool _checked_results;
   bool _failed;
   static mc_testbench* that;
   bool _channel_mismatch;
   unsigned int remaining_ccs_input;
   bool _capture_input;
   int input_capture_count;
   int input_iteration_count;
   ac_channel<ac_int<8, true > > * input_pointer;
   bool input_pointer_set;
   bool _capture_coeffs;
   int coeffs_capture_count;
   int coeffs_iteration_count;
   unsigned int remaining_output_golden;
   tlm::tlm_fifo< mc_golden_info< ac_int<8, true >, MaskPacket<1, 8> > > output_golden;
   bool _capture_output;
   int output_capture_count;
   int output_iteration_count;
   ac_channel<ac_int<8, true > > * output_pointer;
   bool output_pointer_set;
   int wait_cnt;
   sc_time previous_timestamp;
   sc_time average_period;
   unsigned int period_counter;
   bool calculate_period;
   
   // Declare processes (SC_METHOD and SC_THREAD)
   void wait_for_end();
   void run();
   
   // Constructor
   SC_HAS_PROCESS(mc_testbench);
   mc_testbench(
      const sc_module_name& name
   )
      : clk("clk")
      , ccs_input("ccs_input")
      , ccs_wait_ctrl_input("ccs_wait_ctrl_input")
      , ccs_sizecount_input("ccs_sizecount_input")
      , ccs_coeffs("ccs_coeffs")
      , ccs_wait_ctrl_coeffs("ccs_wait_ctrl_coeffs")
      , ccs_output("ccs_output")
      , ccs_wait_ctrl_output("ccs_wait_ctrl_output")
      , design_is_idle("design_is_idle")
      , enable_stalls("enable_stalls")
      , stall_coverage("stall_coverage")
      , cpp_testbench_active("cpp_testbench_active")
      , remaining_ccs_input(0)
      , remaining_output_golden(0)
      , output_golden("output_golden",-1)
   {
      // Instantiate other modules
      output_comp = new mc_comparator< ac_int<8, true > , MaskPacket< 1, 8 > > (
         "output_comp",
         "output",
         1,
         ac_env::read_int("SCVerify_MAX_ERROR_CNT",0),
         1
      );
      output_comp->data_in(ccs_output);
      output_comp->data_golden(output_golden);
      
      
      // Register processes
      SC_METHOD(wait_for_end);
      sensitive << clk.pos() << testbench_end_event;
      SC_THREAD(run);
      // Other constructor statements
      set_stack_size(64000000);
      _checked_results = false;
      that = this;
      end_of_sim_wait_count = 0;
      testbench_ended = false;
      main_exit_code = 0;
      atleast_one_active_input = true;
      _failed = false;
      _capture_input = true;
      _capture_coeffs = true;
      _capture_output = true;
      wait_cnt = 0;
      previous_timestamp = SC_ZERO_TIME;
      average_period = SC_ZERO_TIME;
      period_counter = 0;
      calculate_period = true;
   }
   
   ~mc_testbench()
   {
      delete output_comp;
      output_comp = 0;
   }
   
   // C++ class functions
   public:
      static void wait_for_idle_sync() ;
   public:
      static void set_enable_stalls(bool flag) ;
   public:
      void reset_request() ;
   public:
      void capture_input( ac_channel<ac_int<8, true > > &input) ;
   public:
      void capture_coeffs( ac_int<8, true > coeffs[8]) ;
   public:
      void capture_output( ac_channel<ac_int<8, true > > &output) ;
   protected:
      void wait_on_input_required() ;
   public:
      static void capture_IN(ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &output) ;
   public:
      static void capture_OUT(ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &output) ;
   public:
      static void exec_run(ac_channel<ac_int<8, true> > &input, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &output) ;
   protected:
      void start_of_simulation() ;
   protected:
      void end_of_simulation() ;
   public:
      void check_results() ;
   public:
      bool failed() ;
   public:
      void set_failed(bool fail) ;
};
#endif
#endif //CCS_SCVERIFY
