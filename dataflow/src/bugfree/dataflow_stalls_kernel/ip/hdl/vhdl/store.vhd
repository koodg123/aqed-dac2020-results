-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.1
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity store is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_to_r_AWVALID : OUT STD_LOGIC;
    m_axi_to_r_AWREADY : IN STD_LOGIC;
    m_axi_to_r_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_to_r_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_to_r_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_to_r_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_to_r_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_to_r_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_to_r_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_to_r_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_to_r_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_to_r_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_to_r_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_to_r_WVALID : OUT STD_LOGIC;
    m_axi_to_r_WREADY : IN STD_LOGIC;
    m_axi_to_r_WDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_to_r_WSTRB : OUT STD_LOGIC_VECTOR (7 downto 0);
    m_axi_to_r_WLAST : OUT STD_LOGIC;
    m_axi_to_r_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_to_r_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_to_r_ARVALID : OUT STD_LOGIC;
    m_axi_to_r_ARREADY : IN STD_LOGIC;
    m_axi_to_r_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_to_r_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_to_r_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_to_r_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_to_r_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_to_r_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_to_r_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_to_r_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_to_r_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_to_r_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_to_r_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_to_r_RVALID : IN STD_LOGIC;
    m_axi_to_r_RREADY : OUT STD_LOGIC;
    m_axi_to_r_RDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    m_axi_to_r_RLAST : IN STD_LOGIC;
    m_axi_to_r_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_to_r_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_to_r_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_to_r_BVALID : IN STD_LOGIC;
    m_axi_to_r_BREADY : OUT STD_LOGIC;
    m_axi_to_r_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_to_r_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_to_r_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    to_offset_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    to_offset_empty_n : IN STD_LOGIC;
    to_offset_read : OUT STD_LOGIC;
    from_V_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    from_V_empty_n : IN STD_LOGIC;
    from_V_read : OUT STD_LOGIC;
    data_count_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    data_count_empty_n : IN STD_LOGIC;
    data_count_read : OUT STD_LOGIC );
end;


architecture behav of store is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (7 downto 0) := "00000010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (7 downto 0) := "00000100";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (7 downto 0) := "00001000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (7 downto 0) := "00010000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (7 downto 0) := "00100000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (7 downto 0) := "01000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (7 downto 0) := "10000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv8_FF : STD_LOGIC_VECTOR (7 downto 0) := "11111111";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal to_r_blk_n_AW : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal to_r_blk_n_W : STD_LOGIC;
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal exitcond_i_i_reg_190 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_reg_pp0_iter1_exitcond_i_i_reg_190 : STD_LOGIC_VECTOR (0 downto 0);
    signal to_r_blk_n_B : STD_LOGIC;
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal to_offset_blk_n : STD_LOGIC;
    signal from_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal data_count_blk_n : STD_LOGIC;
    signal i_i_i_reg_131 : STD_LOGIC_VECTOR (31 downto 0);
    signal to_offset1_i_reg_173 : STD_LOGIC_VECTOR (60 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal data_count_read_reg_178 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sig_ioackin_m_axi_to_r_AWREADY : STD_LOGIC;
    signal exitcond_i_i_fu_162_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter2 : BOOLEAN;
    signal ap_sig_ioackin_m_axi_to_r_WREADY : STD_LOGIC;
    signal ap_block_state5_io : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal i_fu_167_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal tmp_reg_199 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state3 : STD_LOGIC;
    signal tmp_1_i_fu_152_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_reg_ioackin_m_axi_to_r_AWREADY : STD_LOGIC := '0';
    signal ap_reg_ioackin_m_axi_to_r_WREADY : STD_LOGIC := '0';
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;


begin




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
                if ((ap_const_logic_1 = ap_continue)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state10) and (m_axi_to_r_BVALID = ap_const_logic_1))) then 
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
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_block_pp0_stage0_subdone = ap_const_boolean_0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_sig_ioackin_m_axi_to_r_AWREADY = ap_const_logic_1))) then 
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
                if ((ap_block_pp0_stage0_subdone = ap_const_boolean_0)) then
                    if ((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3)) then 
                        ap_enable_reg_pp0_iter1 <= (ap_condition_pp0_exit_iter0_state3 xor ap_const_logic_1);
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
                if ((ap_block_pp0_stage0_subdone = ap_const_boolean_0)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_sig_ioackin_m_axi_to_r_AWREADY = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ioackin_m_axi_to_r_AWREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_m_axi_to_r_AWREADY <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                    if ((ap_sig_ioackin_m_axi_to_r_AWREADY = ap_const_logic_1)) then 
                        ap_reg_ioackin_m_axi_to_r_AWREADY <= ap_const_logic_0;
                    elsif ((ap_const_logic_1 = m_axi_to_r_AWREADY)) then 
                        ap_reg_ioackin_m_axi_to_r_AWREADY <= ap_const_logic_1;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_reg_ioackin_m_axi_to_r_WREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_ioackin_m_axi_to_r_WREADY <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_enable_reg_pp0_iter2) and (ap_const_lv1_0 = ap_reg_pp0_iter1_exitcond_i_i_reg_190))) then
                    if ((ap_block_pp0_stage0_11001 = ap_const_boolean_0)) then 
                        ap_reg_ioackin_m_axi_to_r_WREADY <= ap_const_logic_0;
                    elsif (((ap_const_logic_1 = m_axi_to_r_WREADY) and (ap_block_pp0_stage0_01001 = ap_const_boolean_0))) then 
                        ap_reg_ioackin_m_axi_to_r_WREADY <= ap_const_logic_1;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    i_i_i_reg_131_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_block_pp0_stage0_11001 = ap_const_boolean_0) and (ap_const_logic_1 = ap_enable_reg_pp0_iter0) and (ap_const_lv1_0 = exitcond_i_i_fu_162_p2))) then 
                i_i_i_reg_131 <= i_fu_167_p2;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_sig_ioackin_m_axi_to_r_AWREADY = ap_const_logic_1))) then 
                i_i_i_reg_131 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_block_pp0_stage0_11001 = ap_const_boolean_0))) then
                ap_reg_pp0_iter1_exitcond_i_i_reg_190 <= exitcond_i_i_reg_190;
                exitcond_i_i_reg_190 <= exitcond_i_i_fu_162_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and not(((ap_const_logic_0 = ap_start) or (ap_done_reg = ap_const_logic_1) or (ap_const_logic_0 = to_offset_empty_n) or (ap_const_logic_0 = data_count_empty_n))))) then
                data_count_read_reg_178 <= data_count_dout;
                to_offset1_i_reg_173 <= to_offset_dout(63 downto 3);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_lv1_0 = exitcond_i_i_reg_190) and (ap_block_pp0_stage0_11001 = ap_const_boolean_0))) then
                tmp_reg_199 <= from_V_dout;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, m_axi_to_r_BVALID, to_offset_empty_n, data_count_empty_n, ap_CS_fsm_state2, ap_enable_reg_pp0_iter2, ap_CS_fsm_state10, ap_enable_reg_pp0_iter1, ap_sig_ioackin_m_axi_to_r_AWREADY, exitcond_i_i_fu_162_p2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and not(((ap_const_logic_0 = ap_start) or (ap_done_reg = ap_const_logic_1) or (ap_const_logic_0 = to_offset_empty_n) or (ap_const_logic_0 = data_count_empty_n))))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_sig_ioackin_m_axi_to_r_AWREADY = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_const_logic_1 = ap_enable_reg_pp0_iter2) and (ap_block_pp0_stage0_subdone = ap_const_boolean_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) and not(((ap_const_logic_1 = ap_enable_reg_pp0_iter0) and (ap_block_pp0_stage0_subdone = ap_const_boolean_0) and (exitcond_i_i_fu_162_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif ((((ap_const_logic_1 = ap_enable_reg_pp0_iter2) and (ap_block_pp0_stage0_subdone = ap_const_boolean_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter0) and (ap_block_pp0_stage0_subdone = ap_const_boolean_0) and (exitcond_i_i_fu_162_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0)))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state10) and (m_axi_to_r_BVALID = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state10;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(7);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(from_V_empty_n, exitcond_i_i_reg_190, ap_enable_reg_pp0_iter1)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_const_lv1_0 = exitcond_i_i_reg_190) and (ap_const_logic_0 = from_V_empty_n));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(from_V_empty_n, ap_enable_reg_pp0_iter2, exitcond_i_i_reg_190, ap_enable_reg_pp0_iter1, ap_block_state5_io)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_const_lv1_0 = exitcond_i_i_reg_190) and (ap_const_logic_0 = from_V_empty_n)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter2) and (ap_const_boolean_1 = ap_block_state5_io)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(from_V_empty_n, ap_enable_reg_pp0_iter2, exitcond_i_i_reg_190, ap_enable_reg_pp0_iter1, ap_block_state5_io)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_const_lv1_0 = exitcond_i_i_reg_190) and (ap_const_logic_0 = from_V_empty_n)) or ((ap_const_logic_1 = ap_enable_reg_pp0_iter2) and (ap_const_boolean_1 = ap_block_state5_io)));
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, to_offset_empty_n, data_count_empty_n)
    begin
                ap_block_state1 <= ((ap_const_logic_0 = ap_start) or (ap_done_reg = ap_const_logic_1) or (ap_const_logic_0 = to_offset_empty_n) or (ap_const_logic_0 = data_count_empty_n));
    end process;

        ap_block_state3_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter1_assign_proc : process(from_V_empty_n, exitcond_i_i_reg_190)
    begin
                ap_block_state4_pp0_stage0_iter1 <= ((ap_const_lv1_0 = exitcond_i_i_reg_190) and (ap_const_logic_0 = from_V_empty_n));
    end process;


    ap_block_state5_io_assign_proc : process(ap_reg_pp0_iter1_exitcond_i_i_reg_190, ap_sig_ioackin_m_axi_to_r_WREADY)
    begin
                ap_block_state5_io <= ((ap_const_lv1_0 = ap_reg_pp0_iter1_exitcond_i_i_reg_190) and (ap_const_logic_0 = ap_sig_ioackin_m_axi_to_r_WREADY));
    end process;

        ap_block_state5_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_pp0_exit_iter0_state3_assign_proc : process(exitcond_i_i_fu_162_p2)
    begin
        if ((exitcond_i_i_fu_162_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_done_reg, m_axi_to_r_BVALID, ap_CS_fsm_state10)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state10) and (m_axi_to_r_BVALID = ap_const_logic_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_const_logic_0 = ap_enable_reg_pp0_iter0) and (ap_const_logic_0 = ap_enable_reg_pp0_iter1) and (ap_const_logic_0 = ap_enable_reg_pp0_iter2))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(m_axi_to_r_BVALID, ap_CS_fsm_state10)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state10) and (m_axi_to_r_BVALID = ap_const_logic_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_ioackin_m_axi_to_r_AWREADY_assign_proc : process(m_axi_to_r_AWREADY, ap_reg_ioackin_m_axi_to_r_AWREADY)
    begin
        if ((ap_const_logic_0 = ap_reg_ioackin_m_axi_to_r_AWREADY)) then 
            ap_sig_ioackin_m_axi_to_r_AWREADY <= m_axi_to_r_AWREADY;
        else 
            ap_sig_ioackin_m_axi_to_r_AWREADY <= ap_const_logic_1;
        end if; 
    end process;


    ap_sig_ioackin_m_axi_to_r_WREADY_assign_proc : process(m_axi_to_r_WREADY, ap_reg_ioackin_m_axi_to_r_WREADY)
    begin
        if ((ap_const_logic_0 = ap_reg_ioackin_m_axi_to_r_WREADY)) then 
            ap_sig_ioackin_m_axi_to_r_WREADY <= m_axi_to_r_WREADY;
        else 
            ap_sig_ioackin_m_axi_to_r_WREADY <= ap_const_logic_1;
        end if; 
    end process;


    data_count_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, data_count_empty_n)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and not(((ap_const_logic_0 = ap_start) or (ap_done_reg = ap_const_logic_1))))) then 
            data_count_blk_n <= data_count_empty_n;
        else 
            data_count_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    data_count_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, to_offset_empty_n, data_count_empty_n)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and not(((ap_const_logic_0 = ap_start) or (ap_done_reg = ap_const_logic_1) or (ap_const_logic_0 = to_offset_empty_n) or (ap_const_logic_0 = data_count_empty_n))))) then 
            data_count_read <= ap_const_logic_1;
        else 
            data_count_read <= ap_const_logic_0;
        end if; 
    end process;

    exitcond_i_i_fu_162_p2 <= "1" when (i_i_i_reg_131 = data_count_read_reg_178) else "0";

    from_V_blk_n_assign_proc : process(from_V_empty_n, ap_block_pp0_stage0, exitcond_i_i_reg_190, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_block_pp0_stage0 = ap_const_boolean_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_const_lv1_0 = exitcond_i_i_reg_190))) then 
            from_V_blk_n <= from_V_empty_n;
        else 
            from_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    from_V_read_assign_proc : process(exitcond_i_i_reg_190, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_enable_reg_pp0_iter1) and (ap_const_lv1_0 = exitcond_i_i_reg_190) and (ap_block_pp0_stage0_11001 = ap_const_boolean_0))) then 
            from_V_read <= ap_const_logic_1;
        else 
            from_V_read <= ap_const_logic_0;
        end if; 
    end process;

    i_fu_167_p2 <= std_logic_vector(unsigned(i_i_i_reg_131) + unsigned(ap_const_lv32_1));
    m_axi_to_r_ARADDR <= ap_const_lv64_0;
    m_axi_to_r_ARBURST <= ap_const_lv2_0;
    m_axi_to_r_ARCACHE <= ap_const_lv4_0;
    m_axi_to_r_ARID <= ap_const_lv1_0;
    m_axi_to_r_ARLEN <= ap_const_lv32_0;
    m_axi_to_r_ARLOCK <= ap_const_lv2_0;
    m_axi_to_r_ARPROT <= ap_const_lv3_0;
    m_axi_to_r_ARQOS <= ap_const_lv4_0;
    m_axi_to_r_ARREGION <= ap_const_lv4_0;
    m_axi_to_r_ARSIZE <= ap_const_lv3_0;
    m_axi_to_r_ARUSER <= ap_const_lv1_0;
    m_axi_to_r_ARVALID <= ap_const_logic_0;
    m_axi_to_r_AWADDR <= tmp_1_i_fu_152_p1;
    m_axi_to_r_AWBURST <= ap_const_lv2_0;
    m_axi_to_r_AWCACHE <= ap_const_lv4_0;
    m_axi_to_r_AWID <= ap_const_lv1_0;
    m_axi_to_r_AWLEN <= data_count_read_reg_178;
    m_axi_to_r_AWLOCK <= ap_const_lv2_0;
    m_axi_to_r_AWPROT <= ap_const_lv3_0;
    m_axi_to_r_AWQOS <= ap_const_lv4_0;
    m_axi_to_r_AWREGION <= ap_const_lv4_0;
    m_axi_to_r_AWSIZE <= ap_const_lv3_0;
    m_axi_to_r_AWUSER <= ap_const_lv1_0;

    m_axi_to_r_AWVALID_assign_proc : process(ap_CS_fsm_state2, ap_reg_ioackin_m_axi_to_r_AWREADY)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_logic_0 = ap_reg_ioackin_m_axi_to_r_AWREADY))) then 
            m_axi_to_r_AWVALID <= ap_const_logic_1;
        else 
            m_axi_to_r_AWVALID <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_to_r_BREADY_assign_proc : process(m_axi_to_r_BVALID, ap_CS_fsm_state10)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state10) and (m_axi_to_r_BVALID = ap_const_logic_1))) then 
            m_axi_to_r_BREADY <= ap_const_logic_1;
        else 
            m_axi_to_r_BREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_to_r_RREADY <= ap_const_logic_0;
    m_axi_to_r_WDATA <= tmp_reg_199;
    m_axi_to_r_WID <= ap_const_lv1_0;
    m_axi_to_r_WLAST <= ap_const_logic_0;
    m_axi_to_r_WSTRB <= ap_const_lv8_FF;
    m_axi_to_r_WUSER <= ap_const_lv1_0;

    m_axi_to_r_WVALID_assign_proc : process(ap_enable_reg_pp0_iter2, ap_reg_pp0_iter1_exitcond_i_i_reg_190, ap_reg_ioackin_m_axi_to_r_WREADY, ap_block_pp0_stage0_01001)
    begin
        if (((ap_const_logic_1 = ap_enable_reg_pp0_iter2) and (ap_const_lv1_0 = ap_reg_pp0_iter1_exitcond_i_i_reg_190) and (ap_block_pp0_stage0_01001 = ap_const_boolean_0) and (ap_const_logic_0 = ap_reg_ioackin_m_axi_to_r_WREADY))) then 
            m_axi_to_r_WVALID <= ap_const_logic_1;
        else 
            m_axi_to_r_WVALID <= ap_const_logic_0;
        end if; 
    end process;

    tmp_1_i_fu_152_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(to_offset1_i_reg_173),64));

    to_offset_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, to_offset_empty_n)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and not(((ap_const_logic_0 = ap_start) or (ap_done_reg = ap_const_logic_1))))) then 
            to_offset_blk_n <= to_offset_empty_n;
        else 
            to_offset_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    to_offset_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, to_offset_empty_n, data_count_empty_n)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and not(((ap_const_logic_0 = ap_start) or (ap_done_reg = ap_const_logic_1) or (ap_const_logic_0 = to_offset_empty_n) or (ap_const_logic_0 = data_count_empty_n))))) then 
            to_offset_read <= ap_const_logic_1;
        else 
            to_offset_read <= ap_const_logic_0;
        end if; 
    end process;


    to_r_blk_n_AW_assign_proc : process(m_axi_to_r_AWREADY, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            to_r_blk_n_AW <= m_axi_to_r_AWREADY;
        else 
            to_r_blk_n_AW <= ap_const_logic_1;
        end if; 
    end process;


    to_r_blk_n_B_assign_proc : process(m_axi_to_r_BVALID, ap_CS_fsm_state10)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            to_r_blk_n_B <= m_axi_to_r_BVALID;
        else 
            to_r_blk_n_B <= ap_const_logic_1;
        end if; 
    end process;


    to_r_blk_n_W_assign_proc : process(m_axi_to_r_WREADY, ap_enable_reg_pp0_iter2, ap_block_pp0_stage0, ap_reg_pp0_iter1_exitcond_i_i_reg_190)
    begin
        if (((ap_const_logic_1 = ap_enable_reg_pp0_iter2) and (ap_block_pp0_stage0 = ap_const_boolean_0) and (ap_const_lv1_0 = ap_reg_pp0_iter1_exitcond_i_i_reg_190))) then 
            to_r_blk_n_W <= m_axi_to_r_WREADY;
        else 
            to_r_blk_n_W <= ap_const_logic_1;
        end if; 
    end process;

end behav;
