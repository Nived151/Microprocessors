`timescale 1ns/1ps
`include "data_mem.v"
module data_mem_tb();
reg clk,address_bus,data_in,r_w;
wire data_out;

data_mem uut(
    .clk(clk),
    .address_bus(address_bus),
    .data_in(data_in),
    .r_w(r_w)
);

initial clk=0; 
    always #5 clk=~clk;
    initial begin 
        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_tb);
        $display("Test Started");

        r_w = 1;

        address_bus = 1'b0;
        data_in = 1'b1;
        #100

        address_bus = 8'b1;
        data_in = 8'b7;
        #100

        $display("Write Completed")

        r_w = 0;

        address_bus = 1'b0;
        $display(data_out);
        #100

        address_bus = 8'b1;
        $display(data_out)
        #100

        $display("Read Completed")
        #100

        $finish;
    end 

endmodule