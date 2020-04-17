// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gather (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        to_V_din,
        to_V_full_n,
        to_V_write,
        from0_V_dout,
        from0_V_empty_n,
        from0_V_read,
        from1_V_dout,
        from1_V_empty_n,
        from1_V_read,
        data_count_dout,
        data_count_empty_n,
        data_count_read,
        data_count_out_din,
        data_count_out_full_n,
        data_count_out_write
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state7 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
output  [63:0] to_V_din;
input   to_V_full_n;
output   to_V_write;
input  [63:0] from0_V_dout;
input   from0_V_empty_n;
output   from0_V_read;
input  [63:0] from1_V_dout;
input   from1_V_empty_n;
output   from1_V_read;
input  [15:0] data_count_dout;
input   data_count_empty_n;
output   data_count_read;
output  [15:0] data_count_out_din;
input   data_count_out_full_n;
output   data_count_out_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg to_V_write;
reg from0_V_read;
reg from1_V_read;
reg data_count_read;
reg data_count_out_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    to_V_blk_n;
reg    ap_enable_reg_pp0_iter4;
wire    ap_block_pp0_stage0;
reg   [0:0] exitcond_i_reg_178;
reg   [0:0] exitcond_i_reg_178_pp0_iter3_reg;
reg    from0_V_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
reg    from1_V_blk_n;
reg    data_count_blk_n;
reg    data_count_out_blk_n;
reg   [15:0] i_i_reg_147;
reg   [15:0] data_count_read_reg_173;
reg    ap_block_state1;
wire   [0:0] exitcond_i_fu_158_p2;
wire    ap_block_state2_pp0_stage0_iter0;
reg    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
reg    ap_block_state6_pp0_stage0_iter4;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] exitcond_i_reg_178_pp0_iter1_reg;
reg   [0:0] exitcond_i_reg_178_pp0_iter2_reg;
wire   [15:0] i_fu_163_p2;
reg    ap_enable_reg_pp0_iter0;
reg   [63:0] tmp_reg_187;
reg   [63:0] tmp_1_reg_192;
wire   [63:0] grp_fu_169_p2;
reg   [63:0] tmp_2_reg_197;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_block_pp0_stage0_01001;
reg    grp_fu_169_ce;
wire    ap_CS_fsm_state7;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
end

aqed_top_sub_64nscud #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
aqed_top_sub_64nscud_U19(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_reg_187),
    .din1(tmp_1_reg_192),
    .ce(grp_fu_169_ce),
    .dout(grp_fu_169_p2)
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
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state7)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((real_start == 1'b0) | (data_count_out_full_n == 1'b0) | (data_count_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end else if ((~((real_start == 1'b0) | (data_count_out_full_n == 1'b0) | (data_count_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((internal_ap_ready == 1'b0) & (real_start == 1'b1))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_i_fu_158_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_i_reg_147 <= i_fu_163_p2;
    end else if ((~((real_start == 1'b0) | (data_count_out_full_n == 1'b0) | (data_count_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_i_reg_147 <= 16'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((real_start == 1'b0) | (data_count_out_full_n == 1'b0) | (data_count_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        data_count_read_reg_173 <= data_count_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        exitcond_i_reg_178 <= exitcond_i_fu_158_p2;
        exitcond_i_reg_178_pp0_iter1_reg <= exitcond_i_reg_178;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        exitcond_i_reg_178_pp0_iter2_reg <= exitcond_i_reg_178_pp0_iter1_reg;
        exitcond_i_reg_178_pp0_iter3_reg <= exitcond_i_reg_178_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_i_reg_178 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_1_reg_192 <= from1_V_dout;
        tmp_reg_187 <= from0_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_i_reg_178_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_2_reg_197 <= grp_fu_169_p2;
    end
end

always @ (*) begin
    if ((exitcond_i_fu_158_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((real_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        data_count_blk_n = data_count_empty_n;
    end else begin
        data_count_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        data_count_out_blk_n = data_count_out_full_n;
    end else begin
        data_count_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (data_count_out_full_n == 1'b0) | (data_count_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        data_count_out_write = 1'b1;
    end else begin
        data_count_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((real_start == 1'b0) | (data_count_out_full_n == 1'b0) | (data_count_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        data_count_read = 1'b1;
    end else begin
        data_count_read = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_i_reg_178 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        from0_V_blk_n = from0_V_empty_n;
    end else begin
        from0_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_i_reg_178 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        from0_V_read = 1'b1;
    end else begin
        from0_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_i_reg_178 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        from1_V_blk_n = from1_V_empty_n;
    end else begin
        from1_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_i_reg_178 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        from1_V_read = 1'b1;
    end else begin
        from1_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_169_ce = 1'b1;
    end else begin
        grp_fu_169_ce = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (start_full_n == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (real_start == 1'b1))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_i_reg_178_pp0_iter3_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        to_V_blk_n = to_V_full_n;
    end else begin
        to_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_i_reg_178_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        to_V_write = 1'b1;
    end else begin
        to_V_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((real_start == 1'b0) | (data_count_out_full_n == 1'b0) | (data_count_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_i_fu_158_p2 == 1'd1)) & ~((ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_i_fu_158_p2 == 1'd1)))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ap_enable_reg_pp0_iter1 == 1'b1) & (((exitcond_i_reg_178 == 1'd0) & (from1_V_empty_n == 1'b0)) | ((exitcond_i_reg_178 == 1'd0) & (from0_V_empty_n == 1'b0)))) | ((exitcond_i_reg_178_pp0_iter3_reg == 1'd0) & (to_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter1 == 1'b1) & (((exitcond_i_reg_178 == 1'd0) & (from1_V_empty_n == 1'b0)) | ((exitcond_i_reg_178 == 1'd0) & (from0_V_empty_n == 1'b0)))) | ((exitcond_i_reg_178_pp0_iter3_reg == 1'd0) & (to_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter1 == 1'b1) & (((exitcond_i_reg_178 == 1'd0) & (from1_V_empty_n == 1'b0)) | ((exitcond_i_reg_178 == 1'd0) & (from0_V_empty_n == 1'b0)))) | ((exitcond_i_reg_178_pp0_iter3_reg == 1'd0) & (to_V_full_n == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)));
end

always @ (*) begin
    ap_block_state1 = ((real_start == 1'b0) | (data_count_out_full_n == 1'b0) | (data_count_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = (((exitcond_i_reg_178 == 1'd0) & (from1_V_empty_n == 1'b0)) | ((exitcond_i_reg_178 == 1'd0) & (from0_V_empty_n == 1'b0)));
end

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state6_pp0_stage0_iter4 = ((exitcond_i_reg_178_pp0_iter3_reg == 1'd0) & (to_V_full_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_ready = internal_ap_ready;

assign data_count_out_din = data_count_dout;

assign exitcond_i_fu_158_p2 = ((i_i_reg_147 == data_count_read_reg_173) ? 1'b1 : 1'b0);

assign i_fu_163_p2 = (i_i_reg_147 + 16'd1);

assign start_out = real_start;

assign to_V_din = tmp_2_reg_197;

endmodule //gather
