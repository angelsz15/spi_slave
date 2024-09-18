// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Sep 17 12:59:30 2024
// Host        : DESKTOP-OK7LF37 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/Angel/Desktop/ICARO_24/fpga_spi_slave/V2.0/vivado_proyect/vivado_proyect.sim/sim_1/synth/func/xsim/spi_slave_tb_func_synth.v
// Design      : spi_slave
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* length_frame = "4" *) (* length_header = "0" *) 
(* NotValidForBitStream *)
module spi_slave
   (out_frame_saved,
    out_send_off,
    in_spi_clk,
    in_spi_cs,
    in_internal_clk,
    in_spi_mosi);
  output [3:0]out_frame_saved;
  output out_send_off;
  input in_spi_clk;
  input in_spi_cs;
  input in_internal_clk;
  input in_spi_mosi;

  wire [3:0]frame_buffer;
  wire \frame_buffer[1]_i_1_n_0 ;
  wire in_internal_clk;
  wire in_internal_clk_IBUF;
  wire in_internal_clk_IBUF_BUFG;
  wire in_spi_clk;
  wire in_spi_clk_IBUF;
  wire in_spi_clk_IBUF_BUFG;
  wire in_spi_cs;
  wire in_spi_cs_IBUF;
  wire in_spi_mosi;
  wire in_spi_mosi_IBUF;
  wire internal_flag;
  wire internal_flag_i_1_n_0;
  wire internal_flag_i_2_n_0;
  wire next_state;
  wire next_state_C_i_1_n_0;
  wire next_state_reg_C_n_0;
  wire next_state_reg_LDC_i_1_n_0;
  wire next_state_reg_LDC_n_0;
  wire next_state_reg_P_n_0;
  wire [3:0]out_frame_saved;
  wire [3:0]out_frame_saved_OBUF;
  wire out_send_off;
  wire out_send_off_OBUF;
  wire out_send_off_i_2_n_0;
  wire p_2_in;
  wire [1:0]position;
  wire \position[0]_i_1_n_0 ;
  wire \position[1]_i_1_n_0 ;
  wire \position[1]_i_2_n_0 ;
  wire state;

  LUT2 #(
    .INIT(4'h2)) 
    \frame_buffer[1]_i_1 
       (.I0(position[0]),
        .I1(position[1]),
        .O(\frame_buffer[1]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \frame_buffer_reg[0] 
       (.C(in_spi_clk_IBUF_BUFG),
        .CE(p_2_in),
        .CLR(\position[1]_i_2_n_0 ),
        .D(in_spi_mosi_IBUF),
        .Q(frame_buffer[0]));
  FDCE #(
    .INIT(1'b0)) 
    \frame_buffer_reg[1] 
       (.C(in_spi_clk_IBUF_BUFG),
        .CE(\frame_buffer[1]_i_1_n_0 ),
        .CLR(\position[1]_i_2_n_0 ),
        .D(in_spi_mosi_IBUF),
        .Q(frame_buffer[1]));
  FDCE #(
    .INIT(1'b0)) 
    \frame_buffer_reg[2] 
       (.C(in_spi_clk_IBUF_BUFG),
        .CE(\position[0]_i_1_n_0 ),
        .CLR(\position[1]_i_2_n_0 ),
        .D(in_spi_mosi_IBUF),
        .Q(frame_buffer[2]));
  FDCE #(
    .INIT(1'b0)) 
    \frame_buffer_reg[3] 
       (.C(in_spi_clk_IBUF_BUFG),
        .CE(\position[1]_i_1_n_0 ),
        .CLR(\position[1]_i_2_n_0 ),
        .D(in_spi_mosi_IBUF),
        .Q(frame_buffer[3]));
  BUFG in_internal_clk_IBUF_BUFG_inst
       (.I(in_internal_clk_IBUF),
        .O(in_internal_clk_IBUF_BUFG));
  IBUF in_internal_clk_IBUF_inst
       (.I(in_internal_clk),
        .O(in_internal_clk_IBUF));
  BUFG in_spi_clk_IBUF_BUFG_inst
       (.I(in_spi_clk_IBUF),
        .O(in_spi_clk_IBUF_BUFG));
  IBUF in_spi_clk_IBUF_inst
       (.I(in_spi_clk),
        .O(in_spi_clk_IBUF));
  IBUF in_spi_cs_IBUF_inst
       (.I(in_spi_cs),
        .O(in_spi_cs_IBUF));
  IBUF in_spi_mosi_IBUF_inst
       (.I(in_spi_mosi),
        .O(in_spi_mosi_IBUF));
  LUT2 #(
    .INIT(4'h1)) 
    internal_flag_i_1
       (.I0(position[0]),
        .I1(position[1]),
        .O(internal_flag_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    internal_flag_i_2
       (.I0(internal_flag),
        .I1(state),
        .O(internal_flag_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    internal_flag_reg
       (.C(in_spi_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(internal_flag_i_2_n_0),
        .D(internal_flag_i_1_n_0),
        .Q(internal_flag));
  LUT6 #(
    .INIT(64'h00000000E2E2E200)) 
    next_state_C_i_1
       (.I0(next_state_reg_C_n_0),
        .I1(next_state_reg_LDC_n_0),
        .I2(next_state_reg_P_n_0),
        .I3(position[1]),
        .I4(position[0]),
        .I5(in_spi_cs_IBUF),
        .O(next_state_C_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    next_state_reg_C
       (.C(in_spi_clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(next_state_reg_LDC_i_1_n_0),
        .D(next_state_C_i_1_n_0),
        .Q(next_state_reg_C_n_0));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE" *) 
  LDCE #(
    .INIT(1'b0)) 
    next_state_reg_LDC
       (.CLR(next_state_reg_LDC_i_1_n_0),
        .D(1'b1),
        .G(\position[1]_i_2_n_0 ),
        .GE(1'b1),
        .Q(next_state_reg_LDC_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    next_state_reg_LDC_i_1
       (.I0(in_spi_cs_IBUF),
        .I1(state),
        .O(next_state_reg_LDC_i_1_n_0));
  FDPE #(
    .INIT(1'b1)) 
    next_state_reg_P
       (.C(in_spi_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(next_state_C_i_1_n_0),
        .PRE(\position[1]_i_2_n_0 ),
        .Q(next_state_reg_P_n_0));
  OBUF \out_frame_saved_OBUF[0]_inst 
       (.I(out_frame_saved_OBUF[0]),
        .O(out_frame_saved[0]));
  OBUF \out_frame_saved_OBUF[1]_inst 
       (.I(out_frame_saved_OBUF[1]),
        .O(out_frame_saved[1]));
  OBUF \out_frame_saved_OBUF[2]_inst 
       (.I(out_frame_saved_OBUF[2]),
        .O(out_frame_saved[2]));
  OBUF \out_frame_saved_OBUF[3]_inst 
       (.I(out_frame_saved_OBUF[3]),
        .O(out_frame_saved[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \out_frame_saved_reg[0] 
       (.CLR(1'b0),
        .D(frame_buffer[0]),
        .G(internal_flag),
        .GE(1'b1),
        .Q(out_frame_saved_OBUF[0]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \out_frame_saved_reg[1] 
       (.CLR(1'b0),
        .D(frame_buffer[1]),
        .G(internal_flag),
        .GE(1'b1),
        .Q(out_frame_saved_OBUF[1]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \out_frame_saved_reg[2] 
       (.CLR(1'b0),
        .D(frame_buffer[2]),
        .G(internal_flag),
        .GE(1'b1),
        .Q(out_frame_saved_OBUF[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \out_frame_saved_reg[3] 
       (.CLR(1'b0),
        .D(frame_buffer[3]),
        .G(internal_flag),
        .GE(1'b1),
        .Q(out_frame_saved_OBUF[3]));
  OBUF out_send_off_OBUF_inst
       (.I(out_send_off_OBUF),
        .O(out_send_off));
  LUT2 #(
    .INIT(4'h1)) 
    out_send_off_i_1
       (.I0(position[0]),
        .I1(position[1]),
        .O(p_2_in));
  LUT1 #(
    .INIT(2'h1)) 
    out_send_off_i_2
       (.I0(state),
        .O(out_send_off_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    out_send_off_reg
       (.C(in_spi_clk_IBUF_BUFG),
        .CE(p_2_in),
        .CLR(out_send_off_i_2_n_0),
        .D(1'b1),
        .Q(out_send_off_OBUF));
  LUT2 #(
    .INIT(4'h2)) 
    \position[0]_i_1 
       (.I0(position[1]),
        .I1(position[0]),
        .O(\position[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \position[1]_i_1 
       (.I0(position[1]),
        .I1(position[0]),
        .O(\position[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \position[1]_i_2 
       (.I0(in_spi_cs_IBUF),
        .I1(state),
        .O(\position[1]_i_2_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \position_reg[0] 
       (.C(in_spi_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\position[0]_i_1_n_0 ),
        .PRE(\position[1]_i_2_n_0 ),
        .Q(position[0]));
  FDPE #(
    .INIT(1'b1)) 
    \position_reg[1] 
       (.C(in_spi_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\position[1]_i_1_n_0 ),
        .PRE(\position[1]_i_2_n_0 ),
        .Q(position[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    state_i_1
       (.I0(next_state_reg_P_n_0),
        .I1(next_state_reg_LDC_n_0),
        .I2(next_state_reg_C_n_0),
        .O(next_state));
  FDRE #(
    .INIT(1'b0)) 
    state_reg
       (.C(in_internal_clk_IBUF_BUFG),
        .CE(1'b1),
        .D(next_state),
        .Q(state),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
