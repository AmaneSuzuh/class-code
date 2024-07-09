module top(
    clk,
    rstn,
    din,
    refi,
    cal_en,
    sad,
    sad_vld
);

parameter DATA_BITS = 8;

input clk;
input rstn;
input cal_en;
input [16*16*DATA_BITS-1:0] din, refi;
output reg [2*DATA_BITS-1:0] sad;
output reg sad_vld;

reg [4:0] pip_num;

wire [DATA_BITS-1:0] din_array [0:15] [0:15];
wire [DATA_BITS-1:0] refi_array [0:15] [0:15];

//generate
//    genvar i,j;
//    for(i=0;i<16;i=i+1)begin : gen_i
//        for(j=0;j<16;j=i+1)begin :gen_j
//        assign din_array[i][j] = din[(i*16*DATA_BITS + j*DATA_BITS ) +: DATA_BITS];
//        assign refi_array[i][j] = refi[(i*16*DATA_BITS + j*DATA_BITS ) +: DATA_BITS];   
//
//        
//        
//        end
//    end
//endgenerate

always@(posedge clk or negedge rstn)
	if(!rstn)
		pip_num<=0;
	else
		pip_num <={pip_num[3:0],cal_en};



generate
genvar i, j;
    for (i = 0; i < 16; i = i + 1) begin : gen_i
        for (j = 0; j < 16; j = j + 1) begin : gen_j
            assign din_array[i][j] = din[(i*16*DATA_BITS + j*DATA_BITS) +: DATA_BITS];
            assign refi_array[i][j] = refi[(i*16*DATA_BITS + j*DATA_BITS) +: DATA_BITS];
        end
    end
endgenerate




//sub
reg       [DATA_BITS+1:0] num_sub [0:15] [0:15];   

generate
 genvar i0,j0;
    for(i0=0;i0<16;i0=i0+1)begin
        for(j0=0;j0<16;j0=j0+1)begin
        always@(posedge clk or negedge rstn)
        if(!rstn)
            num_sub[i0][j0]<='d0;
        else    if(cal_en)begin
                num_sub[i0][j0]<= {1'b0,din_array [i0] [j0]} - {1'b0,refi_array [i0] [j0]};                       
            end
        
        
        end
    end
endgenerate

//abs
reg       [DATA_BITS+1:0] num_abs [0:15] [0:15];
generate
    genvar i1,j1;
    for(i1=0;i1<16;i1=i1+1)begin
        for(j1=0;j1<16;j1=j1+1)begin
        always@(posedge clk or negedge rstn)
        if(!rstn)
             num_abs[i1][j1]<='d0;
        else if(pip_num[0])begin
                num_abs[i1][j1] <= (num_sub[i1][j1][DATA_BITS])?(~num_sub[i1][j1][DATA_BITS-1:0]+1'd1) 
                                                  : num_sub[i1][j1][DATA_BITS-1:0];     
            end
        
        
        end
    end
endgenerate

//16*16 -> 16*4
reg       [DATA_BITS+1:0] num416 [0:15] [0:3];//weikuan

generate
    genvar i2,j2;
    for(i2=0;i2<16;i2=i2+1)begin
        for(j2=0;j2<=3;j2=j2+1)begin
        always@(posedge clk or negedge rstn)
        if(!rstn)
             num416[i2][j2]<='d0;
        else if(pip_num[1])begin
                num416[i2][j2] <= {2'b0,num_abs[i2][4*j2]} + {2'b0,num_abs[i2][4*j2+1'd1]}
                                    +   {2'b0,num_abs[i2][4*j2+'d2]}
                                     +   {2'b0,num_abs[i2][4*j2+'d3]};
            end
        
        
        end
    end
endgenerate


//4:4*16->4*4
reg       [DATA_BITS+3:0] num44 [0:3] [0:3];

generate
    genvar i3,j3;
    for(i3=0;i3<=3;i3=i3+1)begin
        for(j3=0;j3<=3;j3=j3+1)begin
        always@(posedge clk or negedge rstn)
        if(!rstn)
             num44[i3][j3]<='d0;
        else if(pip_num[2])begin
                num44[i3][j3] <= {2'b0,num416[4*i3+1'd0][j3]}
                                +{2'b0,num416[4*i3+1'd1][j3]}
                                +{2'b0,num416[4*i3+'d2][j3]}
                                +{2'b0,num416[4*i3+'d3][j3]};
                
            end
        
        
        end
    end
endgenerate

//5: 4*4->4*1

reg       [DATA_BITS+5:0] num41[0:3];

generate
    genvar i4;
    for(i4=0;i4<=3;i4=i4+1)begin
        always@(posedge clk or negedge rstn)
        if(!rstn)
             num41[i4]<='d0;
        else if(pip_num[3])begin
                num41[i4] <={ 2'b0,num44[i4][0]}
                            +{ 2'b0,num44[i4][0]}
                            +{ 2'b0,num44[i4][0]}
                            + { 2'b0,num44[i4][0]};
        
        end
    end
endgenerate

//6: 41->11

        always@(posedge clk or negedge rstn)
        if(!rstn)
            sad <='d0;
        else if(pip_num[4])begin
                sad <=    {  2'b0,num41[0]}
                        +  {  2'b0,num41[0]}
                        +  {  2'b0,num41[0]}
                        +  {  2'b0,num41[0]};
        end

        always@(posedge clk or negedge rstn)
        if(!rstn)
            sad_vld<='d0;
        else 
            sad_vld <= pip_num[4];
        




endmodule


