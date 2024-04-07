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
#if defined(CCS_DUT_SYSC)
// alias ccs_DUT_wrapper to namespace enclosure of either cycle or RTL SystemC netlist
namespace
    ccs_design {
#if defined(CCS_DUT_CYCLE)
#include "cycle.cxx"
#else
#if defined(CCS_DUT_RTL)
#include "rtl.cxx"
#endif
#endif
}
typedef
    ccs_design::HDL::fir ccs_DUT_wrapper;

#else

// Create a foreign module wrapper around the HDL
#ifdef VCS_SYSTEMC
// VCS support - ccs_DUT_wrapper is derived from VCS-generated SystemC wrapper around HDL code
class ccs_DUT_wrapper : public TOP_HDL_ENTITY
{
public:
  ccs_DUT_wrapper(const sc_module_name& nm, const char *hdl_name)
  : TOP_HDL_ENTITY(nm)
  {
  // elaborate_foreign_module(hdl_name);
  }

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
  sc_in<sc_lv<8> > input_rsc_dat;
  sc_in<sc_logic> input_rsc_vld;
  sc_out<sc_logic> input_rsc_rdy;
  sc_out<sc_lv<8> > coeffs_rsc_radr;
  sc_out<sc_logic> coeffs_rsc_re;
  sc_in<sc_lv<8> > coeffs_rsc_q;
  sc_out<sc_logic> coeffs_triosy_lz;
  sc_in<sc_lv<5> > coeff_addr_rsc_dat;
  sc_in<sc_logic> coeff_addr_rsc_vld;
  sc_out<sc_logic> coeff_addr_rsc_rdy;
  sc_out<sc_lv<8> > output_rsc_dat;
  sc_out<sc_logic> output_rsc_vld;
  sc_in<sc_logic> output_rsc_rdy;
public:
  ccs_DUT_wrapper(const sc_module_name& nm, const char *hdl_name)
  :
    mc_foreign_module(nm, hdl_name), 
    clk("clk"), 
    rst("rst"), 
    input_rsc_dat("input_rsc_dat"), 
    input_rsc_vld("input_rsc_vld"), 
    input_rsc_rdy("input_rsc_rdy"), 
    coeffs_rsc_radr("coeffs_rsc_radr"), 
    coeffs_rsc_re("coeffs_rsc_re"), 
    coeffs_rsc_q("coeffs_rsc_q"), 
    coeffs_triosy_lz("coeffs_triosy_lz"), 
    coeff_addr_rsc_dat("coeff_addr_rsc_dat"), 
    coeff_addr_rsc_vld("coeff_addr_rsc_vld"), 
    coeff_addr_rsc_rdy("coeff_addr_rsc_rdy"), 
    output_rsc_dat("output_rsc_dat"), 
    output_rsc_vld("output_rsc_vld"), 
    output_rsc_rdy("output_rsc_rdy")
  {
    elaborate_foreign_module(hdl_name);
  }

  ~ccs_DUT_wrapper() {}
};
#endif

#endif

#ifdef CCS_SYSC
} // end namespace HDL
#endif
#endif


