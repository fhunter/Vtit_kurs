module decoder (
	input [3:0] indata,
	input dp,
	output [8:0] outdata
);

reg [7:0] routdata;

always @(indata)
	case (indata)
	    //                PKFEDCBA
		4'h0: routdata=8'b00111111;
		4'h1: routdata=8'b00000110;
		4'h2: routdata=8'b11011011;
		4'h3: routdata=8'b01001111;
		4'h4: routdata=8'b11100110;
		4'h5: routdata=8'b11101101;
		4'h6: routdata=8'b11111101;
		4'h7: routdata=8'b00000111;
		4'h8: routdata=8'b11111111;
		4'h9: routdata=8'b11101111;
		4'ha: routdata=8'b11110111;
		4'hb: routdata=8'b11111100;
		4'hc: routdata=8'b00111001;
		4'hd: routdata=8'b11011110;
		4'he: routdata=8'b10111001;
		4'hf: routdata=8'b10110001;
	endcase

assign outdata={dp,routdata};

endmodule

