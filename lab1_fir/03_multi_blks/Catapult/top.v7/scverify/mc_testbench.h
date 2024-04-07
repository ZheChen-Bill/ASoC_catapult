// ----------------------------------------------------------------------------
// SystemC Testbench Header
//
//    HLS version: 2024.1/1091966 Production Release
//       HLS date: Wed Feb 14 09:07:18 PST 2024
//  Flow Packages: HDL_Tcl 8.0a, SCVerify 10.4
//
//   Generated by: m111061545@ws41
// Generated date: Sun Apr 07 21:45:45 CST 2024
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

#include "../../top.h"
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
   mc_comparator< ac_int<8, true > , MaskPacket< 1, 8 > > *dout_comp;
   
   // Interface Ports
   sc_in< bool > clk;
   sc_port< tlm::tlm_fifo_put_if< ac_int<8, true > > > ccs_din;
   sc_port< tlm::tlm_fifo_put_if< mc_wait_ctrl > > ccs_wait_ctrl_din;
   sc_port< tlm::tlm_fifo_put_if< int > > ccs_sizecount_din;
   sc_port< tlm::tlm_fifo_put_if< mgc_sysc_ver_array1D<ac_int<8, true >,8> > > ccs_coeffs;
   sc_port< tlm::tlm_fifo_put_if< mc_wait_ctrl > > ccs_wait_ctrl_coeffs;
   sc_port< tlm::tlm_fifo_get_if< ac_int<8, true > > > ccs_dout;
   sc_port< tlm::tlm_fifo_put_if< mc_wait_ctrl > > ccs_wait_ctrl_dout;
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
   unsigned int remaining_ccs_din;
   bool _capture_din;
   int din_capture_count;
   int din_iteration_count;
   ac_channel<ac_int<8, true > > * din_pointer;
   bool din_pointer_set;
   bool _capture_coeffs;
   int coeffs_capture_count;
   int coeffs_iteration_count;
   ac_int<8, true > coeffs_prev_value[8];
   bool coeffs_idle_warning;
   bool coeffs_mismatch;
   unsigned int remaining_dout_golden;
   tlm::tlm_fifo< mc_golden_info< ac_int<8, true >, MaskPacket<1, 8> > > dout_golden;
   bool _capture_dout;
   int dout_capture_count;
   int dout_iteration_count;
   ac_channel<ac_int<8, true > > * dout_pointer;
   bool dout_pointer_set;
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
      , ccs_din("ccs_din")
      , ccs_wait_ctrl_din("ccs_wait_ctrl_din")
      , ccs_sizecount_din("ccs_sizecount_din")
      , ccs_coeffs("ccs_coeffs")
      , ccs_wait_ctrl_coeffs("ccs_wait_ctrl_coeffs")
      , ccs_dout("ccs_dout")
      , ccs_wait_ctrl_dout("ccs_wait_ctrl_dout")
      , design_is_idle("design_is_idle")
      , enable_stalls("enable_stalls")
      , stall_coverage("stall_coverage")
      , cpp_testbench_active("cpp_testbench_active")
      , remaining_ccs_din(0)
      , remaining_dout_golden(0)
      , dout_golden("dout_golden",-1)
   {
      // Instantiate other modules
      dout_comp = new mc_comparator< ac_int<8, true > , MaskPacket< 1, 8 > > (
         "dout_comp",
         "dout",
         1,
         ac_env::read_int("SCVerify_MAX_ERROR_CNT",0),
         1
      );
      dout_comp->data_in(ccs_dout);
      dout_comp->data_golden(dout_golden);
      
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
      _capture_din = true;
      _capture_coeffs = true;
      _capture_dout = true;
      wait_cnt = 0;
      previous_timestamp = SC_ZERO_TIME;
      average_period = SC_ZERO_TIME;
      period_counter = 0;
      calculate_period = true;
   }
   
   ~mc_testbench()
   {
      delete dout_comp;
      dout_comp = 0;
   }
   
   // C++ class functions
   public:
      static void wait_for_idle_sync() ;
   public:
      static void set_enable_stalls(bool flag) ;
   public:
      void reset_request() ;
   public:
      void capture_din( ac_channel<ac_int<8, true > > &din) ;
   public:
      void capture_coeffs( ac_int<8, true > coeffs[8]) ;
   public:
      void capture_dout( ac_channel<ac_int<8, true > > &dout) ;
   protected:
      void wait_on_input_required() ;
   public:
      static void capture_IN(ac_channel<ac_int<8, true> > &din, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &dout) ;
   public:
      static void capture_OUT(ac_channel<ac_int<8, true> > &din, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &dout) ;
   public:
      static void exec_run(ac_channel<ac_int<8, true> > &din, ac_int<8, true> coeffs[8], ac_channel<ac_int<8, true> > &dout) ;
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
