module antiring(
	input clock,
	input r,
	input s,
	output reg q
);

parameter LENGTH=10;

reg [LENGTH:0] delayr;
reg [LENGTH:0] delays;

wire delayed_r;
wire delayed_s;

always @(posedge clock or negedge r)
	begin
		if(r==0)
			delayr<=0;
		else
			if(!delayr[LENGTH])
				delayr<=delayr+1;
	end
	
always @(posedge clock or negedge s)
	begin
		if(s==0)
			delays<=0;
		else
			if(!delays[LENGTH])
				delays<=delays+1;
	end	

assign delayed_r=delayr[LENGTH]?0:1;
assign delayed_s=delays[LENGTH]?0:1;

always @(posedge clock)
	q<=delayed_s&(!delayed_r);

endmodule
