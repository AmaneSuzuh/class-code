module sync_stage (
        clk,
        rst,
        din,
        dout
        );
        
    input wire    clk;
    input wire    rst;
    input wire    din;
    input wire    dout;
    
    parameter SYNC_NUM = 2;
    
    reg sync0,sync1;
    
    always@(posedge clk or negedge rst) 
    if(!rst)
    sync0 <= 1'b0;
    else
    sync0 <= din;
    
    always@(posedge clk or negedge rst) 
    if(!rst)
    sync1 <= 1'b0;
    else
    sync1 <= sync0;
    
  generate
  if(SYNC_NUM == 3) begin
  reg sync2 ;
  
    always@(posedge clk or negedge rst) 
    if(!rst)
    sync2 <= 1'b0;
    else
    sync2 <= sync1;
    
    assign dout = sync2;
    end else begin
    assign dout = sync1;
    end
    endgenerate
    endmodule
