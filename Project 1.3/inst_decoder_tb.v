`timescale 1ns/1ps
`include "inst_decoder.v"
module inst_decoder_tb();
reg [16:0]Instruction_in;
wire [2:0]DA;
wire [2:0]AA; 
wire [2:0]BA; 
wire [1:0]BS; 
wire PS;
wire MW; 
wire RW; 
wire MA; 
wire MB; 
wire [1:0]MD;
wire [3:0]FS; 
wire [2:0]SH; 
wire CS;
wire OE;

inst_decoder uut(.Instruction_in(Instruction_in), .DA(DA), .AA(AA),.BA(BA), .BS(BS), .PS(PS), .MW(MW), .RW(RW), .MA(MA), .MB(MB), .MD(MD), .FS(FS), .SH(SH), .CS(CS), .OE(OE) );

 initial begin
    Instruction_in = 17'b0001101100100;
    /*$dumpfile("inst_decoder.vcd");
    $dumpvars(0, inst_decoder_tb);*/
 end


endmodule