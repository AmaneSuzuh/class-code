module my_top(
    clk, 
    reset_n,
    data,
    send_en,
    baud_set,  
    uart_tx,
    tx_done
    );


input clk;   
input reset_n;
input [7:0]data;
input send_en;
input [3:0]baud_set;

output reg tx_done;
output reg uart_tx;


//reg send_en; 
reg [4:0]counter;
reg [17:0]counter1;//时钟分频得到不同的频率
reg [17:0]bps_DR;

wire bps_clk;
assign bps_clk = (counter1 == 1);

always@(*)
    case(baud_set)
       0: bps_DR = 1000000000/9600/20;
       1: bps_DR = 1000000000/19200/20;
       2: bps_DR = 1000000000/38400/20;
       3: bps_DR = 1000000000/57600/20;
       4: bps_DR = 1000000000/115200/20;
      default: bps_DR = 1000000000/9600/20;
    endcase      

always@(posedge clk or negedge reset_n)
    if(!reset_n)
        counter1 <= 0;
    else if(send_en) begin       
        if(counter1 == bps_DR - 1 )    
            counter1 <= 0;
        else 
             counter1 <= counter1 + 1'b1;  
     end  
    else
        counter1 <= 0;
     
//数据位数定时器    
always@(posedge clk or negedge reset_n)
    if(!reset_n)
        counter <= 0; 
        
    else if(send_en) begin
        if(bps_clk)begin
             if(counter == 12 )
                counter <= 0;
             else 
                counter <= counter + 1'b1;   
             end 
     end
     else
        counter = 0;
        
 //counter = bsp_cnt
 //counter div_cnt
    
//数据传输    
 always@(posedge clk or negedge reset_n)
    if(!reset_n)begin
        tx_done = 0;
        uart_tx = 1;
        end
     else  begin        
        case(counter) 
           1:uart_tx = 0;
           2: uart_tx = data[0];
           3: uart_tx = data[1];
           4: uart_tx = data[2];
           5: uart_tx = data[3];
           6: uart_tx = data[4];
           7: uart_tx = data[5];
           8: uart_tx = data[6];
           9: uart_tx = data[7];
           10: uart_tx = 1; 
           11: uart_tx = 1;
           default:uart_tx = 1;      
        endcase  
           end
    
 always@(posedge clk or negedge reset_n)
    if(!reset_n)
        tx_done = 0;
    else if((bps_clk == 1) && (counter == 10))
        tx_done <= 1;
    else 
         tx_done = 0;       
endmodule

