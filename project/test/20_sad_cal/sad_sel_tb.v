`timescale 1ns / 10ps

module tb();

parameter 	cyc_time 	= 10.0;
parameter	WIDTH		= 8;
parameter	PIPE_STATE	= 5;

reg		clk,rstn;

reg 	[WIDTH-1:0]	din [0:15][0:15];
reg		[WIDTH-1:0]	refi[0:15][0:15];
reg					cal_en;

wire 	[WIDTH+7:0]	sad,sad_golden ;
wire 				sad_vld;
wire				sad_vld_golden;

wire	[16*16*WIDTH-1:0] din_w,ref_w;

integer	y,x;
integer	test_cnt;
reg		[7:0]	rand_val;
reg		[4:0]	wait_cyc;

always #(cyc_time / 2.0 ) clk=~clk;

initial begin

end

//generate test_data

initial		begin
	clk = 0;
	rstn = 0;
	cal_en = 0;
	test_cnt = 0;
	repeat(10)@(posedge clk); #1;
	rstn = 1;
	
	repeat(2)@(posedge clk); #1;

	//test0: din = 0  refi= 0
	cal_en = 1;
	for(y=0;y<=15;y=y+1)begin
		for(x=0;x<=15;x=x+1)begin
			din[y][x] = 0;
			refi[y][x] =0;
		
		end
	end
	@(posedge clk); #1;

	//test1: din = 0  refi= ff

		cal_en = 1;
	for(y=0;y<=15;y=y+1)begin
		for(x=0;x<=15;x=x+1)begin
			din[y][x] = 8'h00;
			refi[y][x] =8'hff;
		
		end
	end
	@(posedge clk); #1;

	//test2: din = ff  refi= ff

		cal_en = 1;
	for(y=0;y<=15;y=y+1)begin
		for(x=0;x<=15;x=x+1)begin
			din[y][x] = 8'hff;
			refi[y][x] =8'hff;
		
		end
	end
	@(posedge clk); #1;



	//test2: din = ff  refi= 00

		cal_en = 1;
	for(y=0;y<=15;y=y+1)begin
		for(x=0;x<=15;x=x+1)begin
			din[y][x] = 8'hff;
			refi[y][x] =8'h00;
		
		end
	end
	@(posedge clk); #1;

	//2 cycle
	cal_en = 0;
	repeat(2) @(posedge clk); #1;
	
	$display("Info:Do random test0.");
	for(test_cnt= 0;test_cnt <=(1<<15);test_cnt=test_cnt+1)begin
		rand_val	=	$random()%256;
		for(y=0;y<=15;y=y+1)begin
		for(x=0;x<=15;x=x+1)begin
			din[y][x] = $random()%256;
			refi[y][x] =$random()%256;
		
		end
	end	
		if(rand_val<=16) begin
		cal_en = 0;
		end else begin
		cal_en = 1;
		end
	@(posedge clk); #1;
	end
	cal_en = 0;
	
		$display("Info:Do random test1.");
	
	for(test_cnt= 0;test_cnt <=(1<<15);test_cnt=test_cnt+1)begin
		rand_val	=	$random()%256;
		for(y=0;y<=15;y=y+1)begin
		for(x=0;x<=15;x=x+1)begin
			din[y][x] = $random()%256;
			refi[y][x] =$random()%256;
		
		end
	end	
		if(rand_val>16) begin
		cal_en = 0;
		end else begin
		cal_en = 1;
		end
	@(posedge clk); #1;
	end
	cal_en = 0;

	repeat(20)@(posedge clk); #1;
		$display("Info:sad_cal sim pass.");
		$finish();
		
end

generate
genvar	y0,x0;  //zhongdian   yong yu xun huan shengcheng yuju
for(y0=0;y0<=15;y0=y0+1)begin
	for(x0=0;x0<=15;x0=x0+1)begin
		assign	din_w[(y0*16*WIDTH + x0*WIDTH) +: WIDTH] = din[y0][x0];//kao lv le hang
		assign	ref_w[(y0*16*WIDTH + x0*WIDTH) +: WIDTH] = refi[y0][x0];
	end
end
endgenerate

initial begin
 $fsdbDumpfile("/home/hz/project/test/20_sad_cal/sim.fsdb");
 $fsdbDumpvars(0);
 end




top #(.DATA_BITS(8)) top_u(
        .clk(clk),
        .rstn(rstn),
        .din(din_w),
        .refi(ref_w),
        .cal_en(cal_en),
        
        .sad(sad),
        .sad_vld(sad_vld)
        
);



endmodule
