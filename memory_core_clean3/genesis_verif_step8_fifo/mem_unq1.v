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
//  Source file: /media/saranyu/Share/SF/garnet-master/memory_core/genesis_new/mem.vp
//  Source template: mem
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
// Parameter ddepth 	= 512
// Parameter dwidth 	= 16
// Parameter wwidth 	= 16
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

// dwidth (_GENESIS2_INHERITANCE_PRIORITY_) = 16
//
// ddepth (_GENESIS2_INHERITANCE_PRIORITY_) = 0x200
//
// wwidth (_GENESIS2_INHERITANCE_PRIORITY_) = 16
//

module mem_unq1 (
  data_out, 
  data_in,
  clk,
  cen,
  wen,
  addr
);

output [15:0] data_out;
input [15:0] data_in;
input clk;
input cen;
input wen;
input [8:0] addr;

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
TS1N16FFCLLSBLVTC512X16M8S m (
  // Main interface
  .CLK(clk), // Clock - 1
  .CEB(~cen), // Chip Enable (low) - 1
  .WEB(~wen), // Write Enable (low) - 1
  .A(addr), 
  .D(data_in),
  .Q(data_out),
  // Testing interface (unused)
  .RTSEL(2'b00),
  .WTSEL(2'b00)
  );
*/

endmodule
