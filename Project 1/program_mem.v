module program_mem();
input program_mem_address_bus[0:7];
output program_mem_data_out[0:16];
reg program_mem_reg[255:0];
integer i;

initial begin
  for (i=0; i<256 ; i=i+1)
  program_mem_reg[i] = 0;
end

assign data_out = [address_bus];

endmodule