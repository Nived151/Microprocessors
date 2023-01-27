module data_mem(clk,address_bus,data_in,data_out,r_w);
input clk;
input [7:0]address_bus;
input [7:0]data_in;
output [7:0]data_out;
input r_w;
reg [7:0]ram[0:255];
integer i;

initial begin
  for (i=0; i<256 ; i=i+1)
  ram[i] = 0;
end

always @(posedge clk) begin
  if (r_w == 1)
  ram[address_bus] <= data_in;
end

assign data_out = ram[address_bus];

endmodule