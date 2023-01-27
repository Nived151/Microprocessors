module data_mem();
input clk;
input address_bus[0:7];
input data_in[0:7];
output data_out[0:7];
input r_w;
reg [0:7]ram[0:255];
integer i;

initial begin
  for (i=0; i<256 ; i=i+1)
  ram[i] = 0;
end

always @(posedge clk) begin
  if (r_w == 1)
  ram[address_bus] <= data_in;
  else
  data_out <= ram[address_bus]
end

endmodule