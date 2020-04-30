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
//  Source file: /home/jarvis/Documents/memory_core/genesis_new/doublebuffer_control.svp
//  Source template: doublebuffer_control
//
// --------------- Begin Pre-Generation Parameters Status Report ---------------
//
//	From 'generate' statement (priority=5):
// Parameter iterator_support 	= 8
// Parameter wwidth 	= 16
// Parameter dwidth 	= 64
// Parameter ddepth 	= 128
// Parameter bbanks 	= 2
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

// dwidth (_GENESIS2_INHERITANCE_PRIORITY_) = 64
//
// wwidth (_GENESIS2_INHERITANCE_PRIORITY_) = 16
//
// ddepth (_GENESIS2_INHERITANCE_PRIORITY_) = 128
//
// bbanks (_GENESIS2_INHERITANCE_PRIORITY_) = 2
//
// iterator_support (_GENESIS2_INHERITANCE_PRIORITY_) = 8
//

module doublebuffer_control_unq1(

   clk,
   clk_en,
   reset,
   flush,
   ren,
   wen,
   data_in,
   data_out,

   doublebuffer_data_in,
   doublebuffer_cen_mem,
   doublebuffer_wen_mem,
   doublebuffer_addr_mem,
   doublebuffer_data_out,

   addr_in,

   depth,
   valid,
   switch,

   chain_en,
   chain_idx,

   read_mode,
   arbitrary_addr,
   starting_addr,
   iter_cnt,
   dimensionality,
   stride,
   range
);


// =============================================
// Depth or Ping Pong In Configuration
// =============================================
input logic       chain_en;
input logic [3:0] chain_idx;

// ==============================================
// I/O
// ==============================================
input logic                   clk;
input logic                   clk_en;
input logic                   reset;

input logic                   switch;

input logic read_mode;
input logic  arbitrary_addr;
input logic [31:0] starting_addr; 
input logic [31:0] iter_cnt;
input logic [31:0] dimensionality;
input logic [31:0] stride [7:0];
input logic [31:0] range [7:0];

input logic                   flush;
input logic                   wen;
input logic                   ren;
input logic  [15:0]  data_in;
output logic [15:0]  data_out;
input logic [15:0] addr_in;

output logic [15:0]  doublebuffer_data_in  [1:0];
output logic [1:0]  doublebuffer_cen_mem;
output logic [1:0]  doublebuffer_wen_mem;
output logic [8:0]  doublebuffer_addr_mem [1:0];
input logic  [15:0]  doublebuffer_data_out [1:0];


input logic [12:0]            depth;
output logic                   valid;

// ==============================================
// Internal
// ==============================================
logic init_state;
logic  [12:0]                  depth_int;

logic [8:0] addr;
assign addr = addr_in[8:0];

logic ping_npong;

logic [15:0] read_addr;
logic [15:0] write_addr;

logic [31:0] dim_counter [7:0]; 

// ==============================================
// Configuration
// ==============================================

logic                  update [7:0];
logic  [15:0] data_out_logic;
logic [15:0] strt_addr;

assign strt_addr = starting_addr[16:0];

logic ren_cnt;

logic [31:0] read_cnt;

logic [15:0] firstn [1:0];
logic take_the_flop;

logic autoswitch;
logic read_done;
logic write_done;
logic write_done_d1;

assign autoswitch = (~read_mode & ~arbitrary_addr) ? write_done & (read_done | init_state) : 0;

always @ (posedge clk, posedge reset) begin
    if(reset) begin
        data_out_logic <= 0;
    end
    else if(switch | autoswitch)begin
        data_out_logic <= data_out;
    end
end

always @ (posedge clk, posedge reset) begin
    if(reset) begin
        read_done <= 1'b1;
        write_done <= 0;
        write_done_d1 <= 0;
    end
    else if(switch | autoswitch) begin
        read_done <= 1'b0;
        write_done <= 0;
        write_done_d1 <= 0;
    end
    else begin
        if(write_addr == (depth - 2)) begin
            write_done <= 1;
        end
        if(read_cnt == (iter_cnt - 2)) begin
            read_done <= 1;
        end
        write_done_d1 <= write_done;
    end
end

logic write_gate;
assign write_gate = write_addr[12:9] == chain_idx;
logic next_valid;

// valid only used in chaining for db? timing is sorta irrelevant
assign next_valid = read_addr[12:9] == chain_idx;

always @ (posedge clk, posedge reset) begin
    if(reset) begin
        valid <= 0;
    end
    else begin
        valid <= next_valid & ((~init_state) | switch | autoswitch);
    end
end


always @(*) begin

  // Data to memory is just da, n
  doublebuffer_data_in[0] = data_in;
  doublebuffer_data_in[1] = data_in;

  doublebuffer_cen_mem[0] = ((wen & read_mode) | ~init_state | switch | autoswitch | (ren & read_mode) | ~read_mode);
  doublebuffer_cen_mem[1] = ((wen & read_mode) | ~init_state | switch | autoswitch | (ren & read_mode) | ~read_mode);
  doublebuffer_wen_mem[0] = (ping_npong == 0) & ((wen & read_mode) | (~read_mode & ~write_done_d1)) & (write_gate);
  doublebuffer_wen_mem[1] = (ping_npong == 1) & ((wen & read_mode) | (~read_mode & ~write_done_d1)) & (write_gate);
  doublebuffer_addr_mem[0] = (ping_npong == 0) ? write_addr : read_addr;
  doublebuffer_addr_mem[1] = (ping_npong == 1) ? write_addr : read_addr;
  // select proper data - 
  data_out = take_the_flop ? firstn[~ping_npong] : doublebuffer_data_out[~ping_npong];
  
  read_addr = (arbitrary_addr) ? addr :  
   ((7 < dimensionality) ? (dim_counter[7] * stride[7]) : 0) +
   ((6 < dimensionality) ? (dim_counter[6] * stride[6]) : 0) +
   ((5 < dimensionality) ? (dim_counter[5] * stride[5]) : 0) +
   ((4 < dimensionality) ? (dim_counter[4] * stride[4]) : 0) +
   ((3 < dimensionality) ? (dim_counter[3] * stride[3]) : 0) +
   ((2 < dimensionality) ? (dim_counter[2] * stride[2]) : 0) +
   ((1 < dimensionality) ? (dim_counter[1] * stride[1]) : 0) +
    (dim_counter[0] * stride[0]) + strt_addr;

  // Update iterator when the previous one will update and flow over
  update[7] = (((dim_counter[6]+1) % range[6]) == 0) & update[6];
  update[6] = (((dim_counter[5]+1) % range[5]) == 0) & update[5];
  update[5] = (((dim_counter[4]+1) % range[4]) == 0) & update[4];
  update[4] = (((dim_counter[3]+1) % range[3]) == 0) & update[3];
  update[3] = (((dim_counter[2]+1) % range[2]) == 0) & update[2];
  update[2] = (((dim_counter[1]+1) % range[1]) == 0) & update[1];
  update[1] = (((dim_counter[0]+1) % range[0]) == 0) & update[0];
  // Innermost loop always updated
  update[0] = ~init_state;

end

always @(posedge clk, posedge reset) begin
  if (reset) begin
    firstn[0] <= 0;
    firstn[1] <= 0;
  end
  else begin
    if ((write_addr == strt_addr) & wen) begin
      firstn[0] <= (~ping_npong) ? data_in : firstn[0];
      firstn[1] <= (ping_npong) ? data_in : firstn[1];
    end
  end
end

always @(posedge clk, posedge reset) begin
    if (reset) begin
        ren_cnt <= 0;
    end
    else begin
        if(take_the_flop & ren) begin
            ren_cnt <= ren_cnt + 1;
        end
    end
end


always @(posedge clk, posedge reset) begin
  if (reset) begin 
    dim_counter[0] <= 0;
    dim_counter[1] <= 0;
    dim_counter[2] <= 0;
    dim_counter[3] <= 0;
    dim_counter[4] <= 0;
    dim_counter[5] <= 0;
    dim_counter[6] <= 0;
    dim_counter[7] <= 0;
    depth_int <= 0;
    init_state <= 1'b1;
    ping_npong <= 0;
    write_addr <= 0;
    take_the_flop <= 0;
    read_cnt <= 0;
  end
  else begin
    depth_int <= depth;
  
    // When we switch for the first time (and all times), the valid becomes 1 because good data is at the output
    // Start over write and read addr, switch buffer (ping or pong)
    // and kill counters
    if(switch | autoswitch) begin // Or if configged to trigger on depth
      ping_npong <= ~ping_npong;
      read_cnt <= 0;
      write_addr <= 0;
      init_state <= 0;
      take_the_flop <= ~arbitrary_addr;
      dim_counter[1] <= 0;
      dim_counter[2] <= 0;
      dim_counter[3] <= 0;
      dim_counter[4] <= 0;
      dim_counter[5] <= 0;
      dim_counter[6] <= 0;
      dim_counter[7] <= 0;
      dim_counter[0] <= 1 % range[0]; 
    end
    else begin
      // ===================
      // ADDRS
      // ===================
      if(take_the_flop) begin
        // If in auto mode - just turn it off
        if(~read_mode) begin
          take_the_flop <= 0;
        end
        else begin
          if(ren_cnt & ren) begin
            take_the_flop <= 0;
          end 
        end
        // If in read mode - want to kill it once we get the second ren
      end

      // Increment write_addr on wen
      if ((wen)) begin
      //if ((wen & read_mode) | (~write_done & ~read_mode)) begin
        write_addr <= (write_addr + 1); 
      end
      // Once we expect data to start spilling out, we start moving the read_addr - move is based on counters
      if (~init_state & ((~read_mode & ~read_done) | (read_mode & ((ren & ~take_the_flop) | (ren & take_the_flop & ren_cnt))))) begin
        read_cnt <= read_cnt + 1;
        dim_counter[7] <= (update[7]) ? ((dim_counter[7] + 1) % range[7]) : dim_counter[7]; 
        dim_counter[6] <= (update[6]) ? ((dim_counter[6] + 1) % range[6]) : dim_counter[6]; 
        dim_counter[5] <= (update[5]) ? ((dim_counter[5] + 1) % range[5]) : dim_counter[5]; 
        dim_counter[4] <= (update[4]) ? ((dim_counter[4] + 1) % range[4]) : dim_counter[4]; 
        dim_counter[3] <= (update[3]) ? ((dim_counter[3] + 1) % range[3]) : dim_counter[3]; 
        dim_counter[2] <= (update[2]) ? ((dim_counter[2] + 1) % range[2]) : dim_counter[2]; 
        dim_counter[1] <= (update[1]) ? ((dim_counter[1] + 1) % range[1]) : dim_counter[1]; 
        dim_counter[0] <= (dim_counter[0] + 1) % range[0]; 
      end
    end
  // else
  end
// always  
end

endmodule
