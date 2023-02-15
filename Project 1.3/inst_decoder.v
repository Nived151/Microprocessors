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

parameter NOP = 16'd0;
parameter MOVA = 16'd0;
parameter ADD= 16'd0;
parameter SUB = 16'd0;
parameter AND = 16'd0;
parameter OR = 16'd0;
parameter XOR = 16'd0;
parameter NOT = 16'd0;
parameter ADI = 16'd0;
parameter SBI = 16'd0;
parameter ANI = 16'd0;
parameter ORI = 16'd0;
parameter XRI = 16'd0;
parameter AIU = 16'd0;
parameter SIU = 16'd0;
parameter MOVB = 16'd0;
parameter LSR = 16'd0;
parameter LSL = 16'd0;
parameter LD = 16'd0;
parameter ST = 16'd0;
parameter JMR = 16'd0;
parameter SLT = 16'd0;
parameter NOP = 16'd0;
parameter BZ = 16'd0;
parameter BNZ = 16'd0;
parameter JMP = 16'd0;
parameter JML = 16'd0;
parameter IN = 16'd0;
parameter INK = 16'd0;
parameter OUT = 16'd0;



always @(*)begin
  
opcode=Instruction_in[16:12];
MD=2'b00; BS=2'b00; PS=1'b0; MW=1'b0; MB=1'b0; MA=1'b0; CS=1'b0; OE=1'b0;
case(opcode)
    NOP:begin
    RW = 1'b0;FS=4'd0;
    end
end


endmodule