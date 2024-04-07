// SCVerify DUT wrapper used for SystemC > HDL interface bindings


module ccs_wrapper (
  clk, rst, din_rsc_dat, din_rsc_vld, din_rsc_rdy, coeffs, dout_rsc_dat, dout_rsc_vld, dout_rsc_rdy
);
  input clk;
  input rst;
  input [7:0] din_rsc_dat;
  input din_rsc_vld;
  output din_rsc_rdy;
  input [63:0] coeffs;
  output [7:0] dout_rsc_dat;
  output dout_rsc_vld;
  input dout_rsc_rdy;


  top dut_inst (
    .clk(clk),
    .rst(rst),
    .din_rsc_dat(din_rsc_dat),
    .din_rsc_vld(din_rsc_vld),
    .din_rsc_rdy(din_rsc_rdy),
    .coeffs(coeffs),
    .dout_rsc_dat(dout_rsc_dat),
    .dout_rsc_vld(dout_rsc_vld),
    .dout_rsc_rdy(dout_rsc_rdy)
  );

endmodule

