module inst_decoder(
input [16:0]Instruction_in,
output reg [2:0]DA, //destination address
output reg [2:0]AA, //A-register address
output reg [2:0]BA, //B-register address
output reg [1:0]BS, //Branch select of Program counter
output reg PS, //zero toggle i.e toggles between zero and N
output reg MW, //Memory Write
output reg RW, //Register write
output reg MA, //MUX A selection bit
output reg MB, 
output reg [1:0]MD,
output reg [3:0]FS, // Function select
output reg [2:0]SH, //shift number
output reg CS, //constant Unit
output reg OE //output enable
);

reg [5:0]opcode;

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
parameter BNZ = 5'd12;
parameter ST = 5'd13;
parameter MOVA = 5'd14;
parameter JMP = 5'd15;
parameter JML = 5'd16;

always @(*)begin
  
opcode <=Instruction_in[16:12];
MD=2'b00; BS=2'b00; PS=1'b0; MW=1'b0; MB=1'b0; MA=1'b0; CS=1'b0; OE=1'b0;
case(opcode)
    NOP:begin
    RW = 1'b0;FS=4'd0;
    end
    ADD: begin
      $display("addcase");
      RW = 1'b1; FS=4'd1; AA=Instruction_in[8:6]; BA=Instruction_in[5:3];DA=Instruction_in[11:9];
    end
    OUT:begin
      RW = 1'b0; FS = 4'd2; OE = 1'b1; AA=Instruction_in[8:6]; BA=Instruction_in[5:3];DA=Instruction_in[11:9];
    end
    SLT:begin
      RW=1'b1;MD=2'b10; FS=4'd3; AA=Instruction_in[8:6]; BA=Instruction_in[5:3];DA=Instruction_in[11:9];
    end
    AND: begin
      RW = 1'b1; FS = 4'd4; OE = 1'b0; AA=Instruction_in[8:6]; BA=Instruction_in[5:3];DA=Instruction_in[11:9];
    end
    LD: begin
      RW = 1'b1; FS = 4'd5; MD = 2'b01; AA=Instruction_in[8:6]; DA=Instruction_in[11:9]; 
    end
    SBI: begin
      // immediate
    end
    LSL: begin
      RW = 1'b1; FS = 4'd7; AA=Instruction_in[8:6]; BA=Instruction_in[5:3];DA=Instruction_in[11:9];
    end
    IN: begin
      // idk
    end
    XRI: begin
      // immedieate
    end
    ADI: begin
      // immediate
    end
    BZ:begin
      // 
    end
    BNZ: begin
      //
    end
    ST: begin
     //
    end
    MOVA: begin
      //
    end
    JMP: begin
      //
    end
    endcase
end


endmodule