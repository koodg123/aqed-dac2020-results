// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module aes256_encrypt_ecb (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        k_address0,
        k_ce0,
        k_q0,
        p_read,
        p_read1,
        ap_return_0,
        ap_return_1
);

parameter    ap_ST_fsm_state1 = 9'd1;
parameter    ap_ST_fsm_pp0_stage0 = 9'd2;
parameter    ap_ST_fsm_state4 = 9'd4;
parameter    ap_ST_fsm_pp1_stage0 = 9'd8;
parameter    ap_ST_fsm_state7 = 9'd16;
parameter    ap_ST_fsm_pp2_stage0 = 9'd32;
parameter    ap_ST_fsm_state10 = 9'd64;
parameter    ap_ST_fsm_pp3_stage0 = 9'd128;
parameter    ap_ST_fsm_state13 = 9'd256;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [4:0] k_address0;
output   k_ce0;
input  [7:0] k_q0;
input  [7:0] p_read;
input  [7:0] p_read1;
output  [7:0] ap_return_0;
output  [7:0] ap_return_1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg k_ce0;

(* fsm_encoding = "none" *) reg   [8:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [7:0] sbox_address0;
reg    sbox_ce0;
wire   [7:0] sbox_q0;
reg   [5:0] i_reg_169;
reg   [7:0] buf_reg_180;
reg   [7:0] buf1_reg_190;
reg   [1:0] i_i_reg_200;
reg   [7:0] buf_2_reg_211;
reg   [7:0] buf13_2_reg_222;
reg   [1:0] i_i1_reg_233;
reg   [7:0] buf_4_reg_244;
reg   [7:0] buf13_4_reg_255;
reg   [1:0] i_i7_reg_266;
wire   [0:0] tmp_fu_277_p2;
reg   [0:0] tmp_reg_478;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [5:0] i_1_fu_283_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [63:0] tmp_s_fu_289_p1;
reg   [63:0] tmp_s_reg_487;
wire   [0:0] tmp_i_fu_294_p2;
reg   [0:0] tmp_i_reg_497;
wire    ap_CS_fsm_pp1_stage0;
wire    ap_block_state5_pp1_stage0_iter0;
wire    ap_block_state6_pp1_stage0_iter1;
wire    ap_block_pp1_stage0_11001;
wire   [0:0] tmp_16_fu_300_p1;
reg   [0:0] tmp_16_reg_501;
wire  signed [1:0] i_2_fu_304_p2;
reg  signed [1:0] i_2_reg_508;
reg    ap_enable_reg_pp1_iter0;
wire   [63:0] tmp_i_16_fu_314_p1;
reg   [63:0] tmp_i_16_reg_513;
wire   [63:0] tmp_46_i_fu_329_p1;
reg   [63:0] tmp_46_i_reg_523;
wire   [7:0] buf_1_fu_347_p3;
reg    ap_enable_reg_pp1_iter1;
wire   [7:0] buf13_1_fu_354_p3;
wire   [0:0] tmp_i2_fu_361_p2;
reg   [0:0] tmp_i2_reg_543;
wire    ap_CS_fsm_pp2_stage0;
wire    ap_block_state8_pp2_stage0_iter0;
wire    ap_block_state9_pp2_stage0_iter1;
wire    ap_block_pp2_stage0_11001;
wire   [0:0] tmp_17_fu_367_p1;
reg   [0:0] tmp_17_reg_547;
wire   [1:0] i_3_fu_371_p2;
reg    ap_enable_reg_pp2_iter0;
wire   [7:0] buf_3_fu_390_p3;
reg    ap_enable_reg_pp2_iter1;
wire   [7:0] buf13_3_fu_397_p3;
wire   [0:0] tmp_i8_fu_404_p2;
reg   [0:0] tmp_i8_reg_573;
wire    ap_CS_fsm_pp3_stage0;
wire    ap_block_state11_pp3_stage0_iter0;
wire    ap_block_state12_pp3_stage0_iter1;
wire    ap_block_pp3_stage0_11001;
wire   [0:0] tmp_18_fu_410_p1;
reg   [0:0] tmp_18_reg_577;
wire  signed [1:0] i_4_fu_414_p2;
reg  signed [1:0] i_4_reg_584;
reg    ap_enable_reg_pp3_iter0;
wire   [7:0] buf_5_fu_442_p3;
reg    ap_enable_reg_pp3_iter1;
wire   [7:0] buf13_5_fu_449_p3;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
wire    ap_CS_fsm_state4;
wire    ap_block_pp1_stage0_subdone;
reg    ap_condition_pp1_exit_iter0_state5;
wire    ap_CS_fsm_state7;
wire    ap_block_pp2_stage0_subdone;
reg    ap_condition_pp2_exit_iter0_state8;
wire    ap_CS_fsm_state10;
wire    ap_block_pp3_stage0_subdone;
reg    ap_condition_pp3_exit_iter0_state11;
reg   [4:0] ctx_body_key_address0;
reg    ctx_body_key_ce0;
reg    ctx_body_key_we0;
wire   [7:0] ctx_body_key_q0;
wire   [4:0] ctx_body_key_address1;
reg    ctx_body_key_ce1;
reg    ctx_body_key_we1;
reg   [4:0] ctx_body_enckey_address0;
reg    ctx_body_enckey_ce0;
reg    ctx_body_enckey_we0;
wire   [7:0] ctx_body_enckey_q0;
wire   [4:0] ctx_body_enckey_address1;
reg    ctx_body_enckey_ce1;
wire   [7:0] ctx_body_enckey_q1;
wire    ap_block_pp1_stage0;
reg   [1:0] ap_phi_mux_i_i_phi_fu_204_p4;
reg   [7:0] ap_phi_mux_buf_2_phi_fu_214_p4;
wire    ap_block_pp2_stage0;
reg   [7:0] ap_phi_mux_buf13_2_phi_fu_225_p4;
wire    ap_block_pp3_stage0;
reg   [1:0] ap_phi_mux_i_i7_phi_fu_270_p4;
wire    ap_block_pp0_stage0;
wire   [63:0] tmp_42_i_fu_385_p1;
wire   [63:0] tmp_i9_fu_424_p1;
wire  signed [7:0] i_2_cast_fu_310_p1;
wire  signed [4:0] tmp_44_i_cast_fu_319_p1;
wire   [4:0] tmp_45_i_fu_323_p2;
wire   [7:0] buf_load_i_phi_fu_334_p3;
wire   [7:0] tmp_43_i_fu_341_p2;
wire   [7:0] buf_load_i5_phi_fu_377_p3;
wire  signed [7:0] i_4_cast_fu_420_p1;
wire   [7:0] buf_load_i13_phi_fu_429_p3;
wire   [7:0] tmp_47_i_fu_436_p2;
wire    ap_CS_fsm_state13;
reg   [8:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_idle_pp1;
wire    ap_enable_pp1;
reg    ap_idle_pp2;
wire    ap_enable_pp2;
reg    ap_idle_pp3;
wire    ap_enable_pp3;

// power-on initialization
initial begin
#0 ap_CS_fsm = 9'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp1_iter0 = 1'b0;
#0 ap_enable_reg_pp1_iter1 = 1'b0;
#0 ap_enable_reg_pp2_iter0 = 1'b0;
#0 ap_enable_reg_pp2_iter1 = 1'b0;
#0 ap_enable_reg_pp3_iter0 = 1'b0;
#0 ap_enable_reg_pp3_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

aes256_encrypt_ecb_sbox #(
    .DataWidth( 8 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
sbox_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(sbox_address0),
    .ce0(sbox_ce0),
    .q0(sbox_q0)
);

aes256_encrypt_ecb_ctx_body_key #(
    .DataWidth( 8 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
ctx_body_key_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(ctx_body_key_address0),
    .ce0(ctx_body_key_ce0),
    .we0(ctx_body_key_we0),
    .d0(ctx_body_enckey_q0),
    .q0(ctx_body_key_q0),
    .address1(ctx_body_key_address1),
    .ce1(ctx_body_key_ce1),
    .we1(ctx_body_key_we1),
    .d1(ctx_body_enckey_q1)
);

aes256_encrypt_ecb_ctx_body_enckey #(
    .DataWidth( 8 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
ctx_body_enckey_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(ctx_body_enckey_address0),
    .ce0(ctx_body_enckey_ce0),
    .we0(ctx_body_enckey_we0),
    .d0(k_q0),
    .q0(ctx_body_enckey_q0),
    .address1(ctx_body_enckey_address1),
    .ce1(ctx_body_enckey_ce1),
    .q1(ctx_body_enckey_q1)
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_condition_pp1_exit_iter0_state5) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
            ap_enable_reg_pp1_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_enable_reg_pp1_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_condition_pp1_exit_iter0_state5))) begin
            ap_enable_reg_pp1_iter1 <= (1'b1 ^ ap_condition_pp1_exit_iter0_state5);
        end else if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter1 <= ap_enable_reg_pp1_iter0;
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_enable_reg_pp1_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp2_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp2_stage0_subdone) & (1'b1 == ap_condition_pp2_exit_iter0_state8) & (1'b1 == ap_CS_fsm_pp2_stage0))) begin
            ap_enable_reg_pp2_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state7)) begin
            ap_enable_reg_pp2_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp2_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp2_stage0_subdone) & (1'b1 == ap_condition_pp2_exit_iter0_state8))) begin
            ap_enable_reg_pp2_iter1 <= (1'b1 ^ ap_condition_pp2_exit_iter0_state8);
        end else if ((1'b0 == ap_block_pp2_stage0_subdone)) begin
            ap_enable_reg_pp2_iter1 <= ap_enable_reg_pp2_iter0;
        end else if ((1'b1 == ap_CS_fsm_state7)) begin
            ap_enable_reg_pp2_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp3_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp3_stage0_subdone) & (1'b1 == ap_condition_pp3_exit_iter0_state11) & (1'b1 == ap_CS_fsm_pp3_stage0))) begin
            ap_enable_reg_pp3_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state10)) begin
            ap_enable_reg_pp3_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp3_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp3_stage0_subdone) & (1'b1 == ap_condition_pp3_exit_iter0_state11))) begin
            ap_enable_reg_pp3_iter1 <= (1'b1 ^ ap_condition_pp3_exit_iter0_state11);
        end else if ((1'b0 == ap_block_pp3_stage0_subdone)) begin
            ap_enable_reg_pp3_iter1 <= ap_enable_reg_pp3_iter0;
        end else if ((1'b1 == ap_CS_fsm_state10)) begin
            ap_enable_reg_pp3_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        buf13_2_reg_222 <= buf1_reg_190;
    end else if (((tmp_i2_reg_543 == 1'd0) & (ap_enable_reg_pp2_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp2_stage0) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        buf13_2_reg_222 <= buf13_3_fu_397_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        buf13_4_reg_255 <= buf13_2_reg_222;
    end else if (((tmp_i8_reg_573 == 1'd0) & (ap_enable_reg_pp3_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp3_stage0) & (1'b0 == ap_block_pp3_stage0_11001))) begin
        buf13_4_reg_255 <= buf13_5_fu_449_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        buf1_reg_190 <= p_read1;
    end else if (((tmp_i_reg_497 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        buf1_reg_190 <= buf13_1_fu_354_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        buf_2_reg_211 <= buf_reg_180;
    end else if (((tmp_i2_reg_543 == 1'd0) & (ap_enable_reg_pp2_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp2_stage0) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        buf_2_reg_211 <= buf_3_fu_390_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        buf_4_reg_244 <= buf_2_reg_211;
    end else if (((tmp_i8_reg_573 == 1'd0) & (ap_enable_reg_pp3_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp3_stage0) & (1'b0 == ap_block_pp3_stage0_11001))) begin
        buf_4_reg_244 <= buf_5_fu_442_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        buf_reg_180 <= p_read;
    end else if (((tmp_i_reg_497 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        buf_reg_180 <= buf_1_fu_347_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        i_i1_reg_233 <= 2'd2;
    end else if (((tmp_i2_fu_361_p2 == 1'd0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp2_stage0) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        i_i1_reg_233 <= i_3_fu_371_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        i_i7_reg_266 <= 2'd2;
    end else if (((tmp_i8_reg_573 == 1'd0) & (ap_enable_reg_pp3_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp3_stage0) & (1'b0 == ap_block_pp3_stage0_11001))) begin
        i_i7_reg_266 <= i_4_reg_584;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        i_i_reg_200 <= 2'd2;
    end else if (((tmp_i_reg_497 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        i_i_reg_200 <= i_2_reg_508;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_fu_277_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_reg_169 <= i_1_fu_283_p2;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_169 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_fu_294_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        i_2_reg_508 <= i_2_fu_304_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i8_fu_404_p2 == 1'd0) & (ap_enable_reg_pp3_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp3_stage0) & (1'b0 == ap_block_pp3_stage0_11001))) begin
        i_4_reg_584 <= i_4_fu_414_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_fu_294_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        tmp_16_reg_501 <= tmp_16_fu_300_p1;
        tmp_46_i_reg_523[4 : 0] <= tmp_46_i_fu_329_p1[4 : 0];
        tmp_i_16_reg_513[7 : 0] <= tmp_i_16_fu_314_p1[7 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i2_fu_361_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp2_stage0) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        tmp_17_reg_547 <= tmp_17_fu_367_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i8_fu_404_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp3_stage0) & (1'b0 == ap_block_pp3_stage0_11001))) begin
        tmp_18_reg_577 <= tmp_18_fu_410_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp2_stage0) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        tmp_i2_reg_543 <= tmp_i2_fu_361_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp3_stage0) & (1'b0 == ap_block_pp3_stage0_11001))) begin
        tmp_i8_reg_573 <= tmp_i8_fu_404_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        tmp_i_reg_497 <= tmp_i_fu_294_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_reg_478 <= tmp_fu_277_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_fu_277_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_s_reg_487[5 : 0] <= tmp_s_fu_289_p1[5 : 0];
    end
end

always @ (*) begin
    if ((tmp_fu_277_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((tmp_i_fu_294_p2 == 1'd1)) begin
        ap_condition_pp1_exit_iter0_state5 = 1'b1;
    end else begin
        ap_condition_pp1_exit_iter0_state5 = 1'b0;
    end
end

always @ (*) begin
    if ((tmp_i2_fu_361_p2 == 1'd1)) begin
        ap_condition_pp2_exit_iter0_state8 = 1'b1;
    end else begin
        ap_condition_pp2_exit_iter0_state8 = 1'b0;
    end
end

always @ (*) begin
    if ((tmp_i8_fu_404_p2 == 1'd1)) begin
        ap_condition_pp3_exit_iter0_state11 = 1'b1;
    end else begin
        ap_condition_pp3_exit_iter0_state11 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state13) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if (((ap_enable_reg_pp1_iter1 == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b0))) begin
        ap_idle_pp1 = 1'b1;
    end else begin
        ap_idle_pp1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp2_iter1 == 1'b0) & (ap_enable_reg_pp2_iter0 == 1'b0))) begin
        ap_idle_pp2 = 1'b1;
    end else begin
        ap_idle_pp2 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp3_iter1 == 1'b0) & (ap_enable_reg_pp3_iter0 == 1'b0))) begin
        ap_idle_pp3 = 1'b1;
    end else begin
        ap_idle_pp3 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_i2_reg_543 == 1'd0) & (1'b0 == ap_block_pp2_stage0) & (ap_enable_reg_pp2_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp2_stage0))) begin
        ap_phi_mux_buf13_2_phi_fu_225_p4 = buf13_3_fu_397_p3;
    end else begin
        ap_phi_mux_buf13_2_phi_fu_225_p4 = buf13_2_reg_222;
    end
end

always @ (*) begin
    if (((tmp_i2_reg_543 == 1'd0) & (1'b0 == ap_block_pp2_stage0) & (ap_enable_reg_pp2_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp2_stage0))) begin
        ap_phi_mux_buf_2_phi_fu_214_p4 = buf_3_fu_390_p3;
    end else begin
        ap_phi_mux_buf_2_phi_fu_214_p4 = buf_2_reg_211;
    end
end

always @ (*) begin
    if (((tmp_i8_reg_573 == 1'd0) & (1'b0 == ap_block_pp3_stage0) & (ap_enable_reg_pp3_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp3_stage0))) begin
        ap_phi_mux_i_i7_phi_fu_270_p4 = i_4_reg_584;
    end else begin
        ap_phi_mux_i_i7_phi_fu_270_p4 = i_i7_reg_266;
    end
end

always @ (*) begin
    if (((tmp_i_reg_497 == 1'd0) & (1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        ap_phi_mux_i_i_phi_fu_204_p4 = i_2_reg_508;
    end else begin
        ap_phi_mux_i_i_phi_fu_204_p4 = i_i_reg_200;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        ctx_body_enckey_address0 = tmp_i_16_fu_314_p1;
    end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ctx_body_enckey_address0 = tmp_s_reg_487;
    end else begin
        ctx_body_enckey_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001)))) begin
        ctx_body_enckey_ce0 = 1'b1;
    end else begin
        ctx_body_enckey_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        ctx_body_enckey_ce1 = 1'b1;
    end else begin
        ctx_body_enckey_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_reg_478 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ctx_body_enckey_we0 = 1'b1;
    end else begin
        ctx_body_enckey_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp3_stage0) & (ap_enable_reg_pp3_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp3_stage0))) begin
        ctx_body_key_address0 = tmp_i9_fu_424_p1;
    end else if (((1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        ctx_body_key_address0 = tmp_i_16_reg_513;
    end else begin
        ctx_body_key_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp3_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp3_stage0) & (1'b0 == ap_block_pp3_stage0_11001)) | ((ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001)))) begin
        ctx_body_key_ce0 = 1'b1;
    end else begin
        ctx_body_key_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        ctx_body_key_ce1 = 1'b1;
    end else begin
        ctx_body_key_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_i_reg_497 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        ctx_body_key_we0 = 1'b1;
    end else begin
        ctx_body_key_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_i_reg_497 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        ctx_body_key_we1 = 1'b1;
    end else begin
        ctx_body_key_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        k_ce0 = 1'b1;
    end else begin
        k_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp2_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp2_stage0) & (1'b0 == ap_block_pp2_stage0_11001))) begin
        sbox_ce0 = 1'b1;
    end else begin
        sbox_ce0 = 1'b0;
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
            if (~((tmp_fu_277_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((tmp_fu_277_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_pp1_stage0;
        end
        ap_ST_fsm_pp1_stage0 : begin
            if (~((1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter0 == 1'b1) & (tmp_i_fu_294_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else if (((1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter0 == 1'b1) & (tmp_i_fu_294_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_pp2_stage0;
        end
        ap_ST_fsm_pp2_stage0 : begin
            if (~((1'b0 == ap_block_pp2_stage0_subdone) & (ap_enable_reg_pp2_iter0 == 1'b1) & (tmp_i2_fu_361_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_pp2_stage0;
            end else if (((1'b0 == ap_block_pp2_stage0_subdone) & (ap_enable_reg_pp2_iter0 == 1'b1) & (tmp_i2_fu_361_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp2_stage0;
            end
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_pp3_stage0;
        end
        ap_ST_fsm_pp3_stage0 : begin
            if (~((1'b0 == ap_block_pp3_stage0_subdone) & (ap_enable_reg_pp3_iter0 == 1'b1) & (tmp_i8_fu_404_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_pp3_stage0;
            end else if (((1'b0 == ap_block_pp3_stage0_subdone) & (ap_enable_reg_pp3_iter0 == 1'b1) & (tmp_i8_fu_404_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state13;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp3_stage0;
            end
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp1_stage0 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_pp2_stage0 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_pp3_stage0 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp2_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp2_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp2_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp3_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp3_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp3_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state11_pp3_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp3_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp1_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp1_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp2_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp2_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_pp1 = (ap_idle_pp1 ^ 1'b1);

assign ap_enable_pp2 = (ap_idle_pp2 ^ 1'b1);

assign ap_enable_pp3 = (ap_idle_pp3 ^ 1'b1);

assign ap_return_0 = buf_4_reg_244;

assign ap_return_1 = buf13_4_reg_255;

assign buf13_1_fu_354_p3 = ((tmp_16_reg_501[0:0] === 1'b1) ? buf1_reg_190 : tmp_43_i_fu_341_p2);

assign buf13_3_fu_397_p3 = ((tmp_17_reg_547[0:0] === 1'b1) ? buf13_2_reg_222 : sbox_q0);

assign buf13_5_fu_449_p3 = ((tmp_18_reg_577[0:0] === 1'b1) ? buf13_4_reg_255 : tmp_47_i_fu_436_p2);

assign buf_1_fu_347_p3 = ((tmp_16_reg_501[0:0] === 1'b1) ? tmp_43_i_fu_341_p2 : buf_reg_180);

assign buf_3_fu_390_p3 = ((tmp_17_reg_547[0:0] === 1'b1) ? sbox_q0 : buf_2_reg_211);

assign buf_5_fu_442_p3 = ((tmp_18_reg_577[0:0] === 1'b1) ? tmp_47_i_fu_436_p2 : buf_4_reg_244);

assign buf_load_i13_phi_fu_429_p3 = ((tmp_18_reg_577[0:0] === 1'b1) ? buf_4_reg_244 : buf13_4_reg_255);

assign buf_load_i5_phi_fu_377_p3 = ((tmp_17_fu_367_p1[0:0] === 1'b1) ? ap_phi_mux_buf_2_phi_fu_214_p4 : ap_phi_mux_buf13_2_phi_fu_225_p4);

assign buf_load_i_phi_fu_334_p3 = ((tmp_16_reg_501[0:0] === 1'b1) ? buf_reg_180 : buf1_reg_190);

assign ctx_body_enckey_address1 = tmp_46_i_fu_329_p1;

assign ctx_body_key_address1 = tmp_46_i_reg_523;

assign i_1_fu_283_p2 = (i_reg_169 + 6'd1);

assign i_2_cast_fu_310_p1 = i_2_fu_304_p2;

assign i_2_fu_304_p2 = ($signed(2'd3) + $signed(ap_phi_mux_i_i_phi_fu_204_p4));

assign i_3_fu_371_p2 = ($signed(2'd3) + $signed(i_i1_reg_233));

assign i_4_cast_fu_420_p1 = i_4_fu_414_p2;

assign i_4_fu_414_p2 = ($signed(2'd3) + $signed(ap_phi_mux_i_i7_phi_fu_270_p4));

assign k_address0 = tmp_s_fu_289_p1;

assign sbox_address0 = tmp_42_i_fu_385_p1;

assign tmp_16_fu_300_p1 = ap_phi_mux_i_i_phi_fu_204_p4[0:0];

assign tmp_17_fu_367_p1 = i_i1_reg_233[0:0];

assign tmp_18_fu_410_p1 = ap_phi_mux_i_i7_phi_fu_270_p4[0:0];

assign tmp_42_i_fu_385_p1 = buf_load_i5_phi_fu_377_p3;

assign tmp_43_i_fu_341_p2 = (ctx_body_enckey_q0 ^ buf_load_i_phi_fu_334_p3);

assign tmp_44_i_cast_fu_319_p1 = i_2_fu_304_p2;

assign tmp_45_i_fu_323_p2 = (tmp_44_i_cast_fu_319_p1 ^ 5'd16);

assign tmp_46_i_fu_329_p1 = tmp_45_i_fu_323_p2;

assign tmp_47_i_fu_436_p2 = (ctx_body_key_q0 ^ buf_load_i13_phi_fu_429_p3);

assign tmp_fu_277_p2 = ((i_reg_169 == 6'd32) ? 1'b1 : 1'b0);

assign tmp_i2_fu_361_p2 = ((i_i1_reg_233 == 2'd0) ? 1'b1 : 1'b0);

assign tmp_i8_fu_404_p2 = ((ap_phi_mux_i_i7_phi_fu_270_p4 == 2'd0) ? 1'b1 : 1'b0);

assign tmp_i9_fu_424_p1 = $unsigned(i_4_cast_fu_420_p1);

assign tmp_i_16_fu_314_p1 = $unsigned(i_2_cast_fu_310_p1);

assign tmp_i_fu_294_p2 = ((ap_phi_mux_i_i_phi_fu_204_p4 == 2'd0) ? 1'b1 : 1'b0);

assign tmp_s_fu_289_p1 = i_reg_169;

always @ (posedge ap_clk) begin
    tmp_s_reg_487[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
    tmp_i_16_reg_513[63:8] <= 56'b00000000000000000000000000000000000000000000000000000000;
    tmp_46_i_reg_523[63:5] <= 59'b00000000000000000000000000000000000000000000000000000000000;
end

endmodule //aes256_encrypt_ecb
