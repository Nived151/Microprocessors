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


// function select
always @(*) begin
  case (FS)
    4'b0000: F = A + B; //add
    4'b0001: F = A - B; //substract
    4'b0010: F = A & B; // bitwise AND
    4'b0011: F = A | B; // bitwise OR
    4'b0100: F = A ^ B; // bitwise xor
    4'b0101: F = ~A;    // bitwise not of A
    4'b0110: F = ~B;    // bitwise not of B
    4'b0111: F = A << SH; // left shift
    4'b1000: F = A >> SH; // right shift
    4'b1001: F = {A[7:SH], A[7-SH:0]}; // left rotate
    4'b1010: F = {A[SH-1:0], A[7:SH]}; // right rotate
    default: F = 0;
  endcase
end


// zero
assign Z = (F == 0); //change later

endmodule