module register();

reg [7:0]register;

input [2:0]AA;
input [3:0]BA;
input [2:0]DA;
input [7:0]data_in;
input wr;
input clk;
input rst;
output data_a;
output data_b;

endmodule