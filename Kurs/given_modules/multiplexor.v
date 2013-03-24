module multiplexor(
	input clk,
	input [(WIDTH-1):0] data0,
	input [(WIDTH-1):0] data1,
	input [(WIDTH-1):0] data2,
	input [(WIDTH-1):0] data3,
	
	output [3:0]columns,
	output [(WIDTH-1):0] outputdata
);

parameter WIDTH=15;
parameter DIVISOR=15;

reg [(DIVISOR-1):0] counter;
wire [1:0] select;

assign select=counter[(DIVISOR-1):(DIVISOR-2)];

always @(posedge clk)
	counter<=counter+1;

assign outputdata=(select[0])?(select[1]?data3:data1):(select[1]?data2:data0);
assign columns=(1<<select);

endmodule
