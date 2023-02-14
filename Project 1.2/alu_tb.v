`timescale 1ns/1ps
`include "alu.v"

module alu_tb();
reg [3:0]FS;
reg [2:0]SH;
reg [7:0]A;
reg [7:0]B;
reg [7:0]IN;
reg [7:0]INK;

wire [7:0]F;
wire N; //negative
wire Zero; //zero
wire C; //carry
wire V; //overflow
wire D;
integer i;

alu uut(
    .FS(FS), .SH(SH), .A(A), .B(B), .IN(IN), .INK(INK), 
    .F(F), .N(N), .Zero(Zero), .C(C), .V(V), .D(D)
    );
    initial begin
        A= 8'b1111;
        B= 8'b1110;
        FS = 4'h0;
        SH = 8'b0001;

        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);
        $display("Test");

        for (i=0;i<=15;i=i+1) begin
        FS = FS+8'b0001;
        #10;
        end

        A = 8'hF6;
        B = 8'h0A;
    end
endmodule