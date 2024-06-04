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

module op_codes #(parameter n = 32, k = 16)(
    input clk, reset,en,
    input [3:0] op_code,
    input [3:0] ADDR0, ADDR1, ADDR2
);

reg [n - 1:0] registers [0:k - 1]; 
reg [n-1:0] X, Y;
reg [n-1:0] D;
reg Bout;
reg [n:0] B;
integer i;
always @(posedge clk) begin
    if (en & reset == 0) begin
        registers[0] <= 32'b000;
        registers[1] <= 32'b110;
        registers[2] <= 32'b010;
        registers[3] <= 32'b000;
        registers[4] <= 32'b000;
        registers[5] <= 32'b000;
        registers[6] <= 32'b000;
        registers[7] <= 32'b011;
        registers[8] <= 32'b000;
        registers[9] <= 32'b000;
        registers[10] <= 32'b000;
        registers[11] <= 32'b000;
        registers[12] <= 32'b000;
        registers[13] <= 32'b000;
        registers[14] <= 32'b000;
        registers[15] <= 32'b000;
        

    end else if (reset & en & op_code == 4'b1000) begin
          X = registers[ADDR0];
          Y = registers[ADDR1];
          B[0] = 1;
          for (i=0; i<n; i=i+1)
          begin
          D[i] = X[i] ^ ~Y[i] ^ B[i];
          B[i+1] = (X[i] & ~Y[i] ) | (X[i] & B[i] ) | (B[i] & ~Y[i]);
          end
          if(B!= 0)
          begin
          Bout = ~B[n];
          end
          registers[ADDR2] = D;
          end
       else if (reset & en & op_code == 4'b1010) begin
        registers[ADDR2] <= registers[ADDR0] ^ registers[ADDR1];
        end
end

endmodule