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
//  Source file: /media//Share/SF/garnet-master/memory_core/genesis_new/memory_core.svp
//  Source template: memory_core
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
//
//		---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
//
//	From Command Line input (priority=4):
// Parameter ddepth 	= 512
// Parameter iterator_support 	= 6
// Parameter bbanks 	= 2
// Parameter wwidth 	= 16
// Parameter dwidth 	= 16
// Parameter use_sram_stub 	= 1
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

// ========================================================
// CGRA memory core
// ========================================================
`define xassert(condition, message) if(condition) begin $display(message); $finish(1); end

// dwidth (_GENESIS2_CMD_LINE_PRIORITY_) = 16
//
// bbanks (_GENESIS2_CMD_LINE_PRIORITY_) = 2
//
// ddepth (_GENESIS2_CMD_LINE_PRIORITY_) = 0x200
//
// wwidth (_GENESIS2_CMD_LINE_PRIORITY_) = 16
//
// iterator_support (_GENESIS2_CMD_LINE_PRIORITY_) = 6
//

// ========================================================
// Module Definition
// ========================================================
module memory_core(
   clk, 
   clk_en, 
   reset, 
   flush, 

   addr_in,
   data_in, 
   data_out, 
   wen_in, 
   ren_in, 
   valid_out, 

   chain_in,
   chain_out,
   chain_wen_in,
   chain_valid_out,

   full,//
   empty,//
   almost_full, 
   almost_empty, 

   switch_db,

   config_addr, 
   config_data, 
   config_read, 
   config_write, 
   config_en_sram, 
   read_data_sram_0,
   read_data_sram_1,
   read_data_sram_2,
   read_data_sram_3,

   read_config_data,
   // Config
   stencil_width,
   read_mode,
   arbitrary_addr,
   starting_addr,
   iter_cnt,
   dimensionality,
   stride_0,
   stride_1,
   stride_2,
   stride_3,
   stride_4,
   stride_5,
  range_0,
  range_1,
  range_2,
  range_3,
  range_4,
  range_5,
   circular_en,

   almost_count,
   enable_chain,
   mode,
   tile_en,
   depth,
   chain_idx

);


// ALL CONFIG
input logic [31:0] stencil_width;
input logic        read_mode;
input logic        arbitrary_addr;
input logic [31:0] starting_addr;
input logic [31:0] iter_cnt;
input logic [31:0] dimensionality;
input logic [31:0] stride_0;
input logic [31:0] stride_1;
input logic [31:0] stride_2;
input logic [31:0] stride_3;
input logic [31:0] stride_4;
input logic [31:0] stride_5;
input logic [31:0] range_0;
input logic [31:0] range_1;
input logic [31:0] range_2;
input logic [31:0] range_3;
input logic [31:0] range_4;
input logic [31:0] range_5;
input logic circular_en;
input logic  [3:0]      almost_count;
input logic             enable_chain;
input logic  [1:0]      mode;
input logic             tile_en;
input logic  [3:0]      chain_idx;
input logic  [15:0]     depth;

// ========================================================
// Inputs and Outputs
// ========================================================
logic [31:0] stride [5:0];
logic [31:0] range [5:0];
// Clock + Reset
input clk;
input clk_en;
input reset;
input flush;
// Normal Ports
input [15:0] addr_in;
input [15:0] data_in;
input wen_in;
input ren_in;
output logic [15:0] data_out;
output logic valid_out;
// Chaining
input logic [15:0] chain_in;
output [15:0] chain_out;
output chain_valid_out;
input chain_wen_in;
// db switch
input logic switch_db;
// Status
output logic almost_full;
output logic almost_empty;
output logic full;//
output logic empty;//


// Config port for SRAM features (1-4)
input logic [31:0] config_addr;
input logic [31:0] config_data;
input logic config_read;
input logic config_write;
input logic [3:0] config_en_sram;

output logic [31:0] read_config_data;
//
output logic [31:0] read_data_sram_0;
output logic [31:0] read_data_sram_1;
output logic [31:0] read_data_sram_2;
output logic [31:0] read_data_sram_3;
//
logic [8:0] lb_addr [1:0];
logic [15:0] lb_mem_data_out [1:0];
logic [1:0] lb_wen;
logic [1:0] lb_cen;
logic lb_valid_out;
logic ren_lb_to_fifo;
//
logic [8:0] fifo_addr [1:0];
logic [15:0] fifo_mem_data_out [1:0];
logic [15:0] fifo_out;
logic [1:0] fifo_wen;
logic [1:0] fifo_cen;
logic fifo_almost_full;
logic fifo_almost_empty;
logic fifo_valid_out;
logic fifo_full;
logic fifo_empty;
logic [12:0] num_words_mem_fifo_to_lb;
//
logic [8:0] sram_addr [1:0];
logic [15:0] sram_mem_data_out [1:0];
logic [15:0] sram_out;
logic [1:0] sram_wen;
logic [1:0] sram_cen;
//
logic [8:0] db_addr [1:0];
logic [15:0] db_mem_data_out [1:0];
logic [15:0] db_out;
logic [1:0] db_wen;
logic [1:0] db_cen;
logic db_valid_out;

logic [15:0] mem_data_out [1:0];
logic  [15:0]  mem_data_in [1:0];
logic  [8:0] mem_addr [1:0];
logic  [1:0] mem_ren;
logic  [1:0] mem_wen;

logic gclk_sram;

logic wen_in_int;
logic [15:0] data_in_int;
// ========================================================
// Configuration
// ========================================================
logic             gclk;
logic             gclk_in;

logic [0:0] sram_sel;

logic [1:0] mem_cen;
logic  [1:0] mem_cen_int;


assign stride[0] = stride_0;
assign stride[1] = stride_1;
assign stride[2] = stride_2;
assign stride[3] = stride_3;
assign stride[4] = stride_4;
assign stride[5] = stride_5;
assign range[0] = range_0; 
assign range[1] = range_1; 
assign range[2] = range_2; 
assign range[3] = range_3; 
assign range[4] = range_4; 
assign range[5] = range_5; 

// ========================================================
// No more wire declarations after this 
// ========================================================

assign gclk_in = (tile_en==1'b1) ? clk : 1'b0;
assign gclk = clk_en ? gclk_in : 1'b0;
// TODO
assign read_config_data = 1'b0;
// ========================================================
// Chaining - basically changes data in/data out/valid/wen
// ========================================================
assign data_in_int = (enable_chain) ? chain_in : data_in;
assign wen_in_int = (enable_chain) ? chain_wen_in : wen_in;
assign chain_out = (enable_chain & chain_wen_in) ? chain_in : data_out;
assign chain_valid_out = valid_out;

// ========================================================
// Do all the functional modes
// ========================================================
always @(*) begin

   read_data_sram_0 = { 16'b0, //'
		mem_data_out[0]}; 
   read_data_sram_1 = { 16'b0, //'
		mem_data_out[0]}; 
   read_data_sram_2 = { 16'b0, //'
		mem_data_out[1]}; 
   read_data_sram_3 = { 16'b0, //'
		mem_data_out[1]}; 

  if(config_en_sram != 1'b0) begin

      mem_cen_int[0] = 1'b1; //' 
      mem_cen_int[1] = 1'b1; //' 
      mem_wen[0] =  (config_write & (
                      config_en_sram[1] |
                      config_en_sram[0]));
      mem_wen[1] =  (config_write & (
                      config_en_sram[3] |
                      config_en_sram[2]));

      mem_ren[0] =  (config_read & (
                      config_en_sram[1] |
                      config_en_sram[0]));
      mem_ren[1] =  (config_read & (
                      config_en_sram[3] |
                      config_en_sram[2]));

      // TODO     
      mem_addr[0] = {(config_en_sram[3] | config_en_sram[1]), config_addr[31:24]};
      mem_addr[1] = {(config_en_sram[3] | config_en_sram[1]), config_addr[31:24]};
      mem_data_in[0] = config_data[15:0];
      mem_data_in[1] = config_data[15:0];

      data_out = mem_data_out[sram_sel];
      valid_out = 1'b0; 
      almost_full = 1'b0; 
      almost_empty = 1'b0; 
      full = 1'b0;// 
      empty = 1'b0;// 


   end

   else begin
   case (mode)

   // ========================================================
   // LINE BUFFER MODE
   // ========================================================
   2'd0: begin 
      mem_cen_int = fifo_cen;
      mem_wen = fifo_wen;
      mem_ren = {2{1'b1}};
      mem_addr = fifo_addr;
      mem_data_in = fifo_mem_data_out;
      data_out = fifo_out; 
      valid_out = lb_valid_out; //& wen_in_int;
      almost_full = fifo_almost_full;
      almost_empty = fifo_almost_empty;
      full = fifo_full;//
      empty = fifo_empty;//
   end

   // ========================================================
   // FIFO MODE
   // ========================================================
   2'd1: begin 
      mem_cen_int = fifo_cen;
      mem_wen = fifo_wen;
      //mem_ren = fifo_ren;
      mem_ren = {2{1'b1}};
      mem_addr = fifo_addr;
      mem_data_in = fifo_mem_data_out;
      data_out = fifo_out;
      valid_out = fifo_valid_out;//
      almost_full = fifo_almost_full;
      almost_empty = fifo_almost_empty;
      full = fifo_full;//
      empty = fifo_empty;//
   end

   // ========================================================
   // SRAM/LUT MODE
   // ========================================================
   2'd2: begin 
      mem_cen_int = sram_cen;
      mem_wen = sram_wen;
      //mem_ren = sram_ren;
      mem_ren = {2{1'b1}};
      mem_addr = sram_addr;
      mem_data_in = sram_mem_data_out;
      data_out = sram_out;
      valid_out = 1'b1;
      almost_full = 1'b0;
      almost_empty = 1'b0;
      full = 1'b0;// 
      empty = 1'b0;// 
  end

   // ========================================================
   // DOUBLE BUFFER MODE
   // ========================================================
   2'd3: begin 
      mem_cen_int = db_cen;
      mem_wen = db_wen;
      //mem_ren = sram_ren;
      mem_ren = {2{1'b1}};
      mem_addr = db_addr;
      mem_data_in = db_mem_data_out;
      data_out = (enable_chain & chain_wen_in) ? chain_in : db_out;
      valid_out = db_valid_out;
      almost_full = 1'b0;
      almost_empty = 1'b0;
      full = 1'b0;// 
      empty = 1'b0;// 
  end

   // ========================================================
   // DEFAULT MODE
   // ========================================================
   default: begin
      mem_data_in[0] = 0; 
      mem_data_in[1] = 0; 
      mem_cen_int = ~0;
      mem_wen = 0;
      mem_ren = 0;
      mem_addr[0] = 0; 
      mem_addr[1] = 0; 
      data_out = 0; 
      valid_out = 1'b0; 
      almost_full = 1'b0; 
      almost_empty = 1'b0; 
      full = 1'b0;// 
      empty = 1'b0;// 
  end

   endcase
   end //else
end // END ALWAYS

// ========================================================
// Select a specific SRAM (from previous cycle)
// ========================================================
always @(posedge gclk) begin
  sram_sel <= addr_in[9:9];
end

// ========================================================
// Basically gate the memory CEN
// ========================================================
assign mem_cen[0] = mem_cen_int[0] & ( mem_wen[0] | mem_ren[0]);
assign mem_cen[1] = mem_cen_int[1] & ( mem_wen[1] | mem_ren[1]);

// ========================================================
// Instantiate (Row) LineBuffer
// ========================================================
linebuffer_control_unq1  linebuffer_control
(
.clk(gclk),
.clk_en(1'b1), 
.reset(reset),
.flush(flush),
.wen(wen_in_int),

.depth(depth),
.valid(lb_valid_out),

.num_words_mem(num_words_mem_fifo_to_lb),
.ren_to_fifo(ren_lb_to_fifo),
.stencil_width(stencil_width)
);

// ========================================================
// Instantiate FIFO 
// ========================================================
fifo_control_unq1  fifo_control
(
.clk(gclk),
.clk_en(clk_en), 
.reset(reset),
.flush(flush),
.ren((mode == 2'b01) ? ren_in : ren_lb_to_fifo),
.wen(wen_in_int),
.data_in(data_in_int),
.data_out(fifo_out),
.almost_empty(fifo_almost_empty),
.almost_full(fifo_almost_full),
.empty(fifo_empty),//
.full(fifo_full),
.valid(fifo_valid_out),//
.depth(depth),
.fifo_to_mem_data(fifo_mem_data_out),
.fifo_to_mem_cen(fifo_cen),
.fifo_to_mem_wen(fifo_wen),
.fifo_to_mem_addr(fifo_addr),
.mem_to_fifo_data(mem_data_out),
.num_words_mem(num_words_mem_fifo_to_lb),

.almost_count(almost_count),
.circular_en(circular_en)
);

// ========================================================
// Instantiate SRAM Controller
// ========================================================
sram_control_unq1  sram_control
(
.clk(gclk),
.clk_en(1'b1),
.reset(reset),
.flush(flush),

.data_in(data_in_int),
.wen(wen_in_int),
.data_out(sram_out),
.ren(ren_in),
.addr_in(addr_in),

.sram_to_mem_data(sram_mem_data_out),
.sram_to_mem_cen(sram_cen),
.sram_to_mem_wen(sram_wen),
.sram_to_mem_addr(sram_addr),
.mem_to_sram_data(mem_data_out)
);

// ========================================================
// Instantiate Double Buffer
// ========================================================
doublebuffer_control_unq1  doublebuffer_control
(
.clk(gclk),
.clk_en(1'b1), 
.reset(reset),
.flush(flush),
.wen(wen_in),
.ren(ren_in),
.data_in(data_in),
.data_out(db_out),

.doublebuffer_data_in(db_mem_data_out),// to mem
.doublebuffer_cen_mem(db_cen),
.doublebuffer_wen_mem(db_wen),
.doublebuffer_addr_mem(db_addr),
.doublebuffer_data_out(mem_data_out),

.addr_in(addr_in),

.depth(depth),
.valid(db_valid_out),
.switch(switch_db),
.chain_en(enable_chain),
.chain_idx(chain_idx),

.read_mode(read_mode),
.arbitrary_addr(arbitrary_addr),
.starting_addr(starting_addr),
.iter_cnt(iter_cnt),
.dimensionality(dimensionality),
.stride(stride),
.range(range)

);

// ========================================================
// Instantiate memory banks
// ========================================================
assign gclk_sram = (clk_en | (|config_en_sram)) ? gclk_in : 1'b0;
   mem_unq1  mem_inst0
   (
   .data_out(mem_data_out[0]),
   .data_in(mem_data_in[0]),
   .clk(gclk_sram),
   .cen(mem_cen[0]),
   .wen(mem_wen[0]),
   .addr(mem_addr[0])
   );
   mem_unq1  mem_inst1
   (
   .data_out(mem_data_out[1]),
   .data_in(mem_data_in[1]),
   .clk(gclk_sram),
   .cen(mem_cen[1]),
   .wen(mem_wen[1]),
   .addr(mem_addr[1])
   );

endmodule
