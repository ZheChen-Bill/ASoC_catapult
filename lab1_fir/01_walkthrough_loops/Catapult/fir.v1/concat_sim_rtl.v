
//------> /usr/cadtool/mentor/Catapult/2023.1/Mgc_home/pkgs/siflibs/ccs_in_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_wait_v1 (idat, rdy, ivld, dat, irdy, vld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  output             rdy;
  output             ivld;
  input  [width-1:0] dat;
  input              irdy;
  input              vld;

  wire   [width-1:0] idat;
  wire               rdy;
  wire               ivld;

  localparam stallOff = 0; 
  wire                  stall_ctrl;
  assign stall_ctrl = stallOff;

  assign idat = dat;
  assign rdy = irdy && !stall_ctrl;
  assign ivld = vld && !stall_ctrl;

endmodule


//------> /usr/cadtool/mentor/Catapult/2023.1/Mgc_home/pkgs/siflibs/ccs_out_wait_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_out_wait_v1 (dat, irdy, vld, idat, rdy, ivld);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] dat;
  output             irdy;
  output             vld;
  input  [width-1:0] idat;
  input              rdy;
  input              ivld;

  wire   [width-1:0] dat;
  wire               irdy;
  wire               vld;

  localparam stallOff = 0; 
  wire stall_ctrl;
  assign stall_ctrl = stallOff;

  assign dat = idat;
  assign irdy = rdy && !stall_ctrl;
  assign vld = ivld && !stall_ctrl;

endmodule



//------> /usr/cadtool/mentor/Catapult/2023.1/Mgc_home/pkgs/siflibs/mgc_io_sync_v2.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module mgc_io_sync_v2 (ld, lz);
    parameter valid = 0;

    input  ld;
    output lz;

    wire   lz;

    assign lz = ld;

endmodule


//------> /usr/cadtool/mentor/Catapult/2023.1/Mgc_home/pkgs/siflibs/ccs_in_v1.v 
//------------------------------------------------------------------------------
// Catapult Synthesis - Sample I/O Port Library
//
// Copyright (c) 2003-2017 Mentor Graphics Corp.
//       All Rights Reserved
//
// This document may be used and distributed without restriction provided that
// this copyright statement is not removed from the file and that any derivative
// work contains this copyright notice.
//
// The design information contained in this file is intended to be an example
// of the functionality which the end user may study in preparation for creating
// their own custom interfaces. This design does not necessarily present a 
// complete implementation of the named protocol or standard.
//
//------------------------------------------------------------------------------


module ccs_in_v1 (idat, dat);

  parameter integer rscid = 1;
  parameter integer width = 8;

  output [width-1:0] idat;
  input  [width-1:0] dat;

  wire   [width-1:0] idat;

  assign idat = dat;

endmodule


//------> ./rtl.v 
// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.1/1033555 Production Release
//  HLS Date:       Mon Feb 13 11:32:25 PST 2023
// 
//  Generated by:   m111061545@ws41
//  Generated date: Tue Mar 26 18:29:03 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    fir_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module fir_run_run_fsm (
  clk, rst, run_wen, fsm_output, SHIFT_C_0_tr0
);
  input clk;
  input rst;
  input run_wen;
  output [2:0] fsm_output;
  reg [2:0] fsm_output;
  input SHIFT_C_0_tr0;


  // FSM State Type Declaration for fir_run_run_fsm_1
  parameter
    main_C_0 = 2'd0,
    SHIFT_C_0 = 2'd1,
    main_C_1 = 2'd2;

  reg [1:0] state_var;
  reg [1:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : fir_run_run_fsm_1
    case (state_var)
      SHIFT_C_0 : begin
        fsm_output = 3'b010;
        if ( SHIFT_C_0_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = SHIFT_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 3'b100;
        state_var_NS = main_C_0;
      end
      // main_C_0
      default : begin
        fsm_output = 3'b001;
        state_var_NS = SHIFT_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= main_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_staller
// ------------------------------------------------------------------


module fir_run_staller (
  clk, rst, run_wen, run_wten, input_rsci_wen_comp, output_rsci_wen_comp
);
  input clk;
  input rst;
  output run_wen;
  output run_wten;
  reg run_wten;
  input input_rsci_wen_comp;
  input output_rsci_wen_comp;



  // Interconnect Declarations for Component Instantiations 
  assign run_wen = input_rsci_wen_comp & output_rsci_wen_comp;
  always @(posedge clk) begin
    if ( rst ) begin
      run_wten <= 1'b0;
    end
    else begin
      run_wten <= ~ run_wen;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl
// ------------------------------------------------------------------


module fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl (
  run_wten, coeffs_triosy_obj_iswt0, coeffs_triosy_obj_biwt
);
  input run_wten;
  input coeffs_triosy_obj_iswt0;
  output coeffs_triosy_obj_biwt;



  // Interconnect Declarations for Component Instantiations 
  assign coeffs_triosy_obj_biwt = (~ run_wten) & coeffs_triosy_obj_iswt0;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_output_rsci_output_wait_ctrl
// ------------------------------------------------------------------


module fir_run_output_rsci_output_wait_ctrl (
  output_rsci_iswt0, output_rsci_biwt, output_rsci_irdy
);
  input output_rsci_iswt0;
  output output_rsci_biwt;
  input output_rsci_irdy;



  // Interconnect Declarations for Component Instantiations 
  assign output_rsci_biwt = output_rsci_iswt0 & output_rsci_irdy;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_input_rsci_input_wait_ctrl
// ------------------------------------------------------------------


module fir_run_input_rsci_input_wait_ctrl (
  input_rsci_iswt0, input_rsci_biwt, input_rsci_ivld
);
  input input_rsci_iswt0;
  output input_rsci_biwt;
  input input_rsci_ivld;



  // Interconnect Declarations for Component Instantiations 
  assign input_rsci_biwt = input_rsci_iswt0 & input_rsci_ivld;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_coeffs_triosy_obj
// ------------------------------------------------------------------


module fir_run_coeffs_triosy_obj (
  coeffs_triosy_lz, run_wten, coeffs_triosy_obj_iswt0
);
  output coeffs_triosy_lz;
  input run_wten;
  input coeffs_triosy_obj_iswt0;


  // Interconnect Declarations
  wire coeffs_triosy_obj_biwt;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) coeffs_triosy_obj (
      .ld(coeffs_triosy_obj_biwt),
      .lz(coeffs_triosy_lz)
    );
  fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl_inst
      (
      .run_wten(run_wten),
      .coeffs_triosy_obj_iswt0(coeffs_triosy_obj_iswt0),
      .coeffs_triosy_obj_biwt(coeffs_triosy_obj_biwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_output_rsci
// ------------------------------------------------------------------


module fir_run_output_rsci (
  output_rsc_dat, output_rsc_vld, output_rsc_rdy, output_rsci_oswt, output_rsci_wen_comp,
      output_rsci_idat
);
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;
  input output_rsci_oswt;
  output output_rsci_wen_comp;
  input [7:0] output_rsci_idat;


  // Interconnect Declarations
  wire output_rsci_biwt;
  wire output_rsci_irdy;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd3),
  .width(32'sd8)) output_rsci (
      .irdy(output_rsci_irdy),
      .ivld(output_rsci_oswt),
      .idat(output_rsci_idat),
      .rdy(output_rsc_rdy),
      .vld(output_rsc_vld),
      .dat(output_rsc_dat)
    );
  fir_run_output_rsci_output_wait_ctrl fir_run_output_rsci_output_wait_ctrl_inst
      (
      .output_rsci_iswt0(output_rsci_oswt),
      .output_rsci_biwt(output_rsci_biwt),
      .output_rsci_irdy(output_rsci_irdy)
    );
  assign output_rsci_wen_comp = (~ output_rsci_oswt) | output_rsci_biwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_input_rsci
// ------------------------------------------------------------------


module fir_run_input_rsci (
  input_rsc_dat, input_rsc_vld, input_rsc_rdy, input_rsci_oswt, input_rsci_wen_comp,
      input_rsci_idat_mxwt
);
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  input input_rsci_oswt;
  output input_rsci_wen_comp;
  output [7:0] input_rsci_idat_mxwt;


  // Interconnect Declarations
  wire input_rsci_biwt;
  wire input_rsci_ivld;
  wire [7:0] input_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd1),
  .width(32'sd8)) input_rsci (
      .rdy(input_rsc_rdy),
      .vld(input_rsc_vld),
      .dat(input_rsc_dat),
      .irdy(input_rsci_oswt),
      .ivld(input_rsci_ivld),
      .idat(input_rsci_idat)
    );
  fir_run_input_rsci_input_wait_ctrl fir_run_input_rsci_input_wait_ctrl_inst (
      .input_rsci_iswt0(input_rsci_oswt),
      .input_rsci_biwt(input_rsci_biwt),
      .input_rsci_ivld(input_rsci_ivld)
    );
  assign input_rsci_idat_mxwt = input_rsci_idat;
  assign input_rsci_wen_comp = (~ input_rsci_oswt) | input_rsci_biwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run
// ------------------------------------------------------------------


module fir_run (
  clk, rst, input_rsc_dat, input_rsc_vld, input_rsc_rdy, coeffs_rsc_dat, coeffs_triosy_lz,
      output_rsc_dat, output_rsc_vld, output_rsc_rdy
);
  input clk;
  input rst;
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  input [63:0] coeffs_rsc_dat;
  output coeffs_triosy_lz;
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;


  // Interconnect Declarations
  wire run_wen;
  wire run_wten;
  wire input_rsci_wen_comp;
  wire [7:0] input_rsci_idat_mxwt;
  wire [63:0] coeffs_rsci_idat;
  wire output_rsci_wen_comp;
  reg [7:0] output_rsci_idat;
  wire [2:0] fsm_output;
  wire [3:0] SHIFT_acc_1_tmp;
  wire [4:0] nl_SHIFT_acc_1_tmp;
  wire or_dcpl_5;
  wire or_dcpl_6;
  wire or_dcpl_7;
  wire or_dcpl_8;
  wire or_dcpl_9;
  wire or_dcpl_10;
  wire or_dcpl_11;
  wire or_dcpl_12;
  wire or_dcpl_14;
  wire or_dcpl_16;
  reg [2:0] SHIFT_i_3_0_sva_2_0;
  reg reg_input_rsci_oswt_cse;
  reg reg_coeffs_triosy_obj_iswt0_cse;
  wire MAC_and_m1c;
  wire MAC_and_m1c_1;
  wire MAC_and_m1c_2;
  wire MAC_and_m1c_3;
  wire MAC_and_m1c_4;
  wire MAC_and_m1c_5;
  wire or_13_cse;
  reg [2:0] MAC_i_3_0_sva_2_0;
  wire MAC_and_12_m1c;
  reg [7:0] regs_0_lpi_2;
  reg [7:0] regs_3_lpi_2;
  reg [7:0] regs_4_lpi_2;
  reg [7:0] regs_2_lpi_2;
  reg [7:0] regs_5_lpi_2;
  reg [7:0] regs_1_lpi_2;
  reg [7:0] regs_6_lpi_2;
  reg [7:0] regs_7_lpi_2;
  reg [18:0] temp_sva;
  wire [7:0] regs_0_lpi_2_mx1;
  wire [18:0] temp_sva_2;
  wire [19:0] nl_temp_sva_2;
  wire [7:0] SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
  wire [3:0] MAC_i_3_0_sva_2;
  wire [4:0] nl_MAC_i_3_0_sva_2;
  wire [2:0] SHIFT_else_acc_1_tmp;
  wire [3:0] nl_SHIFT_else_acc_1_tmp;
  wire and_60_cse;

  wire not_22_nl;
  wire not_31_nl;
  wire or_15_nl;
  wire[15:0] MAC_mul_nl;
  wire[7:0] MAC_mux_nl;
  wire[7:0] MAC_MAC_mux1h_nl;
  wire MAC_nor_nl;
  wire MAC_or_nl;
  wire MAC_and_6_nl;
  wire MAC_and_7_nl;
  wire MAC_and_8_nl;
  wire MAC_and_9_nl;
  wire MAC_and_10_nl;
  wire MAC_and_11_nl;
  wire MAC_and_20_nl;

  // Interconnect Declarations for Component Instantiations 
  ccs_in_v1 #(.rscid(32'sd2),
  .width(32'sd64)) coeffs_rsci (
      .dat(coeffs_rsc_dat),
      .idat(coeffs_rsci_idat)
    );
  fir_run_input_rsci fir_run_input_rsci_inst (
      .input_rsc_dat(input_rsc_dat),
      .input_rsc_vld(input_rsc_vld),
      .input_rsc_rdy(input_rsc_rdy),
      .input_rsci_oswt(reg_input_rsci_oswt_cse),
      .input_rsci_wen_comp(input_rsci_wen_comp),
      .input_rsci_idat_mxwt(input_rsci_idat_mxwt)
    );
  fir_run_output_rsci fir_run_output_rsci_inst (
      .output_rsc_dat(output_rsc_dat),
      .output_rsc_vld(output_rsc_vld),
      .output_rsc_rdy(output_rsc_rdy),
      .output_rsci_oswt(reg_coeffs_triosy_obj_iswt0_cse),
      .output_rsci_wen_comp(output_rsci_wen_comp),
      .output_rsci_idat(output_rsci_idat)
    );
  fir_run_coeffs_triosy_obj fir_run_coeffs_triosy_obj_inst (
      .coeffs_triosy_lz(coeffs_triosy_lz),
      .run_wten(run_wten),
      .coeffs_triosy_obj_iswt0(reg_coeffs_triosy_obj_iswt0_cse)
    );
  fir_run_staller fir_run_staller_inst (
      .clk(clk),
      .rst(rst),
      .run_wen(run_wen),
      .run_wten(run_wten),
      .input_rsci_wen_comp(input_rsci_wen_comp),
      .output_rsci_wen_comp(output_rsci_wen_comp)
    );
  fir_run_run_fsm fir_run_run_fsm_inst (
      .clk(clk),
      .rst(rst),
      .run_wen(run_wen),
      .fsm_output(fsm_output),
      .SHIFT_C_0_tr0(and_60_cse)
    );
  assign or_13_cse = or_dcpl_5 | (~ (SHIFT_i_3_0_sva_2_0[1]));
  assign and_60_cse = (MAC_i_3_0_sva_2[3]) & (SHIFT_acc_1_tmp[3]);
  assign or_15_nl = or_dcpl_11 | (SHIFT_i_3_0_sva_2_0[1]);
  assign regs_0_lpi_2_mx1 = MUX_v_8_2_2(input_rsci_idat_mxwt, regs_0_lpi_2, or_15_nl);
  assign MAC_and_m1c = (MAC_i_3_0_sva_2_0==3'b001);
  assign MAC_and_m1c_1 = (MAC_i_3_0_sva_2_0==3'b010);
  assign MAC_and_m1c_2 = (MAC_i_3_0_sva_2_0==3'b011);
  assign MAC_and_m1c_3 = (MAC_i_3_0_sva_2_0==3'b100);
  assign MAC_and_m1c_4 = (MAC_i_3_0_sva_2_0==3'b101);
  assign MAC_and_m1c_5 = (MAC_i_3_0_sva_2_0==3'b110);
  assign MAC_and_12_m1c = (MAC_i_3_0_sva_2_0==3'b111);
  assign MAC_mux_nl = MUX_v_8_8_2((coeffs_rsci_idat[7:0]), (coeffs_rsci_idat[15:8]),
      (coeffs_rsci_idat[23:16]), (coeffs_rsci_idat[31:24]), (coeffs_rsci_idat[39:32]),
      (coeffs_rsci_idat[47:40]), (coeffs_rsci_idat[55:48]), (coeffs_rsci_idat[63:56]),
      MAC_i_3_0_sva_2_0);
  assign MAC_nor_nl = ~((MAC_i_3_0_sva_2_0!=3'b000));
  assign MAC_or_nl = ((~ or_dcpl_8) & MAC_and_m1c) | ((~ or_dcpl_12) & MAC_and_m1c_1)
      | ((~ or_dcpl_14) & MAC_and_m1c_2) | ((~ or_dcpl_16) & MAC_and_m1c_3) | ((~
      or_dcpl_6) & MAC_and_m1c_4) | ((~ or_dcpl_10) & MAC_and_m1c_5) | ((~ or_13_cse)
      & MAC_and_12_m1c);
  assign MAC_and_6_nl = or_dcpl_8 & MAC_and_m1c;
  assign MAC_and_7_nl = or_dcpl_12 & MAC_and_m1c_1;
  assign MAC_and_8_nl = or_dcpl_14 & MAC_and_m1c_2;
  assign MAC_and_9_nl = or_dcpl_16 & MAC_and_m1c_3;
  assign MAC_and_10_nl = or_dcpl_6 & MAC_and_m1c_4;
  assign MAC_and_11_nl = or_dcpl_10 & MAC_and_m1c_5;
  assign MAC_and_20_nl = or_13_cse & MAC_and_12_m1c;
  assign MAC_MAC_mux1h_nl = MUX1HOT_v_8_9_2(regs_0_lpi_2_mx1, SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1,
      regs_1_lpi_2, regs_2_lpi_2, regs_3_lpi_2, regs_4_lpi_2, regs_5_lpi_2, regs_6_lpi_2,
      regs_7_lpi_2, {MAC_nor_nl , MAC_or_nl , MAC_and_6_nl , MAC_and_7_nl , MAC_and_8_nl
      , MAC_and_9_nl , MAC_and_10_nl , MAC_and_11_nl , MAC_and_20_nl});
  assign MAC_mul_nl = $signed(MAC_mux_nl) * $signed(MAC_MAC_mux1h_nl);
  assign nl_temp_sva_2 = temp_sva + conv_s2s_16_19(MAC_mul_nl);
  assign temp_sva_2 = nl_temp_sva_2[18:0];
  assign nl_SHIFT_else_acc_1_tmp = SHIFT_i_3_0_sva_2_0 + 3'b111;
  assign SHIFT_else_acc_1_tmp = nl_SHIFT_else_acc_1_tmp[2:0];
  assign SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1 = MUX_v_8_7_2(regs_0_lpi_2,
      regs_1_lpi_2, regs_2_lpi_2, regs_3_lpi_2, regs_4_lpi_2, regs_5_lpi_2, regs_6_lpi_2,
      SHIFT_else_acc_1_tmp);
  assign nl_SHIFT_acc_1_tmp = conv_u2s_3_4(SHIFT_i_3_0_sva_2_0) + 4'b1111;
  assign SHIFT_acc_1_tmp = nl_SHIFT_acc_1_tmp[3:0];
  assign nl_MAC_i_3_0_sva_2 = conv_u2s_3_4(MAC_i_3_0_sva_2_0) + 4'b1111;
  assign MAC_i_3_0_sva_2 = nl_MAC_i_3_0_sva_2[3:0];
  assign or_dcpl_5 = ~((SHIFT_i_3_0_sva_2_0[2]) & (SHIFT_i_3_0_sva_2_0[0]));
  assign or_dcpl_6 = or_dcpl_5 | (SHIFT_i_3_0_sva_2_0[1]);
  assign or_dcpl_7 = (SHIFT_i_3_0_sva_2_0[2]) | (~ (SHIFT_i_3_0_sva_2_0[0]));
  assign or_dcpl_8 = or_dcpl_7 | (SHIFT_i_3_0_sva_2_0[1]);
  assign or_dcpl_9 = (~ (SHIFT_i_3_0_sva_2_0[2])) | (SHIFT_i_3_0_sva_2_0[0]);
  assign or_dcpl_10 = or_dcpl_9 | (~ (SHIFT_i_3_0_sva_2_0[1]));
  assign or_dcpl_11 = (SHIFT_i_3_0_sva_2_0[2]) | (SHIFT_i_3_0_sva_2_0[0]);
  assign or_dcpl_12 = or_dcpl_11 | (~ (SHIFT_i_3_0_sva_2_0[1]));
  assign or_dcpl_14 = or_dcpl_7 | (~ (SHIFT_i_3_0_sva_2_0[1]));
  assign or_dcpl_16 = or_dcpl_9 | (SHIFT_i_3_0_sva_2_0[1]);
  always @(posedge clk) begin
    if ( rst ) begin
      reg_input_rsci_oswt_cse <= 1'b0;
      SHIFT_i_3_0_sva_2_0 <= 3'b000;
      MAC_i_3_0_sva_2_0 <= 3'b000;
      temp_sva <= 19'b0000000000000000000;
      reg_coeffs_triosy_obj_iswt0_cse <= 1'b0;
    end
    else if ( run_wen ) begin
      reg_input_rsci_oswt_cse <= (~((SHIFT_acc_1_tmp[0]) | and_60_cse)) & (SHIFT_acc_1_tmp[2:1]==2'b00)
          & (fsm_output[1]);
      SHIFT_i_3_0_sva_2_0 <= MUX_v_3_2_2((SHIFT_acc_1_tmp[2:0]), 3'b111, not_22_nl);
      MAC_i_3_0_sva_2_0 <= MUX_v_3_2_2((MAC_i_3_0_sva_2[2:0]), 3'b111, not_31_nl);
      temp_sva <= MUX_v_19_2_2(19'b0000000000000000000, temp_sva_2, (fsm_output[1]));
      reg_coeffs_triosy_obj_iswt0_cse <= and_60_cse & (fsm_output[1]);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_5_lpi_2 <= 8'b00000000;
    end
    else if ( (SHIFT_i_3_0_sva_2_0==3'b101) & (fsm_output[1]) & ((SHIFT_else_acc_1_tmp!=3'b101))
        & run_wen ) begin
      regs_5_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_1_lpi_2 <= 8'b00000000;
    end
    else if ( (SHIFT_i_3_0_sva_2_0==3'b001) & (fsm_output[1]) & ((SHIFT_else_acc_1_tmp!=3'b001))
        & run_wen ) begin
      regs_1_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_6_lpi_2 <= 8'b00000000;
    end
    else if ( (SHIFT_i_3_0_sva_2_0==3'b110) & (fsm_output[1]) & ((SHIFT_else_acc_1_tmp!=3'b110))
        & run_wen ) begin
      regs_6_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_2_lpi_2 <= 8'b00000000;
    end
    else if ( (SHIFT_i_3_0_sva_2_0==3'b010) & (fsm_output[1]) & ((SHIFT_else_acc_1_tmp!=3'b010))
        & run_wen ) begin
      regs_2_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_7_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~(((SHIFT_acc_1_tmp[2:0]==3'b111)) | and_60_cse)) & (~ or_13_cse)
        ) begin
      regs_7_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_3_lpi_2 <= 8'b00000000;
    end
    else if ( (SHIFT_i_3_0_sva_2_0==3'b011) & (fsm_output[1]) & ((SHIFT_else_acc_1_tmp!=3'b011))
        & run_wen ) begin
      regs_3_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_0_lpi_2 <= 8'b00000000;
    end
    else if ( ((SHIFT_acc_1_tmp[2:0]!=3'b000) | and_60_cse) & (fsm_output[1]) & run_wen
        & (SHIFT_i_3_0_sva_2_0==3'b000) ) begin
      regs_0_lpi_2 <= regs_0_lpi_2_mx1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_4_lpi_2 <= 8'b00000000;
    end
    else if ( (SHIFT_i_3_0_sva_2_0==3'b100) & (fsm_output[1]) & ((SHIFT_else_acc_1_tmp!=3'b100))
        & run_wen ) begin
      regs_4_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      output_rsci_idat <= 8'b00000000;
    end
    else if ( run_wen & and_60_cse & (fsm_output[1]) ) begin
      output_rsci_idat <= temp_sva_2[18:11];
    end
  end
  assign not_22_nl = ~ (fsm_output[1]);
  assign not_31_nl = ~ (fsm_output[1]);

  function automatic [7:0] MUX1HOT_v_8_9_2;
    input [7:0] input_8;
    input [7:0] input_7;
    input [7:0] input_6;
    input [7:0] input_5;
    input [7:0] input_4;
    input [7:0] input_3;
    input [7:0] input_2;
    input [7:0] input_1;
    input [7:0] input_0;
    input [8:0] sel;
    reg [7:0] result;
  begin
    result = input_0 & {8{sel[0]}};
    result = result | (input_1 & {8{sel[1]}});
    result = result | (input_2 & {8{sel[2]}});
    result = result | (input_3 & {8{sel[3]}});
    result = result | (input_4 & {8{sel[4]}});
    result = result | (input_5 & {8{sel[5]}});
    result = result | (input_6 & {8{sel[6]}});
    result = result | (input_7 & {8{sel[7]}});
    result = result | (input_8 & {8{sel[8]}});
    MUX1HOT_v_8_9_2 = result;
  end
  endfunction


  function automatic [18:0] MUX_v_19_2_2;
    input [18:0] input_0;
    input [18:0] input_1;
    input  sel;
    reg [18:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_19_2_2 = result;
  end
  endfunction


  function automatic [2:0] MUX_v_3_2_2;
    input [2:0] input_0;
    input [2:0] input_1;
    input  sel;
    reg [2:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_3_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_7_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input [7:0] input_2;
    input [7:0] input_3;
    input [7:0] input_4;
    input [7:0] input_5;
    input [7:0] input_6;
    input [2:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      3'b000 : begin
        result = input_0;
      end
      3'b001 : begin
        result = input_1;
      end
      3'b010 : begin
        result = input_2;
      end
      3'b011 : begin
        result = input_3;
      end
      3'b100 : begin
        result = input_4;
      end
      3'b101 : begin
        result = input_5;
      end
      default : begin
        result = input_6;
      end
    endcase
    MUX_v_8_7_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_8_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input [7:0] input_2;
    input [7:0] input_3;
    input [7:0] input_4;
    input [7:0] input_5;
    input [7:0] input_6;
    input [7:0] input_7;
    input [2:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      3'b000 : begin
        result = input_0;
      end
      3'b001 : begin
        result = input_1;
      end
      3'b010 : begin
        result = input_2;
      end
      3'b011 : begin
        result = input_3;
      end
      3'b100 : begin
        result = input_4;
      end
      3'b101 : begin
        result = input_5;
      end
      3'b110 : begin
        result = input_6;
      end
      default : begin
        result = input_7;
      end
    endcase
    MUX_v_8_8_2 = result;
  end
  endfunction


  function automatic [18:0] conv_s2s_16_19 ;
    input [15:0]  vector ;
  begin
    conv_s2s_16_19 = {{3{vector[15]}}, vector};
  end
  endfunction


  function automatic [3:0] conv_u2s_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2s_3_4 =  {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir
// ------------------------------------------------------------------


module fir (
  clk, rst, input_rsc_dat, input_rsc_vld, input_rsc_rdy, coeffs_rsc_dat, coeffs_triosy_lz,
      output_rsc_dat, output_rsc_vld, output_rsc_rdy
);
  input clk;
  input rst;
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  input [63:0] coeffs_rsc_dat;
  output coeffs_triosy_lz;
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;



  // Interconnect Declarations for Component Instantiations 
  fir_run fir_run_inst (
      .clk(clk),
      .rst(rst),
      .input_rsc_dat(input_rsc_dat),
      .input_rsc_vld(input_rsc_vld),
      .input_rsc_rdy(input_rsc_rdy),
      .coeffs_rsc_dat(coeffs_rsc_dat),
      .coeffs_triosy_lz(coeffs_triosy_lz),
      .output_rsc_dat(output_rsc_dat),
      .output_rsc_vld(output_rsc_vld),
      .output_rsc_rdy(output_rsc_rdy)
    );
endmodule



