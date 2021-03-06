// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Autocorrelation (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        s_address0,
        s_ce0,
        s_we0,
        s_d0,
        s_q0,
        s_address1,
        s_ce1,
        s_we1,
        s_d1,
        s_q1,
        s_offset
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_pp0_stage0 = 11'd2;
parameter    ap_ST_fsm_state4 = 11'd4;
parameter    ap_ST_fsm_state5 = 11'd8;
parameter    ap_ST_fsm_state6 = 11'd16;
parameter    ap_ST_fsm_state7 = 11'd32;
parameter    ap_ST_fsm_state8 = 11'd64;
parameter    ap_ST_fsm_state9 = 11'd128;
parameter    ap_ST_fsm_state10 = 11'd256;
parameter    ap_ST_fsm_state11 = 11'd512;
parameter    ap_ST_fsm_state12 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [2:0] s_address0;
output   s_ce0;
output   s_we0;
output  [15:0] s_d0;
input  [15:0] s_q0;
output  [2:0] s_address1;
output   s_ce1;
output   s_we1;
output  [15:0] s_d1;
input  [15:0] s_q1;
input  [2:0] s_offset;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[2:0] s_address0;
reg s_ce0;
reg s_we0;
reg[15:0] s_d0;
reg[2:0] s_address1;
reg s_ce1;
reg s_we1;
reg[15:0] s_d1;

(* fsm_encoding = "none" *) reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [7:0] bitoff_address0;
reg    bitoff_ce0;
wire   [3:0] bitoff_q0;
wire   [7:0] bitoff_address1;
reg    bitoff_ce1;
wire   [3:0] bitoff_q1;
wire   [7:0] bitoff_address2;
reg    bitoff_ce2;
wire   [3:0] bitoff_q2;
reg   [15:0] smax_reg_231;
reg   [2:0] k_reg_243;
reg  signed [15:0] reg_265;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state10;
reg  signed [15:0] reg_270;
wire   [63:0] s_offset_cast1_fu_275_p1;
reg   [63:0] s_offset_cast1_reg_852;
wire   [0:0] exitcond2_fu_279_p2;
reg   [0:0] exitcond2_reg_858;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [2:0] k_1_fu_285_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [15:0] temp_0_smax_fu_343_p3;
reg    ap_enable_reg_pp0_iter1;
wire   [0:0] tmp_fu_351_p2;
reg   [0:0] tmp_reg_877;
wire    ap_CS_fsm_state4;
wire   [0:0] tmp_1_i_fu_365_p2;
reg   [0:0] tmp_1_i_reg_881;
wire   [0:0] tmp_74_fu_371_p3;
reg   [0:0] tmp_74_reg_887;
wire   [0:0] icmp_fu_429_p2;
reg   [0:0] icmp_reg_892;
wire   [0:0] icmp8_fu_445_p2;
reg   [0:0] icmp8_reg_898;
wire   [0:0] icmp9_fu_500_p2;
reg   [0:0] icmp9_reg_918;
wire  signed [15:0] n_cast_fu_624_p1;
reg  signed [15:0] n_cast_reg_923;
wire    ap_CS_fsm_state5;
wire   [0:0] tmp_66_fu_628_p2;
reg   [0:0] tmp_66_reg_931;
wire   [0:0] or_cond_79_fu_640_p2;
reg   [0:0] or_cond_79_reg_935;
wire   [2:0] tmp_79_fu_646_p1;
reg   [2:0] tmp_79_reg_939;
reg   [2:0] s_addr_1_reg_944;
reg   [2:0] s_addr_2_reg_950;
reg   [2:0] s_addr_3_reg_956;
reg   [2:0] s_addr_4_reg_961;
reg   [15:0] tmp_25_i1_reg_966;
wire    ap_CS_fsm_state7;
reg   [15:0] tmp_25_i2_reg_971;
reg   [2:0] s_addr_5_reg_976;
wire    ap_CS_fsm_state8;
reg   [2:0] s_addr_6_reg_981;
wire    ap_CS_fsm_state9;
reg   [2:0] s_addr_7_reg_986;
reg   [2:0] s_addr_8_reg_991;
wire   [15:0] tmp_128_2_fu_795_p2;
reg   [15:0] tmp_128_2_reg_996;
wire    ap_CS_fsm_state11;
wire   [15:0] tmp_128_3_fu_800_p2;
reg   [15:0] tmp_128_3_reg_1001;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
wire    ap_block_pp0_stage0;
wire   [5:0] scalauto_fu_616_p3;
reg  signed [5:0] ap_phi_mux_n_phi_fu_258_p4;
reg  signed [5:0] n_reg_254;
wire   [63:0] sum_cast_fu_296_p1;
wire   [63:0] tmp_9_i_cast_cast_fu_451_p3;
wire   [63:0] tmp_15_i_cast_fu_470_p1;
wire   [63:0] tmp_19_i_cast_fu_485_p1;
wire   [63:0] sum2_1_cast_fu_655_p1;
wire   [63:0] sum2_2_cast_fu_665_p1;
wire   [63:0] sum2_3_cast_fu_675_p1;
wire   [63:0] sum4_1_cast_fu_758_p1;
wire   [63:0] sum4_2_cast_fu_768_p1;
wire   [63:0] sum4_3_cast_fu_778_p1;
wire   [15:0] tmp_71_fu_783_p2;
wire   [15:0] tmp_128_1_fu_789_p2;
wire    ap_CS_fsm_state12;
wire   [2:0] sum_fu_291_p2;
wire   [0:0] tmp_i_fu_309_p2;
wire   [15:0] tmp_35_i_fu_315_p2;
wire   [0:0] tmp_68_fu_301_p3;
wire   [15:0] tmp_36_i_fu_321_p3;
wire   [15:0] smax_2_fu_329_p3;
wire   [0:0] tmp_s_fu_337_p2;
wire   [31:0] a_assign_1_fu_357_p3;
wire   [7:0] tmp_75_fu_387_p1;
wire   [31:0] a_lobit_i_cast_fu_379_p3;
wire   [23:0] tmp_65_fu_399_p3;
wire   [23:0] tmp_64_fu_391_p3;
wire   [31:0] a_assign_2_fu_407_p2;
wire   [15:0] tmp_76_fu_419_p4;
wire   [7:0] tmp_77_fu_435_p4;
wire   [23:0] p_i_cast26_cast_fu_413_p2;
wire   [7:0] tmp_14_i_cast_fu_460_p4;
wire   [7:0] tmp_18_i_cast_fu_475_p4;
wire   [23:0] tmp_78_fu_490_p4;
wire   [3:0] tmp_17_i_fu_510_p2;
wire   [3:0] tmp_21_i_fu_520_p2;
wire   [0:0] sel_tmp2_i_fu_530_p2;
wire   [0:0] sel_tmp6_i_fu_535_p2;
wire   [0:0] tmp20_fu_540_p2;
wire   [0:0] tmp21_fu_551_p2;
wire   [0:0] sel_tmp20_i_fu_561_p2;
wire   [4:0] tmp_i1_cast_fu_506_p1;
wire   [4:0] newSel_v_fu_566_p3;
wire   [4:0] newSel_fu_574_p2;
wire   [0:0] sel_tmp14_i_fu_556_p2;
wire   [0:0] sel_tmp7_i_fu_546_p2;
wire   [4:0] tmp_17_i_cast_fu_516_p1;
wire  signed [4:0] tmp_21_i_cast_fu_526_p1;
wire   [4:0] newSel1_fu_590_p3;
wire   [0:0] or_cond_fu_584_p2;
wire   [5:0] newSel_cast_fu_580_p1;
wire  signed [5:0] newSel22_cast_fu_598_p1;
wire   [5:0] newSel2_fu_602_p3;
wire   [5:0] sel_tmp21_i_op_fu_610_p2;
wire   [0:0] tmp_67_fu_634_p2;
wire   [2:0] sum2_1_fu_650_p2;
wire   [2:0] sum2_2_fu_660_p2;
wire   [2:0] sum2_3_fu_670_p2;
wire   [2:0] tmp_69_fu_680_p2;
wire   [14:0] tmp_97_cast_fu_685_p1;
wire   [14:0] tmp_70_fu_689_p2;
wire  signed [30:0] grp_fu_805_p3;
wire  signed [30:0] grp_fu_814_p3;
wire  signed [30:0] grp_fu_823_p3;
wire  signed [30:0] grp_fu_832_p3;
wire   [2:0] sum4_1_fu_753_p2;
wire   [2:0] sum4_2_fu_763_p2;
wire   [2:0] sum4_3_fu_773_p2;
wire   [15:0] tmp_71_fu_783_p0;
wire   [15:0] tmp_128_1_fu_789_p0;
wire   [14:0] grp_fu_805_p0;
wire   [30:0] tmp_23_i_cast_fu_699_p1;
wire   [15:0] grp_fu_805_p2;
wire   [14:0] grp_fu_814_p0;
wire   [15:0] grp_fu_814_p2;
wire   [14:0] grp_fu_823_p0;
wire   [15:0] grp_fu_823_p2;
wire   [14:0] grp_fu_832_p0;
wire   [15:0] grp_fu_832_p2;
reg   [10:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 11'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

Autocorrelation_bbkb #(
    .DataWidth( 4 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
bitoff_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(bitoff_address0),
    .ce0(bitoff_ce0),
    .q0(bitoff_q0),
    .address1(bitoff_address1),
    .ce1(bitoff_ce1),
    .q1(bitoff_q1),
    .address2(bitoff_address2),
    .ce2(bitoff_ce2),
    .q2(bitoff_q2)
);

aqed_top_mac_mulacud #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 15 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .dout_WIDTH( 31 ))
aqed_top_mac_mulacud_U9(
    .din0(grp_fu_805_p0),
    .din1(reg_265),
    .din2(grp_fu_805_p2),
    .dout(grp_fu_805_p3)
);

aqed_top_mac_mulacud #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 15 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .dout_WIDTH( 31 ))
aqed_top_mac_mulacud_U10(
    .din0(grp_fu_814_p0),
    .din1(reg_270),
    .din2(grp_fu_814_p2),
    .dout(grp_fu_814_p3)
);

aqed_top_mac_mulacud #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 15 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .dout_WIDTH( 31 ))
aqed_top_mac_mulacud_U11(
    .din0(grp_fu_823_p0),
    .din1(s_q1),
    .din2(grp_fu_823_p2),
    .dout(grp_fu_823_p3)
);

aqed_top_mac_mulacud #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 15 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .dout_WIDTH( 31 ))
aqed_top_mac_mulacud_U12(
    .din0(grp_fu_832_p0),
    .din1(s_q0),
    .din2(grp_fu_832_p2),
    .dout(grp_fu_832_p3)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond2_fu_279_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        k_reg_243 <= k_1_fu_285_p2;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        k_reg_243 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state4) & (tmp_fu_351_p2 == 1'd1))) begin
        n_reg_254 <= 6'd0;
    end else if (((1'b1 == ap_CS_fsm_state5) & (tmp_reg_877 == 1'd0))) begin
        n_reg_254 <= scalauto_fu_616_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        reg_265 <= s_q1;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        reg_265 <= s_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        reg_270 <= s_q0;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        reg_270 <= s_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond2_reg_858 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        smax_reg_231 <= temp_0_smax_fu_343_p3;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        smax_reg_231 <= 16'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        exitcond2_reg_858 <= exitcond2_fu_279_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state4) & (tmp_fu_351_p2 == 1'd0))) begin
        icmp8_reg_898 <= icmp8_fu_445_p2;
        icmp9_reg_918 <= icmp9_fu_500_p2;
        icmp_reg_892 <= icmp_fu_429_p2;
        tmp_1_i_reg_881 <= tmp_1_i_fu_365_p2;
        tmp_74_reg_887 <= smax_reg_231[32'd15];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        n_cast_reg_923 <= n_cast_fu_624_p1;
        or_cond_79_reg_935 <= or_cond_79_fu_640_p2;
        tmp_66_reg_931 <= tmp_66_fu_628_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state5) & (or_cond_79_fu_640_p2 == 1'd1))) begin
        s_addr_1_reg_944 <= s_offset_cast1_reg_852;
        s_addr_2_reg_950 <= sum2_1_cast_fu_655_p1;
        tmp_79_reg_939 <= tmp_79_fu_646_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        s_addr_3_reg_956 <= sum2_2_cast_fu_665_p1;
        s_addr_4_reg_961 <= sum2_3_cast_fu_675_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state8) & (tmp_66_reg_931 == 1'd1))) begin
        s_addr_5_reg_976 <= s_offset_cast1_reg_852;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        s_addr_6_reg_981 <= sum4_1_cast_fu_758_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        s_addr_7_reg_986 <= sum4_2_cast_fu_768_p1;
        s_addr_8_reg_991 <= sum4_3_cast_fu_778_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        s_offset_cast1_reg_852[2 : 0] <= s_offset_cast1_fu_275_p1[2 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        tmp_128_2_reg_996 <= tmp_128_2_fu_795_p2;
        tmp_128_3_reg_1001 <= tmp_128_3_fu_800_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        tmp_25_i1_reg_966 <= {{grp_fu_823_p3[30:15]}};
        tmp_25_i2_reg_971 <= {{grp_fu_832_p3[30:15]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        tmp_reg_877 <= tmp_fu_351_p2;
    end
end

always @ (*) begin
    if ((exitcond2_fu_279_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state12) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) & (tmp_reg_877 == 1'd0))) begin
        ap_phi_mux_n_phi_fu_258_p4 = scalauto_fu_616_p3;
    end else begin
        ap_phi_mux_n_phi_fu_258_p4 = n_reg_254;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        bitoff_ce0 = 1'b1;
    end else begin
        bitoff_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        bitoff_ce1 = 1'b1;
    end else begin
        bitoff_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        bitoff_ce2 = 1'b1;
    end else begin
        bitoff_ce2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        s_address0 = s_addr_8_reg_991;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        s_address0 = s_addr_6_reg_981;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        s_address0 = sum4_3_cast_fu_778_p1;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        s_address0 = sum4_1_cast_fu_758_p1;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        s_address0 = s_addr_4_reg_961;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        s_address0 = s_addr_2_reg_950;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        s_address0 = sum2_3_cast_fu_675_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        s_address0 = s_offset_cast1_reg_852;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s_address0 = sum_cast_fu_296_p1;
    end else begin
        s_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        s_address1 = s_addr_7_reg_986;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        s_address1 = sum4_2_cast_fu_768_p1;
    end else if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state9))) begin
        s_address1 = s_addr_5_reg_976;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        s_address1 = s_addr_3_reg_956;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        s_address1 = s_addr_1_reg_944;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        s_address1 = sum2_2_cast_fu_665_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        s_address1 = sum2_1_cast_fu_655_p1;
    end else begin
        s_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state5) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        s_ce0 = 1'b1;
    end else begin
        s_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state5))) begin
        s_ce1 = 1'b1;
    end else begin
        s_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        s_d0 = tmp_128_3_reg_1001;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        s_d0 = tmp_128_1_fu_789_p2;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        s_d0 = tmp_25_i2_reg_971;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        s_d0 = {{grp_fu_814_p3[30:15]}};
    end else begin
        s_d0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        s_d1 = tmp_128_2_reg_996;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        s_d1 = tmp_71_fu_783_p2;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        s_d1 = tmp_25_i1_reg_966;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        s_d1 = {{grp_fu_805_p3[30:15]}};
    end else begin
        s_d1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state7) | ((1'b1 == ap_CS_fsm_state12) & (tmp_66_reg_931 == 1'd1)) | ((1'b1 == ap_CS_fsm_state8) & (or_cond_79_reg_935 == 1'd1)))) begin
        s_we0 = 1'b1;
    end else begin
        s_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state7) | ((1'b1 == ap_CS_fsm_state12) & (tmp_66_reg_931 == 1'd1)) | ((1'b1 == ap_CS_fsm_state8) & (or_cond_79_reg_935 == 1'd1)))) begin
        s_we1 = 1'b1;
    end else begin
        s_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((exitcond2_fu_279_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((exitcond2_fu_279_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (or_cond_79_fu_640_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            if (((1'b1 == ap_CS_fsm_state8) & (tmp_66_reg_931 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign a_assign_1_fu_357_p3 = {{smax_reg_231}, {16'd0}};

assign a_assign_2_fu_407_p2 = (a_lobit_i_cast_fu_379_p3 ^ a_assign_1_fu_357_p3);

assign a_lobit_i_cast_fu_379_p3 = ((tmp_74_fu_371_p3[0:0] === 1'b1) ? 32'd4294967295 : 32'd0);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd7];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitoff_address0 = tmp_9_i_cast_cast_fu_451_p3;

assign bitoff_address1 = tmp_15_i_cast_fu_470_p1;

assign bitoff_address2 = tmp_19_i_cast_fu_485_p1;

assign exitcond2_fu_279_p2 = ((k_reg_243 == 3'd4) ? 1'b1 : 1'b0);

assign grp_fu_805_p0 = tmp_23_i_cast_fu_699_p1;

assign grp_fu_805_p2 = 31'd16384;

assign grp_fu_814_p0 = tmp_23_i_cast_fu_699_p1;

assign grp_fu_814_p2 = 31'd16384;

assign grp_fu_823_p0 = tmp_23_i_cast_fu_699_p1;

assign grp_fu_823_p2 = 31'd16384;

assign grp_fu_832_p0 = tmp_23_i_cast_fu_699_p1;

assign grp_fu_832_p2 = 31'd16384;

assign icmp8_fu_445_p2 = ((tmp_77_fu_435_p4 == 8'd0) ? 1'b1 : 1'b0);

assign icmp9_fu_500_p2 = ((tmp_78_fu_490_p4 == 24'd0) ? 1'b1 : 1'b0);

assign icmp_fu_429_p2 = ((tmp_76_fu_419_p4 == 16'd0) ? 1'b1 : 1'b0);

assign k_1_fu_285_p2 = (k_reg_243 + 3'd1);

assign n_cast_fu_624_p1 = ap_phi_mux_n_phi_fu_258_p4;

assign newSel1_fu_590_p3 = ((sel_tmp7_i_fu_546_p2[0:0] === 1'b1) ? tmp_17_i_cast_fu_516_p1 : tmp_21_i_cast_fu_526_p1);

assign newSel22_cast_fu_598_p1 = $signed(newSel1_fu_590_p3);

assign newSel2_fu_602_p3 = ((or_cond_fu_584_p2[0:0] === 1'b1) ? newSel_cast_fu_580_p1 : newSel22_cast_fu_598_p1);

assign newSel_cast_fu_580_p1 = newSel_fu_574_p2;

assign newSel_fu_574_p2 = (tmp_i1_cast_fu_506_p1 + newSel_v_fu_566_p3);

assign newSel_v_fu_566_p3 = ((sel_tmp20_i_fu_561_p2[0:0] === 1'b1) ? 5'd23 : 5'd15);

assign or_cond_79_fu_640_p2 = (tmp_67_fu_634_p2 & tmp_66_fu_628_p2);

assign or_cond_fu_584_p2 = (sel_tmp20_i_fu_561_p2 | sel_tmp14_i_fu_556_p2);

assign p_i_cast26_cast_fu_413_p2 = (tmp_65_fu_399_p3 ^ tmp_64_fu_391_p3);

assign s_offset_cast1_fu_275_p1 = s_offset;

assign scalauto_fu_616_p3 = ((tmp_1_i_reg_881[0:0] === 1'b1) ? 6'd4 : sel_tmp21_i_op_fu_610_p2);

assign sel_tmp14_i_fu_556_p2 = (tmp21_fu_551_p2 & icmp_reg_892);

assign sel_tmp20_i_fu_561_p2 = (sel_tmp6_i_fu_535_p2 & icmp9_reg_918);

assign sel_tmp21_i_op_fu_610_p2 = (6'd4 - newSel2_fu_602_p3);

assign sel_tmp2_i_fu_530_p2 = (icmp_reg_892 ^ 1'd1);

assign sel_tmp6_i_fu_535_p2 = (tmp_1_i_reg_881 ^ 1'd1);

assign sel_tmp7_i_fu_546_p2 = (tmp20_fu_540_p2 & icmp8_reg_898);

assign smax_2_fu_329_p3 = ((tmp_68_fu_301_p3[0:0] === 1'b1) ? tmp_36_i_fu_321_p3 : s_q0);

assign sum2_1_cast_fu_655_p1 = sum2_1_fu_650_p2;

assign sum2_1_fu_650_p2 = (3'd1 + s_offset);

assign sum2_2_cast_fu_665_p1 = sum2_2_fu_660_p2;

assign sum2_2_fu_660_p2 = (3'd2 + s_offset);

assign sum2_3_cast_fu_675_p1 = sum2_3_fu_670_p2;

assign sum2_3_fu_670_p2 = (3'd3 + s_offset);

assign sum4_1_cast_fu_758_p1 = sum4_1_fu_753_p2;

assign sum4_1_fu_753_p2 = (s_offset + 3'd1);

assign sum4_2_cast_fu_768_p1 = sum4_2_fu_763_p2;

assign sum4_2_fu_763_p2 = (s_offset + 3'd2);

assign sum4_3_cast_fu_778_p1 = sum4_3_fu_773_p2;

assign sum4_3_fu_773_p2 = (s_offset + 3'd3);

assign sum_cast_fu_296_p1 = sum_fu_291_p2;

assign sum_fu_291_p2 = (k_reg_243 + s_offset);

assign temp_0_smax_fu_343_p3 = ((tmp_s_fu_337_p2[0:0] === 1'b1) ? smax_2_fu_329_p3 : smax_reg_231);

assign tmp20_fu_540_p2 = (sel_tmp6_i_fu_535_p2 & sel_tmp2_i_fu_530_p2);

assign tmp21_fu_551_p2 = (tmp_74_reg_887 & sel_tmp6_i_fu_535_p2);

assign tmp_128_1_fu_789_p0 = reg_270;

assign tmp_128_1_fu_789_p2 = tmp_128_1_fu_789_p0 << n_cast_reg_923;

assign tmp_128_2_fu_795_p2 = s_q1 << n_cast_reg_923;

assign tmp_128_3_fu_800_p2 = s_q0 << n_cast_reg_923;

assign tmp_14_i_cast_fu_460_p4 = {{p_i_cast26_cast_fu_413_p2[23:16]}};

assign tmp_15_i_cast_fu_470_p1 = tmp_14_i_cast_fu_460_p4;

assign tmp_17_i_cast_fu_516_p1 = tmp_17_i_fu_510_p2;

assign tmp_17_i_fu_510_p2 = (4'd7 + bitoff_q1);

assign tmp_18_i_cast_fu_475_p4 = {{a_assign_2_fu_407_p2[31:24]}};

assign tmp_19_i_cast_fu_485_p1 = tmp_18_i_cast_fu_475_p4;

assign tmp_1_i_fu_365_p2 = (($signed(a_assign_1_fu_357_p3) < $signed(32'd3221225473)) ? 1'b1 : 1'b0);

assign tmp_21_i_cast_fu_526_p1 = $signed(tmp_21_i_fu_520_p2);

assign tmp_21_i_fu_520_p2 = ($signed(4'd15) + $signed(bitoff_q2));

assign tmp_23_i_cast_fu_699_p1 = tmp_70_fu_689_p2;

assign tmp_35_i_fu_315_p2 = (16'd0 - s_q0);

assign tmp_36_i_fu_321_p3 = ((tmp_i_fu_309_p2[0:0] === 1'b1) ? 16'd32767 : tmp_35_i_fu_315_p2);

assign tmp_64_fu_391_p3 = {{tmp_75_fu_387_p1}, {16'd0}};

assign tmp_65_fu_399_p3 = ((tmp_74_fu_371_p3[0:0] === 1'b1) ? 24'd16777215 : 24'd0);

assign tmp_66_fu_628_p2 = (($signed(ap_phi_mux_n_phi_fu_258_p4) > $signed(6'd0)) ? 1'b1 : 1'b0);

assign tmp_67_fu_634_p2 = (($signed(ap_phi_mux_n_phi_fu_258_p4) < $signed(6'd5)) ? 1'b1 : 1'b0);

assign tmp_68_fu_301_p3 = s_q0[32'd15];

assign tmp_69_fu_680_p2 = ($signed(3'd7) + $signed(tmp_79_reg_939));

assign tmp_70_fu_689_p2 = 15'd16384 >> tmp_97_cast_fu_685_p1;

assign tmp_71_fu_783_p0 = reg_265;

assign tmp_71_fu_783_p2 = tmp_71_fu_783_p0 << n_cast_reg_923;

assign tmp_74_fu_371_p3 = smax_reg_231[32'd15];

assign tmp_75_fu_387_p1 = smax_reg_231[7:0];

assign tmp_76_fu_419_p4 = {{a_assign_2_fu_407_p2[31:16]}};

assign tmp_77_fu_435_p4 = {{a_assign_2_fu_407_p2[31:24]}};

assign tmp_78_fu_490_p4 = {{a_assign_2_fu_407_p2[31:8]}};

assign tmp_79_fu_646_p1 = ap_phi_mux_n_phi_fu_258_p4[2:0];

assign tmp_97_cast_fu_685_p1 = tmp_69_fu_680_p2;

assign tmp_9_i_cast_cast_fu_451_p3 = ((tmp_74_fu_371_p3[0:0] === 1'b1) ? 64'd255 : 64'd0);

assign tmp_fu_351_p2 = ((smax_reg_231 == 16'd0) ? 1'b1 : 1'b0);

assign tmp_i1_cast_fu_506_p1 = bitoff_q0;

assign tmp_i_fu_309_p2 = ((s_q0 == 16'd32768) ? 1'b1 : 1'b0);

assign tmp_s_fu_337_p2 = (($signed(smax_2_fu_329_p3) > $signed(smax_reg_231)) ? 1'b1 : 1'b0);

always @ (posedge ap_clk) begin
    s_offset_cast1_reg_852[63:3] <= 61'b0000000000000000000000000000000000000000000000000000000000000;
end

endmodule //Autocorrelation
