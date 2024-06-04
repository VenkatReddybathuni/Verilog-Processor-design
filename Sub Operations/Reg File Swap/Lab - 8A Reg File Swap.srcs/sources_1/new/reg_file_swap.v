`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 08:34:54
// Design Name: 
// Module Name: reg_file_swap
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_file #(parameter n = 32, k = 8)(
    input clk, reset,
    input [2:0] ADDR0, ADDR1
);

reg [n - 1:0] registers [0:k - 1]; 

always @(posedge clk) begin
    if (reset == 0) begin
        registers[0] <= 32'b000;
        registers[1] <= 32'b001;
        registers[2] <= 32'b010;
        registers[3] <= 32'b011;
        registers[4] <= 32'b100;
        registers[5] <= 32'b101;
        registers[6] <= 32'b110;
        registers[7] <= 32'b111;

    end else begin
            registers[ADDR0] <= registers[ADDR1];
            registers[ADDR1] <= registers[ADDR0];
    end
end

endmodule
