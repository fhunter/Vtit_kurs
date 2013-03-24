module counter(
	input clk,
	input reset,
	output [(WIDTH-1):0] q,
	output reg cr
);
parameter WIDTH=4;
parameter TOP=9;

reg [(WIDTH-1):0] counter;

always @(posedge reset or posedge clk)
	begin
		if(reset)
			begin
				counter<=0;
				cr<=0;
			end
		else
			begin
				if(counter>=TOP)
					begin
						counter<=0;
						cr<=1;
					end
				else
					begin
						cr<=0;
						counter<=counter+1;
					end
			end
	end

assign q=counter;

endmodule
