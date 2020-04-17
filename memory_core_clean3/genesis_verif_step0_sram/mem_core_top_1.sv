

// ------------------------------------------------------------------
//  Design Unit:    AQED_Adder_top
// ------------------------------------------------------------------

module mem_core_top (
    clk, reset, data_in, exec_dup, wen_in
);
logic [15:0] stencil_width;
logic        arbitrary_addr;
logic [15:0] starting_addr;
logic [31:0] iter_cnt;
logic [3:0]  dimensionality;
logic        rate_matched;   
logic [15:0] stride_0;
logic [15:0] stride_1;
logic [15:0] stride_2;
logic [15:0] stride_3;
logic [15:0] stride_4;
logic [15:0] stride_5;
logic [31:0] range_0;
logic [31:0] range_1;
logic [31:0] range_2;
logic [31:0] range_3;
logic [31:0] range_4;
logic [31:0] range_5;
logic circular_en;
logic  [3:0]      almost_count;
logic             enable_chain;
logic  [1:0]      mode;
logic             tile_en;
logic  [3:0]      chain_idx;
logic  [15:0]     depth;


  input logic clk;
  input logic reset;
  input logic exec_dup;
  input logic wen_in;
  input logic [15:0] data_in;

logic clk_en;
logic flush;
// Normal Ports
logic [15:0] addr_in;
logic ren_in;
logic [15:0] data_out;
logic [15:0] data_out_in;
logic valid_out;
// Chaining
logic [15:0] chain_in;
logic [15:0] chain_out;
logic chain_valid_out;
logic chain_wen_in;
// db switch
logic switch_db;
// Status
logic almost_full;
logic almost_empty;
logic full;
logic empty;
// Config port for SRAM features (1-4)
logic [31:0] config_addr;
logic [31:0] config_data;
logic config_read;
logic config_write;
logic [3:0] config_en_sram;
logic [31:0] read_config_data;
//
logic [31:0] read_data_sram_0;
logic [31:0] read_data_sram_1;
logic [31:0] read_data_sram_2;
logic [31:0] read_data_sram_3;
 
memory_core DUT(
   .clk(clk), 
   .clk_en(clk_en), 
   .reset(reset), 
   .flush(flush), 

   .addr_in(addr_in),
   .data_in(data_out), 
   .data_out(data_out_in), 
   .wen_in(wen_in), 
   .ren_in(ren_in), 
   .valid_out(valid_out), 

   .chain_in(chain_in),
   .chain_out(chain_out),
   .chain_wen_in(chain_wen_in),
   .chain_valid_out(chain_valid_out),

//   .full(full),
//   .empty(empty),
   .almost_full(almost_full), 
   .almost_empty(almost_empty), 

   .switch_db(switch_db),
 .rate_matched(rate_matched),

   .config_addr(config_addr), 
   .config_data(config_data), 
   .config_read(config_read), 
   .config_write(config_write), 
   .config_en_sram(config_en_sram), 
   .read_data_sram_0(read_data_sram_0),
   .read_data_sram_1(read_data_sram_1),
   .read_data_sram_2(read_data_sram_2),
   .read_data_sram_3(read_data_sram_3),
   .read_config_data(read_config_data),
   .stencil_width(stencil_width),
   .arbitrary_addr(arbitrary_addr),
   .starting_addr(starting_addr),
   .iter_cnt(iter_cnt),
   .dimensionality(dimensionality),
   .stride_0(stride_0),
   .stride_1(stride_1),
   .stride_2(stride_2),
   .stride_3(stride_3),
   .stride_4(stride_4),
   .stride_5(stride_5),
  .range_0(range_0),
  .range_1(range_1),
  .range_2(range_2),
  .range_3(range_3),
  .range_4(range_4),
  .range_5(range_5),
  .circular_en(circular_en),
  .almost_count(almost_count),
  .enable_chain(enable_chain),
  .mode(mode),
  .tile_en(tile_en),
  .depth(depth),
  .chain_idx(chain_idx)
);

aqed aqed(.clk(clk), .clk_en(clk_en), .reset(reset), .flush(flush), .exec_dup(exec_dup), .data_in(data_in), .addr_in(addr_in), .valid_out(valid_out), .ren_in(ren_in), .data_out(data_out), .data_out_in(data_out_in), .wen_in(wen_in), .qed_done(qed_done), .qed_check(qed_check));




   assert_qed_match : assert property (
       @(posedge clk)
         (qed_done |-> qed_check));
   cover_seq_10 : cover property (
      @(posedge clk)
          aqed.seq_pointer > 10);
 
   cover_insert : cover property (
       @(posedge clk)
          aqed.insert_cond == 1'b1);

   cover_delete : cover property (
       @(posedge clk)
          aqed.delete_cond == 1'b1);
  
   cover_wen : cover property (
       @(posedge clk)
          DUT.doublebuffer_control.wen == 1'b0 && DUT.doublebuffer_control.write_done_thresh == 1'b0 && DUT.doublebuffer_control.write_in_range==1'b0 && DUT.doublebuffer_control.depth!=0);

   cover_wen_2 : cover property (
       @(posedge clk)
          DUT.doublebuffer_control.wen == 1'b1 && DUT.doublebuffer_control.write_done_thresh == 1'b1 && DUT.doublebuffer_control.write_in_range==1'b0 && DUT.doublebuffer_control.depth!=0);



   db : assume property ( @(posedge clk)
   ( ((flush==1'b0) && (arbitrary_addr==1'b1) && (chain_wen_in == 1'b0) && (config_addr == 32'h0) && (config_data == 32'h0)&& (stride_0 == 16'h0001) && (stride_1 == 16'h0003) && (stride_2 == 16'h0009) && (stride_3 == 16'h0) && (stride_4 == 16'h0) && (stride_5 == 16'h0) && (range_0 == 32'h0000_0003) && (range_1 == 32'h0000_0003) && (range_2 == 32'h0000_0003) && (range_3 == 32'h0000_0001) && (range_4 == 32'h0000_0001) && (range_5 == 32'h0000_0001) && (config_read == 1'b0) && (config_write == 1'b0) && (config_en_sram == 4'h0) && (stencil_width == 16'h0) && (circular_en == 1'b0) && (almost_count == 4'h0) && (enable_chain == 1'b0) && (mode == 2'h2) && (tile_en == 1'b1) && (chain_idx == 4'h0) && (starting_addr==15'h0))));

no_hazard: assume property( @(posedge clk) (((~aqed.orig_issued) | (addr_in!=aqed.orig_val)) & ((~aqed.dup_issued) | (addr_in!=aqed.dup_val))) ); 


//assign dimensionality = |(stride_0) + |(stride_1) + |(stride_2) + |(stride_3) + |(stride_4) + |(stride_5);

endmodule

