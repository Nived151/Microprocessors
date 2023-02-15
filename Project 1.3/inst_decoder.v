module inst_decoder();

input Instruction_in[16:0];
output DA[2:0]; //destination address
output AA[2:0]; //A-register address
output BA[2:0]; //B-register address
output BS[1:0]; //Bramch select of Program counter
output PS; //zero toggle i.e toggles between zero and N
output MW; //Memory Write
output RW; //Register write
output MA; //MUX A selection bit
output MB; 
output [1:0]MD;
output [3:0]FS; // Function select
output [2:0]SH; //shift number
output CS; //constant Unit
output OE; //output enable

parameter NOP = 5'd0;
parameter ADD= 5'd1;
parameter OUT = 5'd2;
parameter SLT = 5'd3;
parameter AND = 5'd4;
parameter LD = 5'd5;
parameter SBI = 5'd6;
parameter LSL = 5'd7;
parameter IN = 5'd8;
parameter XRI = 5'd9;
parameter ADI = 5'd10;
parameter BZ = 5'd11;
parameter BNZ = 5'd212;
parameter ST = 5'd13;
parameter MOVA = 5'd14;
parameter JMP = 5'd15;
parameter JML = 5'd16;

always @(*)begin
  
opcode=Instruction_in[16:12];
MD=2'b00; BS=2'b00; PS=1'b0; MW=1'b0; MB=1'b0; MA=1'b0; CS=1'b0; OE=1'b0;
case(opcode)
    NOP:begin
    RW = 1'b0;FS=4'd0;
    end
    ADD: begin
      RW = 1'b1; FS=4'd1; AA=Instruction_in[8:6]; BA=Instruction_in[5:3];DA=Instruction_in[11:9];
    end
    OUT:begin
      RW = 1'b0; FS = 4'b2; OE = 1'b1;
    end
end


endmodule