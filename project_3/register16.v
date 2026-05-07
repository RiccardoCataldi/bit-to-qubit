module register16(input wire clk, input wire load, input wire [15:0] in, output wire [15:0] out);
	bit b0(.clk(clk), .load(load), .in(in[0]), .out(out[0]));
	bit b1(.clk(clk), .load(load), .in(in[1]), .out(out[1]));
	bit b2(.clk(clk), .load(load), .in(in[2]), .out(out[2]));
	bit b3(.clk(clk), .load(load), .in(in[3]), .out(out[3]));
	bit b4(.clk(clk), .load(load), .in(in[4]), .out(out[4]));
	bit b5(.clk(clk), .load(load), .in(in[5]), .out(out[5]));
	bit b6(.clk(clk), .load(load), .in(in[6]), .out(out[6]));
	bit b7(.clk(clk), .load(load), .in(in[7]), .out(out[7]));
	bit b8(.clk(clk), .load(load), .in(in[8]), .out(out[8]));
	bit b9(.clk(clk), .load(load), .in(in[9]), .out(out[9]));
	bit b10(.clk(clk), .load(load), .in(in[10]), .out(out[10]));
	bit b11(.clk(clk), .load(load), .in(in[11]), .out(out[11]));
	bit b12(.clk(clk), .load(load), .in(in[12]), .out(out[12]));
	bit b13(.clk(clk), .load(load), .in(in[13]), .out(out[13]));
	bit b14(.clk(clk), .load(load), .in(in[14]), .out(out[14]));
	bit b15(.clk(clk), .load(load), .in(in[15]), .out(out[15]));
endmodule
