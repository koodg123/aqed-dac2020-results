-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity outer_product is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    start_full_n : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    start_out : OUT STD_LOGIC;
    start_write : OUT STD_LOGIC;
    filtered_gradient_x_s_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    filtered_gradient_x_s_empty_n : IN STD_LOGIC;
    filtered_gradient_x_s_read : OUT STD_LOGIC;
    filtered_gradient_y_s_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    filtered_gradient_y_s_empty_n : IN STD_LOGIC;
    filtered_gradient_y_s_read : OUT STD_LOGIC;
    filtered_gradient_z_s_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    filtered_gradient_z_s_empty_n : IN STD_LOGIC;
    filtered_gradient_z_s_read : OUT STD_LOGIC;
    out_product_val_V_din : OUT STD_LOGIC_VECTOR (190 downto 0);
    out_product_val_V_full_n : IN STD_LOGIC;
    out_product_val_V_write : OUT STD_LOGIC );
end;


architecture behav of outer_product is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    constant ap_const_lv6_32 : STD_LOGIC_VECTOR (5 downto 0) := "110010";
    constant ap_const_lv6_1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_const_lv32_E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001110";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_23 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100011";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";

    signal real_start : STD_LOGIC;
    signal start_once_reg : STD_LOGIC := '0';
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal internal_ap_ready : STD_LOGIC;
    signal filtered_gradient_x_s_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal exitcond_flatten_reg_277 : STD_LOGIC_VECTOR (0 downto 0);
    signal filtered_gradient_y_s_blk_n : STD_LOGIC;
    signal filtered_gradient_z_s_blk_n : STD_LOGIC;
    signal out_product_val_V_blk_n : STD_LOGIC;
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal exitcond_flatten_reg_277_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal indvar_flatten_reg_85 : STD_LOGIC_VECTOR (5 downto 0);
    signal exitcond_flatten_fu_96_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal indvar_flatten_next_fu_102_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal tmp_1_reg_286 : STD_LOGIC_VECTOR (30 downto 0);
    signal tmp_4_reg_291 : STD_LOGIC_VECTOR (30 downto 0);
    signal tmp_7_reg_296 : STD_LOGIC_VECTOR (30 downto 0);
    signal tmp_s_reg_301 : STD_LOGIC_VECTOR (30 downto 0);
    signal tmp_6_reg_306 : STD_LOGIC_VECTOR (30 downto 0);
    signal tmp_10_reg_311 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state2 : STD_LOGIC;
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal tmp_38_i_fu_108_p4 : STD_LOGIC_VECTOR (17 downto 0);
    signal p_Val2_3_fu_235_p2 : STD_LOGIC_VECTOR (35 downto 0);
    signal tmp_40_i_fu_118_p4 : STD_LOGIC_VECTOR (17 downto 0);
    signal p_Val2_4_fu_242_p2 : STD_LOGIC_VECTOR (35 downto 0);
    signal tmp_42_i_fu_128_p4 : STD_LOGIC_VECTOR (17 downto 0);
    signal p_Val2_5_fu_249_p2 : STD_LOGIC_VECTOR (35 downto 0);
    signal p_Val2_6_fu_256_p2 : STD_LOGIC_VECTOR (35 downto 0);
    signal p_Val2_7_fu_263_p2 : STD_LOGIC_VECTOR (35 downto 0);
    signal p_Val2_8_fu_270_p2 : STD_LOGIC_VECTOR (35 downto 0);
    signal tmp_9_fu_216_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_3_fu_213_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_8_fu_210_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_5_fu_207_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_2_fu_204_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Val2_3_fu_235_p0 : STD_LOGIC_VECTOR (17 downto 0);
    signal OP1_V_cast_i_fu_138_p1 : STD_LOGIC_VECTOR (35 downto 0);
    signal p_Val2_3_fu_235_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal p_Val2_4_fu_242_p0 : STD_LOGIC_VECTOR (17 downto 0);
    signal OP1_V_1_cast_i_fu_151_p1 : STD_LOGIC_VECTOR (35 downto 0);
    signal p_Val2_4_fu_242_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal p_Val2_5_fu_249_p0 : STD_LOGIC_VECTOR (17 downto 0);
    signal OP1_V_2_cast_i_fu_164_p1 : STD_LOGIC_VECTOR (35 downto 0);
    signal p_Val2_5_fu_249_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal p_Val2_6_fu_256_p0 : STD_LOGIC_VECTOR (17 downto 0);
    signal p_Val2_6_fu_256_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal p_Val2_7_fu_263_p0 : STD_LOGIC_VECTOR (17 downto 0);
    signal p_Val2_7_fu_263_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal p_Val2_8_fu_270_p0 : STD_LOGIC_VECTOR (17 downto 0);
    signal p_Val2_8_fu_270_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;

    component optical_flow_mul_yd2 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (17 downto 0);
        din1 : IN STD_LOGIC_VECTOR (17 downto 0);
        dout : OUT STD_LOGIC_VECTOR (35 downto 0) );
    end component;



begin
    optical_flow_mul_yd2_U39 : component optical_flow_mul_yd2
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 18,
        din1_WIDTH => 18,
        dout_WIDTH => 36)
    port map (
        din0 => p_Val2_3_fu_235_p0,
        din1 => p_Val2_3_fu_235_p1,
        dout => p_Val2_3_fu_235_p2);

    optical_flow_mul_yd2_U40 : component optical_flow_mul_yd2
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 18,
        din1_WIDTH => 18,
        dout_WIDTH => 36)
    port map (
        din0 => p_Val2_4_fu_242_p0,
        din1 => p_Val2_4_fu_242_p1,
        dout => p_Val2_4_fu_242_p2);

    optical_flow_mul_yd2_U41 : component optical_flow_mul_yd2
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 18,
        din1_WIDTH => 18,
        dout_WIDTH => 36)
    port map (
        din0 => p_Val2_5_fu_249_p0,
        din1 => p_Val2_5_fu_249_p1,
        dout => p_Val2_5_fu_249_p2);

    optical_flow_mul_yd2_U42 : component optical_flow_mul_yd2
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 18,
        din1_WIDTH => 18,
        dout_WIDTH => 36)
    port map (
        din0 => p_Val2_6_fu_256_p0,
        din1 => p_Val2_6_fu_256_p1,
        dout => p_Val2_6_fu_256_p2);

    optical_flow_mul_yd2_U43 : component optical_flow_mul_yd2
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 18,
        din1_WIDTH => 18,
        dout_WIDTH => 36)
    port map (
        din0 => p_Val2_7_fu_263_p0,
        din1 => p_Val2_7_fu_263_p1,
        dout => p_Val2_7_fu_263_p2);

    optical_flow_mul_yd2_U44 : component optical_flow_mul_yd2
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 18,
        din1_WIDTH => 18,
        dout_WIDTH => 36)
    port map (
        din0 => p_Val2_8_fu_270_p0,
        din1 => p_Val2_8_fu_270_p1,
        dout => p_Val2_8_fu_270_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then
                    if ((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2)) then 
                        ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state2);
                    elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                        ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                elsif ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    start_once_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                start_once_reg <= ap_const_logic_0;
            else
                if (((internal_ap_ready = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
                    start_once_reg <= ap_const_logic_1;
                elsif ((internal_ap_ready = ap_const_logic_1)) then 
                    start_once_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    indvar_flatten_reg_85_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond_flatten_fu_96_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
                indvar_flatten_reg_85 <= indvar_flatten_next_fu_102_p2;
            elsif ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                indvar_flatten_reg_85 <= ap_const_lv6_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                exitcond_flatten_reg_277 <= exitcond_flatten_fu_96_p2;
                exitcond_flatten_reg_277_pp0_iter1_reg <= exitcond_flatten_reg_277;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond_flatten_reg_277 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_10_reg_311 <= p_Val2_8_fu_270_p2(35 downto 5);
                tmp_1_reg_286 <= p_Val2_3_fu_235_p2(35 downto 5);
                tmp_4_reg_291 <= p_Val2_4_fu_242_p2(35 downto 5);
                tmp_6_reg_306 <= p_Val2_7_fu_263_p2(35 downto 5);
                tmp_7_reg_296 <= p_Val2_5_fu_249_p2(35 downto 5);
                tmp_s_reg_301 <= p_Val2_6_fu_256_p2(35 downto 5);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (real_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, exitcond_flatten_fu_96_p2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((exitcond_flatten_fu_96_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) and not(((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif ((((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) or ((exitcond_flatten_fu_96_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
        OP1_V_1_cast_i_fu_151_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_40_i_fu_118_p4),36));

        OP1_V_2_cast_i_fu_164_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_42_i_fu_128_p4),36));

        OP1_V_cast_i_fu_138_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_38_i_fu_108_p4),36));

    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state5 <= ap_CS_fsm(2);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(filtered_gradient_x_s_empty_n, filtered_gradient_y_s_empty_n, filtered_gradient_z_s_empty_n, out_product_val_V_full_n, ap_enable_reg_pp0_iter1, exitcond_flatten_reg_277, ap_enable_reg_pp0_iter2, exitcond_flatten_reg_277_pp0_iter1_reg)
    begin
                ap_block_pp0_stage0_01001 <= (((exitcond_flatten_reg_277_pp0_iter1_reg = ap_const_lv1_0) and (out_product_val_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((exitcond_flatten_reg_277 = ap_const_lv1_0) and (filtered_gradient_z_s_empty_n = ap_const_logic_0)) or ((exitcond_flatten_reg_277 = ap_const_lv1_0) and (filtered_gradient_y_s_empty_n = ap_const_logic_0)) or ((exitcond_flatten_reg_277 = ap_const_lv1_0) and (filtered_gradient_x_s_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(filtered_gradient_x_s_empty_n, filtered_gradient_y_s_empty_n, filtered_gradient_z_s_empty_n, out_product_val_V_full_n, ap_enable_reg_pp0_iter1, exitcond_flatten_reg_277, ap_enable_reg_pp0_iter2, exitcond_flatten_reg_277_pp0_iter1_reg)
    begin
                ap_block_pp0_stage0_11001 <= (((exitcond_flatten_reg_277_pp0_iter1_reg = ap_const_lv1_0) and (out_product_val_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((exitcond_flatten_reg_277 = ap_const_lv1_0) and (filtered_gradient_z_s_empty_n = ap_const_logic_0)) or ((exitcond_flatten_reg_277 = ap_const_lv1_0) and (filtered_gradient_y_s_empty_n = ap_const_logic_0)) or ((exitcond_flatten_reg_277 = ap_const_lv1_0) and (filtered_gradient_x_s_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(filtered_gradient_x_s_empty_n, filtered_gradient_y_s_empty_n, filtered_gradient_z_s_empty_n, out_product_val_V_full_n, ap_enable_reg_pp0_iter1, exitcond_flatten_reg_277, ap_enable_reg_pp0_iter2, exitcond_flatten_reg_277_pp0_iter1_reg)
    begin
                ap_block_pp0_stage0_subdone <= (((exitcond_flatten_reg_277_pp0_iter1_reg = ap_const_lv1_0) and (out_product_val_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((exitcond_flatten_reg_277 = ap_const_lv1_0) and (filtered_gradient_z_s_empty_n = ap_const_logic_0)) or ((exitcond_flatten_reg_277 = ap_const_lv1_0) and (filtered_gradient_y_s_empty_n = ap_const_logic_0)) or ((exitcond_flatten_reg_277 = ap_const_lv1_0) and (filtered_gradient_x_s_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_state1_assign_proc : process(real_start, ap_done_reg)
    begin
                ap_block_state1 <= ((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;

        ap_block_state2_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state3_pp0_stage0_iter1_assign_proc : process(filtered_gradient_x_s_empty_n, filtered_gradient_y_s_empty_n, filtered_gradient_z_s_empty_n, exitcond_flatten_reg_277)
    begin
                ap_block_state3_pp0_stage0_iter1 <= (((exitcond_flatten_reg_277 = ap_const_lv1_0) and (filtered_gradient_z_s_empty_n = ap_const_logic_0)) or ((exitcond_flatten_reg_277 = ap_const_lv1_0) and (filtered_gradient_y_s_empty_n = ap_const_logic_0)) or ((exitcond_flatten_reg_277 = ap_const_lv1_0) and (filtered_gradient_x_s_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state4_pp0_stage0_iter2_assign_proc : process(out_product_val_V_full_n, exitcond_flatten_reg_277_pp0_iter1_reg)
    begin
                ap_block_state4_pp0_stage0_iter2 <= ((exitcond_flatten_reg_277_pp0_iter1_reg = ap_const_lv1_0) and (out_product_val_V_full_n = ap_const_logic_0));
    end process;


    ap_condition_pp0_exit_iter0_state2_assign_proc : process(exitcond_flatten_fu_96_p2)
    begin
        if ((exitcond_flatten_fu_96_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(real_start, ap_CS_fsm_state1)
    begin
        if (((real_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_ready <= internal_ap_ready;
    exitcond_flatten_fu_96_p2 <= "1" when (indvar_flatten_reg_85 = ap_const_lv6_32) else "0";

    filtered_gradient_x_s_blk_n_assign_proc : process(filtered_gradient_x_s_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, exitcond_flatten_reg_277)
    begin
        if (((exitcond_flatten_reg_277 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            filtered_gradient_x_s_blk_n <= filtered_gradient_x_s_empty_n;
        else 
            filtered_gradient_x_s_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    filtered_gradient_x_s_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, exitcond_flatten_reg_277, ap_block_pp0_stage0_11001)
    begin
        if (((exitcond_flatten_reg_277 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            filtered_gradient_x_s_read <= ap_const_logic_1;
        else 
            filtered_gradient_x_s_read <= ap_const_logic_0;
        end if; 
    end process;


    filtered_gradient_y_s_blk_n_assign_proc : process(filtered_gradient_y_s_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, exitcond_flatten_reg_277)
    begin
        if (((exitcond_flatten_reg_277 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            filtered_gradient_y_s_blk_n <= filtered_gradient_y_s_empty_n;
        else 
            filtered_gradient_y_s_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    filtered_gradient_y_s_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, exitcond_flatten_reg_277, ap_block_pp0_stage0_11001)
    begin
        if (((exitcond_flatten_reg_277 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            filtered_gradient_y_s_read <= ap_const_logic_1;
        else 
            filtered_gradient_y_s_read <= ap_const_logic_0;
        end if; 
    end process;


    filtered_gradient_z_s_blk_n_assign_proc : process(filtered_gradient_z_s_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, exitcond_flatten_reg_277)
    begin
        if (((exitcond_flatten_reg_277 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            filtered_gradient_z_s_blk_n <= filtered_gradient_z_s_empty_n;
        else 
            filtered_gradient_z_s_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    filtered_gradient_z_s_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, exitcond_flatten_reg_277, ap_block_pp0_stage0_11001)
    begin
        if (((exitcond_flatten_reg_277 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            filtered_gradient_z_s_read <= ap_const_logic_1;
        else 
            filtered_gradient_z_s_read <= ap_const_logic_0;
        end if; 
    end process;

    indvar_flatten_next_fu_102_p2 <= std_logic_vector(unsigned(indvar_flatten_reg_85) + unsigned(ap_const_lv6_1));

    internal_ap_ready_assign_proc : process(ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            internal_ap_ready <= ap_const_logic_1;
        else 
            internal_ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    out_product_val_V_blk_n_assign_proc : process(out_product_val_V_full_n, ap_block_pp0_stage0, ap_enable_reg_pp0_iter2, exitcond_flatten_reg_277_pp0_iter1_reg)
    begin
        if (((exitcond_flatten_reg_277_pp0_iter1_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            out_product_val_V_blk_n <= out_product_val_V_full_n;
        else 
            out_product_val_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    out_product_val_V_din <= (((((tmp_10_reg_311 & tmp_9_fu_216_p1) & tmp_3_fu_213_p1) & tmp_8_fu_210_p1) & tmp_5_fu_207_p1) & tmp_2_fu_204_p1);

    out_product_val_V_write_assign_proc : process(ap_enable_reg_pp0_iter2, exitcond_flatten_reg_277_pp0_iter1_reg, ap_block_pp0_stage0_11001)
    begin
        if (((exitcond_flatten_reg_277_pp0_iter1_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            out_product_val_V_write <= ap_const_logic_1;
        else 
            out_product_val_V_write <= ap_const_logic_0;
        end if; 
    end process;

    p_Val2_3_fu_235_p0 <= OP1_V_cast_i_fu_138_p1(18 - 1 downto 0);
    p_Val2_3_fu_235_p1 <= OP1_V_cast_i_fu_138_p1(18 - 1 downto 0);
    p_Val2_4_fu_242_p0 <= OP1_V_1_cast_i_fu_151_p1(18 - 1 downto 0);
    p_Val2_4_fu_242_p1 <= OP1_V_1_cast_i_fu_151_p1(18 - 1 downto 0);
    p_Val2_5_fu_249_p0 <= OP1_V_2_cast_i_fu_164_p1(18 - 1 downto 0);
    p_Val2_5_fu_249_p1 <= OP1_V_2_cast_i_fu_164_p1(18 - 1 downto 0);
    p_Val2_6_fu_256_p0 <= OP1_V_cast_i_fu_138_p1(18 - 1 downto 0);
    p_Val2_6_fu_256_p1 <= OP1_V_1_cast_i_fu_151_p1(18 - 1 downto 0);
    p_Val2_7_fu_263_p0 <= OP1_V_cast_i_fu_138_p1(18 - 1 downto 0);
    p_Val2_7_fu_263_p1 <= OP1_V_2_cast_i_fu_164_p1(18 - 1 downto 0);
    p_Val2_8_fu_270_p0 <= OP1_V_1_cast_i_fu_151_p1(18 - 1 downto 0);
    p_Val2_8_fu_270_p1 <= OP1_V_2_cast_i_fu_164_p1(18 - 1 downto 0);

    real_start_assign_proc : process(ap_start, start_full_n, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (start_full_n = ap_const_logic_0))) then 
            real_start <= ap_const_logic_0;
        else 
            real_start <= ap_start;
        end if; 
    end process;

    start_out <= real_start;

    start_write_assign_proc : process(real_start, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
            start_write <= ap_const_logic_1;
        else 
            start_write <= ap_const_logic_0;
        end if; 
    end process;

        tmp_2_fu_204_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_1_reg_286),32));

    tmp_38_i_fu_108_p4 <= filtered_gradient_x_s_dout(31 downto 14);
        tmp_3_fu_213_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_s_reg_301),32));

    tmp_40_i_fu_118_p4 <= filtered_gradient_y_s_dout(31 downto 14);
    tmp_42_i_fu_128_p4 <= filtered_gradient_z_s_dout(31 downto 14);
        tmp_5_fu_207_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_4_reg_291),32));

        tmp_8_fu_210_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_7_reg_296),32));

        tmp_9_fu_216_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_6_reg_306),32));

end behav;