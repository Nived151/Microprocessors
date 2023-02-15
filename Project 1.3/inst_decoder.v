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

always @(*)begin
  
opcode=Instruction_in[16:12];
MD=2'b00; BS=2'b00; PS=
case(opcode)
    NOP:begin
    
    end
end


endmodule