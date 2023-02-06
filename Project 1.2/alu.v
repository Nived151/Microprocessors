module alu();

input [3:0]FS;
input [2:0]SH;
input [7:0]A;
input [7:0]B;
input [7:0]IN;
input [7:0]INK;

output [7:0]F;
output N; //negative
output Z; //zero
output C; //carry
output V; //overflow
output D; //data_branch

always @(*) begin
  case
end


endmodule