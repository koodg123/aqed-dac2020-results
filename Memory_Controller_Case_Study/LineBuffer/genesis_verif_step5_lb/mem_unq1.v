//
//--------------------------------------------------------------------------------
//          THIS FILE WAS AUTOMATICALLY GENERATED BY THE GENESIS2 ENGINE        
//  FOR MORE INFORMATION: OFER SHACHAM (CHIP GENESIS INC / STANFORD VLSI GROUP)
//    !! THIS VERSION OF GENESIS2 IS NOT FOR ANY COMMERCIAL USE !!
//     FOR COMMERCIAL LICENSE CONTACT SHACHAM@ALUMNI.STANFORD.EDU
//--------------------------------------------------------------------------------
//
//  
//	-----------------------------------------------
//	|            Genesis Release Info             |
//	|  $Change: 11904 $ --- $Date: 2013/08/03 $   |
//	-----------------------------------------------
//	
//
//  Source file: /home/jarvis/Documents/memory_core/genesis_new/mem.vp
//  Source template: mem
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
// Parameter wwidth 	= 16
// Parameter dwidth 	= 64
// Parameter ddepth 	= 128
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From Command Line input (priority=4):
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From XML input (priority=3):
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From Config File input (priority=2):
//
// ---------------- End Pre-Generation Pramameters Status Report ----------------

///////////////////////////////////////////////////////////////////
// CGRA Memory Wrapper
// Author: Maxwell Strange
/////////////////////////////////////////////////////////////////
`define xassert(condition, message) if(condition) begin $display(message); $finish(1); end

// dwidth (_GENESIS2_INHERITANCE_PRIORITY_) = 64
//
// ddepth (_GENESIS2_INHERITANCE_PRIORITY_) = 128
//
// wwidth (_GENESIS2_INHERITANCE_PRIORITY_) = 16
//

module mem_unq1 (
  data_out, 
  data_in,
  clk,
  cen,
  wen,
  addr,
  pw_sel
);

output [15:0] data_out;
input [15:0] data_in;
input clk;
input cen;
input wen;
input [8:0] addr;
input [3:0] pw_sel;

wire [15: 0] const_word;
wire [15: 0] const_zero;
assign const_word = ~0;
assign const_zero = 0;

wire [63:0] sel_mask;
//wire [63:0] full_mem_out;


//assign data_out = 
// for(my $j = $numwords-1; $j > 0; $j--) {
//	pw_sel[$j] ? full_mem_out[($j+1)*$wwidth-1:$j*$wwidth] :
// }
//	full_mem_out[$wwidth-1:0];

assign sel_mask = {
	(pw_sel[3] ? const_word : const_zero),
	(pw_sel[2] ? const_word : const_zero),
	(pw_sel[1] ? const_word : const_zero),
	(pw_sel[0] ? const_word : const_zero)
	};


sram_stub_unq1  sram_stub
(
  .Q(data_out),
  .CLK(clk),
  .CEN(~cen),
  .WEN(~wen),
  .A(addr),
  .D(data_in),
  .EMA(3'd0),
  .EMAW(2'd0),
  .EMAS(1'b0),
  .TEN(1'b1),
  .BEN(1'b1),
  .RET1N(1'b1),
  .STOV(1'b0)
);

/*

// Instance of mem module
TS1N16FFCLLSBLVTC128X64M4SW m (
  .CLK(clk), // Clock - 1
  .CEB(~cen), // Chip Enable (low) - 1
  .WEB(~wen), // Write Enable (low) - 1
  .A(addr), 
  .D(data_in),
  .BWEB(sel_mask),
  .Q(full_mem_out),
  .RTSEL(2'b00),
  .WTSEL(2'b00)
  );
*/


endmodule

