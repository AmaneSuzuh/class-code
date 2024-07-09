`timescale 1ns / 1ns

module my_tb( );

reg clk;
reg reset_n;
reg [7:0]data;
reg send_en;
reg [3:0]baud_set;


wire uart_tx;
wire tx_done;

my_top top(
    .clk(clk), 
    .reset_n(reset_n),
    .data(data),
    .send_en(send_en),  
    .baud_set(baud_set),
    .uart_tx(uart_tx),
    .tx_done(tx_done)
    );
        
initial clk=0;

always #10 clk = ~clk;

initial begin
 $fsdbDumpfile("/home/hz/project/test/vcs/dut.fsdb");
 $fsdbDumpvars(0);
 end
 
initial begin
    reset_n = 0;
    data = 0;
    send_en = 0;
    baud_set = 0;  
    #200;
    
    reset_n = 1;
    data = 8'h87;
    send_en = 1;
    baud_set = 4;
    @(posedge tx_done);
    send_en = 0;
    #100000;
    
    
    data = 8'h48;
    send_en = 1;
    baud_set = 4;
    @(posedge tx_done);
    send_en = 0;
    #100000;
    $stop;
  end
endmodule
