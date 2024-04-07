// mc_dut_wrapper.h
#ifndef INCLUDED_CCS_DUT_WRAPPER_H
#define INCLUDED_CCS_DUT_WRAPPER_H

#ifndef SC_USE_STD_STRING
#define SC_USE_STD_STRING
#endif

#include <systemc.h>
#include <mc_simulator_extensions.h>

#ifdef CCS_SYSC
namespace HDL {
#endif

// Create a foreign module wrapper around the HDL
#ifdef VCS_SYSTEMC
// VCS support - ccs_DUT_wrapper is derived from VCS-generated SystemC wrapper around HDL code
class ccs_DUT_wrapper : public ccs_wrapper
{
public:
  ccs_DUT_wrapper(const sc_module_name& nm, const char *hdl_name)
  : ccs_wrapper(nm)
  {}
  ~ccs_DUT_wrapper() {}
};

#else
// non VCS simulators - ccs_DUT_wrapper is derived from mc_foreign_module (adding 2nd ctor arg)
class ccs_DUT_wrapper: public mc_foreign_module
{
public:
  // Interface Ports
  sc_in<bool> clk;
  sc_in<sc_logic> rst;
  sc_in<sc_lv<8> > din_rsc_dat;
  sc_in<sc_logic> din_rsc_vld;
  sc_out<sc_logic> din_rsc_rdy;
  sc_in<sc_lv<64> > coeffs;
  sc_out<sc_lv<8> > dout_rsc_dat;
  sc_out<sc_logic> dout_rsc_vld;
  sc_in<sc_logic> dout_rsc_rdy;
public:
  ccs_DUT_wrapper(const sc_module_name& nm, const char *hdl_name)
  :
    mc_foreign_module(nm, hdl_name), 
    clk("clk"), 
    rst("rst"), 
    din_rsc_dat("din_rsc_dat"), 
    din_rsc_vld("din_rsc_vld"), 
    din_rsc_rdy("din_rsc_rdy"), 
    coeffs("coeffs"), 
    dout_rsc_dat("dout_rsc_dat"), 
    dout_rsc_vld("dout_rsc_vld"), 
    dout_rsc_rdy("dout_rsc_rdy")
  {
    elaborate_foreign_module(hdl_name);
  }

  ~ccs_DUT_wrapper() {}
};
#endif // VCS_SYSTEMC

#ifdef CCS_SYSC
} // namespace HDL
#endif
#endif // INCLUDED_CCS_DUT_WRAPPER_H


