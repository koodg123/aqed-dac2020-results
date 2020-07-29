// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

`timescale 1 ns / 1 ps
(* rom_style = "block" *) module Autocorrelation_bcud_rom (
addr0, ce0, q0, addr1, ce1, q1, addr2, ce2, q2, clk);

parameter DWIDTH = 4;
parameter AWIDTH = 8;
parameter MEM_SIZE = 256;

input[AWIDTH-1:0] addr0;
input ce0;
output reg[DWIDTH-1:0] q0;
input[AWIDTH-1:0] addr1;
input ce1;
output reg[DWIDTH-1:0] q1;
input[AWIDTH-1:0] addr2;
input ce2;
output reg[DWIDTH-1:0] q2;
input clk;

(* ram_style = "block" *)reg [DWIDTH-1:0] ram0[0:MEM_SIZE-1];
(* ram_style = "block" *)reg [DWIDTH-1:0] ram1[0:MEM_SIZE-1];

initial begin
    $readmemh("./Autocorrelation_bcud_rom.dat", ram0);
    $readmemh("./Autocorrelation_bcud_rom.dat", ram1);
end

assign ram0[0] = 4'hd8;
assign ram0[1] = 4'hd7;
assign ram0[2] = 4'hd6;
assign ram0[3] = 4'hd6;
assign ram0[4] = 4'hd5;
assign ram0[5] = 4'hd5;
assign ram0[6] = 4'hd5;
assign ram0[7] = 4'hd5;
assign ram0[8] = 4'hd4;
assign ram0[9] = 4'hd4;
assign ram0[10] = 4'hd4;
assign ram0[11] = 4'hd4;
assign ram0[12] = 4'hd4;
assign ram0[13] = 4'hd4;
assign ram0[14] = 4'hd4;
assign ram0[15] = 4'hd4;
assign ram0[16] = 4'hd3;
assign ram0[17] = 4'hd3;
assign ram0[18] = 4'hd3;
assign ram0[19] = 4'hd3;
assign ram0[20] = 4'hd3;
assign ram0[21] = 4'hd3;
assign ram0[22] = 4'hd3;
assign ram0[23] = 4'hd3;
assign ram0[24] = 4'hd3;
assign ram0[25] = 4'hd3;
assign ram0[26] = 4'hd3;
assign ram0[27] = 4'hd3;
assign ram0[28] = 4'hd3;
assign ram0[29] = 4'hd3;
assign ram0[30] = 4'hd3;
assign ram0[31] = 4'hd3;
assign ram0[32] = 4'hd2;
assign ram0[33] = 4'hd2;
assign ram0[34] = 4'hd2;
assign ram0[35] = 4'hd2;
assign ram0[36] = 4'hd2;
assign ram0[37] = 4'hd2;
assign ram0[38] = 4'hd2;
assign ram0[39] = 4'hd2;
assign ram0[40] = 4'hd2;
assign ram0[41] = 4'hd2;
assign ram0[42] = 4'hd2;
assign ram0[43] = 4'hd2;
assign ram0[44] = 4'hd2;
assign ram0[45] = 4'hd2;
assign ram0[46] = 4'hd2;
assign ram0[47] = 4'hd2;
assign ram0[48] = 4'hd2;
assign ram0[49] = 4'hd2;
assign ram0[50] = 4'hd2;
assign ram0[51] = 4'hd2;
assign ram0[52] = 4'hd2;
assign ram0[53] = 4'hd2;
assign ram0[54] = 4'hd2;
assign ram0[55] = 4'hd2;
assign ram0[56] = 4'hd2;
assign ram0[57] = 4'hd2;
assign ram0[58] = 4'hd2;
assign ram0[59] = 4'hd2;
assign ram0[60] = 4'hd2;
assign ram0[61] = 4'hd2;
assign ram0[62] = 4'hd2;
assign ram0[63] = 4'hd2;
assign ram0[64] = 4'hd1;
assign ram0[65] = 4'hd1;
assign ram0[66] = 4'hd1;
assign ram0[67] = 4'hd1;
assign ram0[68] = 4'hd1;
assign ram0[69] = 4'hd1;
assign ram0[70] = 4'hd1;
assign ram0[71] = 4'hd1;
assign ram0[72] = 4'hd1;
assign ram0[73] = 4'hd1;
assign ram0[74] = 4'hd1;
assign ram0[75] = 4'hd1;
assign ram0[76] = 4'hd1;
assign ram0[77] = 4'hd1;
assign ram0[78] = 4'hd1;
assign ram0[79] = 4'hd1;
assign ram0[80] = 4'hd1;
assign ram0[81] = 4'hd1;
assign ram0[82] = 4'hd1;
assign ram0[83] = 4'hd1;
assign ram0[84] = 4'hd1;
assign ram0[85] = 4'hd1;
assign ram0[86] = 4'hd1;
assign ram0[87] = 4'hd1;
assign ram0[88] = 4'hd1;
assign ram0[89] = 4'hd1;
assign ram0[90] = 4'hd1;
assign ram0[91] = 4'hd1;
assign ram0[92] = 4'hd1;
assign ram0[93] = 4'hd1;
assign ram0[94] = 4'hd1;
assign ram0[95] = 4'hd1;
assign ram0[96] = 4'hd1;
assign ram0[97] = 4'hd1;
assign ram0[98] = 4'hd1;
assign ram0[99] = 4'hd1;
assign ram0[100] = 4'hd1;
assign ram0[101] = 4'hd1;
assign ram0[102] = 4'hd1;
assign ram0[103] = 4'hd1;
assign ram0[104] = 4'hd1;
assign ram0[105] = 4'hd1;
assign ram0[106] = 4'hd1;
assign ram0[107] = 4'hd1;
assign ram0[108] = 4'hd1;
assign ram0[109] = 4'hd1;
assign ram0[110] = 4'hd1;
assign ram0[111] = 4'hd1;
assign ram0[112] = 4'hd1;
assign ram0[113] = 4'hd1;
assign ram0[114] = 4'hd1;
assign ram0[115] = 4'hd1;
assign ram0[116] = 4'hd1;
assign ram0[117] = 4'hd1;
assign ram0[118] = 4'hd1;
assign ram0[119] = 4'hd1;
assign ram0[120] = 4'hd1;
assign ram0[121] = 4'hd1;
assign ram0[122] = 4'hd1;
assign ram0[123] = 4'hd1;
assign ram0[124] = 4'hd1;
assign ram0[125] = 4'hd1;
assign ram0[126] = 4'hd1;
assign ram0[127] = 4'hd1;
assign ram0[128] = 4'hd0;
assign ram0[129] = 4'hd0;
assign ram0[130] = 4'hd0;
assign ram0[131] = 4'hd0;
assign ram0[132] = 4'hd0;
assign ram0[133] = 4'hd0;
assign ram0[134] = 4'hd0;
assign ram0[135] = 4'hd0;
assign ram0[136] = 4'hd0;
assign ram0[137] = 4'hd0;
assign ram0[138] = 4'hd0;
assign ram0[139] = 4'hd0;
assign ram0[140] = 4'hd0;
assign ram0[141] = 4'hd0;
assign ram0[142] = 4'hd0;
assign ram0[143] = 4'hd0;
assign ram0[144] = 4'hd0;
assign ram0[145] = 4'hd0;
assign ram0[146] = 4'hd0;
assign ram0[147] = 4'hd0;
assign ram0[148] = 4'hd0;
assign ram0[149] = 4'hd0;
assign ram0[150] = 4'hd0;
assign ram0[151] = 4'hd0;
assign ram0[152] = 4'hd0;
assign ram0[153] = 4'hd0;
assign ram0[154] = 4'hd0;
assign ram0[155] = 4'hd0;
assign ram0[156] = 4'hd0;
assign ram0[157] = 4'hd0;
assign ram0[158] = 4'hd0;
assign ram0[159] = 4'hd0;
assign ram0[160] = 4'hd0;
assign ram0[161] = 4'hd0;
assign ram0[162] = 4'hd0;
assign ram0[163] = 4'hd0;
assign ram0[164] = 4'hd0;
assign ram0[165] = 4'hd0;
assign ram0[166] = 4'hd0;
assign ram0[167] = 4'hd0;
assign ram0[168] = 4'hd0;
assign ram0[169] = 4'hd0;
assign ram0[170] = 4'hd0;
assign ram0[171] = 4'hd0;
assign ram0[172] = 4'hd0;
assign ram0[173] = 4'hd0;
assign ram0[174] = 4'hd0;
assign ram0[175] = 4'hd0;
assign ram0[176] = 4'hd0;
assign ram0[177] = 4'hd0;
assign ram0[178] = 4'hd0;
assign ram0[179] = 4'hd0;
assign ram0[180] = 4'hd0;
assign ram0[181] = 4'hd0;
assign ram0[182] = 4'hd0;
assign ram0[183] = 4'hd0;
assign ram0[184] = 4'hd0;
assign ram0[185] = 4'hd0;
assign ram0[186] = 4'hd0;
assign ram0[187] = 4'hd0;
assign ram0[188] = 4'hd0;
assign ram0[189] = 4'hd0;
assign ram0[190] = 4'hd0;
assign ram0[191] = 4'hd0;
assign ram0[192] = 4'hd0;
assign ram0[193] = 4'hd0;
assign ram0[194] = 4'hd0;
assign ram0[195] = 4'hd0;
assign ram0[196] = 4'hd0;
assign ram0[197] = 4'hd0;
assign ram0[198] = 4'hd0;
assign ram0[199] = 4'hd0;
assign ram0[200] = 4'hd0;
assign ram0[201] = 4'hd0;
assign ram0[202] = 4'hd0;
assign ram0[203] = 4'hd0;
assign ram0[204] = 4'hd0;
assign ram0[205] = 4'hd0;
assign ram0[206] = 4'hd0;
assign ram0[207] = 4'hd0;
assign ram0[208] = 4'hd0;
assign ram0[209] = 4'hd0;
assign ram0[210] = 4'hd0;
assign ram0[211] = 4'hd0;
assign ram0[212] = 4'hd0;
assign ram0[213] = 4'hd0;
assign ram0[214] = 4'hd0;
assign ram0[215] = 4'hd0;
assign ram0[216] = 4'hd0;
assign ram0[217] = 4'hd0;
assign ram0[218] = 4'hd0;
assign ram0[219] = 4'hd0;
assign ram0[220] = 4'hd0;
assign ram0[221] = 4'hd0;
assign ram0[222] = 4'hd0;
assign ram0[223] = 4'hd0;
assign ram0[224] = 4'hd0;
assign ram0[225] = 4'hd0;
assign ram0[226] = 4'hd0;
assign ram0[227] = 4'hd0;
assign ram0[228] = 4'hd0;
assign ram0[229] = 4'hd0;
assign ram0[230] = 4'hd0;
assign ram0[231] = 4'hd0;
assign ram0[232] = 4'hd0;
assign ram0[233] = 4'hd0;
assign ram0[234] = 4'hd0;
assign ram0[235] = 4'hd0;
assign ram0[236] = 4'hd0;
assign ram0[237] = 4'hd0;
assign ram0[238] = 4'hd0;
assign ram0[239] = 4'hd0;
assign ram0[240] = 4'hd0;
assign ram0[241] = 4'hd0;
assign ram0[242] = 4'hd0;
assign ram0[243] = 4'hd0;
assign ram0[244] = 4'hd0;
assign ram0[245] = 4'hd0;
assign ram0[246] = 4'hd0;
assign ram0[247] = 4'hd0;
assign ram0[248] = 4'hd0;
assign ram0[249] = 4'hd0;
assign ram0[250] = 4'hd0;
assign ram0[251] = 4'hd0;
assign ram0[252] = 4'hd0;
assign ram0[253] = 4'hd0;
assign ram0[254] = 4'hd0;
assign ram0[255] = 4'hd0;

assign ram1[0] = 4'hd8;
assign ram1[1] = 4'hd7;
assign ram1[2] = 4'hd6;
assign ram1[3] = 4'hd6;
assign ram1[4] = 4'hd5;
assign ram1[5] = 4'hd5;
assign ram1[6] = 4'hd5;
assign ram1[7] = 4'hd5;
assign ram1[8] = 4'hd4;
assign ram1[9] = 4'hd4;
assign ram1[10] = 4'hd4;
assign ram1[11] = 4'hd4;
assign ram1[12] = 4'hd4;
assign ram1[13] = 4'hd4;
assign ram1[14] = 4'hd4;
assign ram1[15] = 4'hd4;
assign ram1[16] = 4'hd3;
assign ram1[17] = 4'hd3;
assign ram1[18] = 4'hd3;
assign ram1[19] = 4'hd3;
assign ram1[20] = 4'hd3;
assign ram1[21] = 4'hd3;
assign ram1[22] = 4'hd3;
assign ram1[23] = 4'hd3;
assign ram1[24] = 4'hd3;
assign ram1[25] = 4'hd3;
assign ram1[26] = 4'hd3;
assign ram1[27] = 4'hd3;
assign ram1[28] = 4'hd3;
assign ram1[29] = 4'hd3;
assign ram1[30] = 4'hd3;
assign ram1[31] = 4'hd3;
assign ram1[32] = 4'hd2;
assign ram1[33] = 4'hd2;
assign ram1[34] = 4'hd2;
assign ram1[35] = 4'hd2;
assign ram1[36] = 4'hd2;
assign ram1[37] = 4'hd2;
assign ram1[38] = 4'hd2;
assign ram1[39] = 4'hd2;
assign ram1[40] = 4'hd2;
assign ram1[41] = 4'hd2;
assign ram1[42] = 4'hd2;
assign ram1[43] = 4'hd2;
assign ram1[44] = 4'hd2;
assign ram1[45] = 4'hd2;
assign ram1[46] = 4'hd2;
assign ram1[47] = 4'hd2;
assign ram1[48] = 4'hd2;
assign ram1[49] = 4'hd2;
assign ram1[50] = 4'hd2;
assign ram1[51] = 4'hd2;
assign ram1[52] = 4'hd2;
assign ram1[53] = 4'hd2;
assign ram1[54] = 4'hd2;
assign ram1[55] = 4'hd2;
assign ram1[56] = 4'hd2;
assign ram1[57] = 4'hd2;
assign ram1[58] = 4'hd2;
assign ram1[59] = 4'hd2;
assign ram1[60] = 4'hd2;
assign ram1[61] = 4'hd2;
assign ram1[62] = 4'hd2;
assign ram1[63] = 4'hd2;
assign ram1[64] = 4'hd1;
assign ram1[65] = 4'hd1;
assign ram1[66] = 4'hd1;
assign ram1[67] = 4'hd1;
assign ram1[68] = 4'hd1;
assign ram1[69] = 4'hd1;
assign ram1[70] = 4'hd1;
assign ram1[71] = 4'hd1;
assign ram1[72] = 4'hd1;
assign ram1[73] = 4'hd1;
assign ram1[74] = 4'hd1;
assign ram1[75] = 4'hd1;
assign ram1[76] = 4'hd1;
assign ram1[77] = 4'hd1;
assign ram1[78] = 4'hd1;
assign ram1[79] = 4'hd1;
assign ram1[80] = 4'hd1;
assign ram1[81] = 4'hd1;
assign ram1[82] = 4'hd1;
assign ram1[83] = 4'hd1;
assign ram1[84] = 4'hd1;
assign ram1[85] = 4'hd1;
assign ram1[86] = 4'hd1;
assign ram1[87] = 4'hd1;
assign ram1[88] = 4'hd1;
assign ram1[89] = 4'hd1;
assign ram1[90] = 4'hd1;
assign ram1[91] = 4'hd1;
assign ram1[92] = 4'hd1;
assign ram1[93] = 4'hd1;
assign ram1[94] = 4'hd1;
assign ram1[95] = 4'hd1;
assign ram1[96] = 4'hd1;
assign ram1[97] = 4'hd1;
assign ram1[98] = 4'hd1;
assign ram1[99] = 4'hd1;
assign ram1[100] = 4'hd1;
assign ram1[101] = 4'hd1;
assign ram1[102] = 4'hd1;
assign ram1[103] = 4'hd1;
assign ram1[104] = 4'hd1;
assign ram1[105] = 4'hd1;
assign ram1[106] = 4'hd1;
assign ram1[107] = 4'hd1;
assign ram1[108] = 4'hd1;
assign ram1[109] = 4'hd1;
assign ram1[110] = 4'hd1;
assign ram1[111] = 4'hd1;
assign ram1[112] = 4'hd1;
assign ram1[113] = 4'hd1;
assign ram1[114] = 4'hd1;
assign ram1[115] = 4'hd1;
assign ram1[116] = 4'hd1;
assign ram1[117] = 4'hd1;
assign ram1[118] = 4'hd1;
assign ram1[119] = 4'hd1;
assign ram1[120] = 4'hd1;
assign ram1[121] = 4'hd1;
assign ram1[122] = 4'hd1;
assign ram1[123] = 4'hd1;
assign ram1[124] = 4'hd1;
assign ram1[125] = 4'hd1;
assign ram1[126] = 4'hd1;
assign ram1[127] = 4'hd1;
assign ram1[128] = 4'hd0;
assign ram1[129] = 4'hd0;
assign ram1[130] = 4'hd0;
assign ram1[131] = 4'hd0;
assign ram1[132] = 4'hd0;
assign ram1[133] = 4'hd0;
assign ram1[134] = 4'hd0;
assign ram1[135] = 4'hd0;
assign ram1[136] = 4'hd0;
assign ram1[137] = 4'hd0;
assign ram1[138] = 4'hd0;
assign ram1[139] = 4'hd0;
assign ram1[140] = 4'hd0;
assign ram1[141] = 4'hd0;
assign ram1[142] = 4'hd0;
assign ram1[143] = 4'hd0;
assign ram1[144] = 4'hd0;
assign ram1[145] = 4'hd0;
assign ram1[146] = 4'hd0;
assign ram1[147] = 4'hd0;
assign ram1[148] = 4'hd0;
assign ram1[149] = 4'hd0;
assign ram1[150] = 4'hd0;
assign ram1[151] = 4'hd0;
assign ram1[152] = 4'hd0;
assign ram1[153] = 4'hd0;
assign ram1[154] = 4'hd0;
assign ram1[155] = 4'hd0;
assign ram1[156] = 4'hd0;
assign ram1[157] = 4'hd0;
assign ram1[158] = 4'hd0;
assign ram1[159] = 4'hd0;
assign ram1[160] = 4'hd0;
assign ram1[161] = 4'hd0;
assign ram1[162] = 4'hd0;
assign ram1[163] = 4'hd0;
assign ram1[164] = 4'hd0;
assign ram1[165] = 4'hd0;
assign ram1[166] = 4'hd0;
assign ram1[167] = 4'hd0;
assign ram1[168] = 4'hd0;
assign ram1[169] = 4'hd0;
assign ram1[170] = 4'hd0;
assign ram1[171] = 4'hd0;
assign ram1[172] = 4'hd0;
assign ram1[173] = 4'hd0;
assign ram1[174] = 4'hd0;
assign ram1[175] = 4'hd0;
assign ram1[176] = 4'hd0;
assign ram1[177] = 4'hd0;
assign ram1[178] = 4'hd0;
assign ram1[179] = 4'hd0;
assign ram1[180] = 4'hd0;
assign ram1[181] = 4'hd0;
assign ram1[182] = 4'hd0;
assign ram1[183] = 4'hd0;
assign ram1[184] = 4'hd0;
assign ram1[185] = 4'hd0;
assign ram1[186] = 4'hd0;
assign ram1[187] = 4'hd0;
assign ram1[188] = 4'hd0;
assign ram1[189] = 4'hd0;
assign ram1[190] = 4'hd0;
assign ram1[191] = 4'hd0;
assign ram1[192] = 4'hd0;
assign ram1[193] = 4'hd0;
assign ram1[194] = 4'hd0;
assign ram1[195] = 4'hd0;
assign ram1[196] = 4'hd0;
assign ram1[197] = 4'hd0;
assign ram1[198] = 4'hd0;
assign ram1[199] = 4'hd0;
assign ram1[200] = 4'hd0;
assign ram1[201] = 4'hd0;
assign ram1[202] = 4'hd0;
assign ram1[203] = 4'hd0;
assign ram1[204] = 4'hd0;
assign ram1[205] = 4'hd0;
assign ram1[206] = 4'hd0;
assign ram1[207] = 4'hd0;
assign ram1[208] = 4'hd0;
assign ram1[209] = 4'hd0;
assign ram1[210] = 4'hd0;
assign ram1[211] = 4'hd0;
assign ram1[212] = 4'hd0;
assign ram1[213] = 4'hd0;
assign ram1[214] = 4'hd0;
assign ram1[215] = 4'hd0;
assign ram1[216] = 4'hd0;
assign ram1[217] = 4'hd0;
assign ram1[218] = 4'hd0;
assign ram1[219] = 4'hd0;
assign ram1[220] = 4'hd0;
assign ram1[221] = 4'hd0;
assign ram1[222] = 4'hd0;
assign ram1[223] = 4'hd0;
assign ram1[224] = 4'hd0;
assign ram1[225] = 4'hd0;
assign ram1[226] = 4'hd0;
assign ram1[227] = 4'hd0;
assign ram1[228] = 4'hd0;
assign ram1[229] = 4'hd0;
assign ram1[230] = 4'hd0;
assign ram1[231] = 4'hd0;
assign ram1[232] = 4'hd0;
assign ram1[233] = 4'hd0;
assign ram1[234] = 4'hd0;
assign ram1[235] = 4'hd0;
assign ram1[236] = 4'hd0;
assign ram1[237] = 4'hd0;
assign ram1[238] = 4'hd0;
assign ram1[239] = 4'hd0;
assign ram1[240] = 4'hd0;
assign ram1[241] = 4'hd0;
assign ram1[242] = 4'hd0;
assign ram1[243] = 4'hd0;
assign ram1[244] = 4'hd0;
assign ram1[245] = 4'hd0;
assign ram1[246] = 4'hd0;
assign ram1[247] = 4'hd0;
assign ram1[248] = 4'hd0;
assign ram1[249] = 4'hd0;
assign ram1[250] = 4'hd0;
assign ram1[251] = 4'hd0;
assign ram1[252] = 4'hd0;
assign ram1[253] = 4'hd0;
assign ram1[254] = 4'hd0;
assign ram1[255] = 4'hd0;



always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0 = ram0[addr0];
    end
    if (ce1) 
    begin
        q1 = ram0[addr1];
    end
    if (ce2) 
    begin
        q2 = ram1[addr2];
    end
end




endmodule


`timescale 1 ns / 1 ps
module Autocorrelation_bcud(
    reset,
    clk,
    address0,
    ce0,
    q0,
    address1,
    ce1,
    q1,
    address2,
    ce2,
    q2);

parameter DataWidth = 32'd4;
parameter AddressRange = 32'd256;
parameter AddressWidth = 32'd8;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
output[DataWidth - 1:0] q0;
input[AddressWidth - 1:0] address1;
input ce1;
output[DataWidth - 1:0] q1;
input[AddressWidth - 1:0] address2;
input ce2;
output[DataWidth - 1:0] q2;



Autocorrelation_bcud_rom Autocorrelation_bcud_rom_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .q0( q0 ),
    .addr1( address1 ),
    .ce1( ce1 ),
    .q1( q1 ),
    .addr2( address2 ),
    .ce2( ce2 ),
    .q2( q2 ));

endmodule

