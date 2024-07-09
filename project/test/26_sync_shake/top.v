module top(
        clk_i,
        rst_i,
        in_vld,
        din,
        in_ack,
        
        
        clk_o,
        rst_o,
        out_vld,
        dout,
        out_ack 
        );
        parameter SYNC_STAGE=2;

        input clk_i,clk_o;
        input rst_i,rst_o;
        input  in_vld;
        input [7:0]din;
        input out_ack;

        output reg [7:0]dout;       
        output wire in_ack;
        output reg out_vld;
        
    //clk_i
        reg in_vld_lev;
	

        wire in_vld_sync_in;
        reg in_vld_sync_in2;
        wire in_sync_in_rise;
        wire capin;
        reg [7:0]din_r;
       
        reg vld_sync;

        assign capin = in_vld & in_ack;
        assign in_ack = (!in_vld_sync_in)&(!in_vld_lev); 
        assign in_vld_sync_in_rise = in_vld_sync_in&(!in_vld_sync_in2);
        
        sync_stage #(.SYNC_NUM(SYNC_STAGE)) u_sync_i (
                                        .clk(clk_i),
                                        .rst(rst_i),
                                        .din(vld_sync),
                                        .dout(in_vld_sync_in)                                   
                                        );
                                        
        always@(posedge clk_i)begin
        if(capin)
        din_r<=din;
        end
        
        always@(posedge clk_i or negedge rst_i)begin
        if(!rst_i)                             
            in_vld_sync_in2<= 1'b0;
        else
            in_vld_sync_in2<=in_vld_sync_in;
        end
        always@(posedge clk_i or negedge rst_i)begin
        if(!rst_i)
        in_vld_lev<=1'b0;
        else if(capin)
        in_vld_lev <=1'b1;
        else if(in_vld_sync_in_rise)
        in_vld_lev <=1'b0;
        end
        
        //clk_o-----------------------------------------------------------

        wire capout;
        wire in_vld_clk_o;
        reg  in_vld_clk_o2;
        wire in_vld_clk_o_rise;
        
        
        assign capout = out_vld&out_ack;
        
        sync_stage #(.SYNC_NUM(SYNC_STAGE)) u_sync_o (
                                        .clk(clk_o),
                                        .rst(rst_o),
                                        .din(in_vld_lev),
                                        .dout(in_vld_clk_o)                                  
                                        );
        
        always@(posedge clk_o or negedge rst_o)begin
        if(!rst_i)                             
            in_vld_clk_o2<= 1'b0;
        else
            in_vld_clk_o2<=in_vld_clk_o;
        end
        
        assign in_vld_clk_o_rise = in_vld_clk_o & (!in_vld_clk_o2);  
         
        always@(posedge clk_o)begin
        if(in_vld_clk_o_rise)
        dout <=din_r;
        end
        
        always@(posedge clk_o or negedge rst_o)begin
        if(!rst_o)
        out_vld<=1'b0;
        else if(in_vld_clk_o_rise)
        out_vld <=1'b1;
        else if(out_ack)
        out_vld <=1'b0;
        end
        
        
        always@(posedge clk_o or negedge rst_o)begin 
        if(!rst_o)
        vld_sync<=1'b0;
        else if(in_vld_clk_o_rise)
        vld_sync <=1'b1;
        else if(vld_sync)begin
        if((!out_vld)&&(!in_vld_clk_o))                
        vld_sync <=1'b0;
        end
        end
        
        
        
        
        
        
        
        
        
        endmodule
