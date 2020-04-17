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
//  Source file: /media/saranyu/Share/SF/garnet-master/memory_core/genesis_new/linebuffer_control.svp
//  Source template: linebuffer_control
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
// Parameter bbanks 	= 2
// Parameter wwidth 	= 16
// Parameter dwidth 	= 16
// Parameter ddepth 	= 512
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
// CGRA memory generator
//////////////////////////////////////////////////////////////////
`define xassert(condition, message) if(condition) begin $display(message); $finish(1); end

// dwidth (_GENESIS2_INHERITANCE_PRIORITY_) = 16
//
// wwidth (_GENESIS2_INHERITANCE_PRIORITY_) = 16
//
// ddepth (_GENESIS2_INHERITANCE_PRIORITY_) = 0x200
//
// bbanks (_GENESIS2_INHERITANCE_PRIORITY_) = 2
//

module linebuffer_control_unq1(

   clk,
   clk_en,
   reset,
   flush,
   wen,

   stencil_width,
   depth,
   valid,
   num_words_mem,
   ren_to_fifo

);

input logic                 clk;
input logic                 clk_en;
input logic                 reset;
input logic                 flush;
input logic                 wen;

input logic [31:0]          stencil_width;
input logic [12:0]          depth;
output logic                valid;
input logic [12:0]          num_words_mem;
output logic                ren_to_fifo;

// Is this the last line in the thing? Valid_out should be gated based on the stencil
logic [31:0] vg_ctr;
logic valid_gate;

assign valid_gate = (stencil_width == 0) ? 1 : vg_ctr >= (stencil_width - 1); 
assign valid = valid_gate & (num_words_mem == depth) & wen & (depth > 0); 
assign ren_to_fifo = (num_words_mem >= (depth - 1)) & wen & (depth > 0);

always @(posedge clk, posedge reset) begin
    if(reset) begin
       vg_ctr <= 0; 
    end
    else begin
        if (flush) begin
            vg_ctr <= 0;
        end
        else begin
          if(valid) begin
              vg_ctr <= (vg_ctr + 1) % depth;
          end
        end
    end
end 

endmodule
