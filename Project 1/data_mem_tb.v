`timescale 1ns/1ps
`include "data_mem.v"
module data_mem_tb;
reg clk;
reg [7:0]address_bus;
reg [7:0]data_in;
reg r_w;
wire [7:0]data_out;

data_mem uut(
    .clk(clk),
    .address_bus(address_bus),
    .data_in(data_in),
    .r_w(r_w)
);

initial clk=0; 
    always #5 clk=~clk;
    initial begin 
        $dumpfile("data_mem_tb.vcd");
        $dumpvars(0, data_mem_tb);
        $display("Test Started");

        r_w = 1;

        address_bus = 8'd0;
        data_in = 8'd1;
        #100;

        address_bus = 8'd1;
        data_in = 8'd7;
        #100;

        $display("Write Completed");

        r_w = 0;

        address_bus = 8'd0;
        $display(data_out);
        #100;

        address_bus = 8'd1;
        $display(data_out);
        #100;

        $display("Read Completed");
        #100;

        $finish;
    end 

endmodule