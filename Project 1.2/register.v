module Register_File(input clk, input rst, input WR, input [2:0] DA, input [7:0] Data_in,
                    input [3:0] BA, input [2:0] AA, output  [7:0] Data_A, output  [7:0] Data_B);

reg [7:0] R[15:0]; // array to store the data of all 16 registers
integer i;
always @(posedge clk or posedge rst)
begin
    if(rst) // reset all registers to zero
    begin
        for(i=0; i<=15; i=i+1)begin
            R[i] <= 8'b0;
        end
    end
    else if(WR) // write data to specified register
    begin
        R[DA] <= Data_in;
    end
end

assign Data_A = R[AA];
assign Data_B = R[BA];

// Note that R0 cannot be written. Your code should avoid this case by defining appropriate logic

endmodule
