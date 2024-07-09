always@(*) begin
if(cal_en) begin
for(cnt=0;cnt<=255;cnt=cnt+1)begin
if(cnt == 0)
    acc = abs_val[cnt];
    else
    acc = acc + abs_val[cnt];
end
end else begin
acc =0;
end
end

reg [DWIDTH+7 :0] acc_d [0:PIPE_STAGE];
reg   cal_en_d[O:PIPE STAGE];


generate
genvar j;
for(j=0;j<=PIPE_STAGE; j=j+1)begin
if(j==0) begin
always@(posedge clk or negedge rstn)
if(~rstn)begin
    acc_d[j]<= 'd0;
    cal_en_d[j]<= 'd0;
    end else begin
    acc_d[j]<= acc;
    cal_en _d[j]<= cal_en;
end
end else begin
always@(posedge clk or negedge rstn)
if(~rstn)begin
acc_d[j]<= 'd0;
cal_en_d[j]<= 'd0;
end else begin
acc_d[j]<= acc_d[j-1];
cal_en_d[j]<=:cal_en_d[j-1];
end
end
end
endgenerate
assign sad_vld = cal_en_d[PIPE_STAGE];
assign sad= acc_d[PIPE_STAGE];