`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 00:38:46
// Design Name: 
// Module Name: reg_file
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


//module regi(input [3:0]D, clk, reset, [1:0]mode, output reg [3:0]Q);
//always@(negedge clk)
//    begin
//    if (reset == 0)
//        Q <= 4'b0000;
//    else if (mode == 2'b00)
//        Q <= Q;
//    else if (mode == 2'b01)
//        Q <= {Q[2:0], 1'b0};
//    else if (mode == 2'b10)
//        Q <= {1'b0, Q[3:1]}; 
//    else
//        Q <= D;
//    end        
//endmodule

module reg_file(
    input [3:0] D,
    input clk, reset,
    input mode,
    input [2:0] src_register, dest_register,
    output reg [3:0] Q
);

reg [3:0] registers [0:7]; // 8 registers, each 32 bits

always @(negedge clk) begin
    if (reset == 0) begin
        // Reset logic (unchanged)
        registers[0] <= 4'b0000;
        registers[1] <= 4'b0000;
        registers[2] <= 4'b0000;
        registers[3] <= 4'b0000;
        registers[4] <= 4'b0000;
        registers[5] <= 4'b0000;
        registers[6] <= 4'b0000;
        registers[7] <= 4'b0000;
        Q <= 4'b0000;
    end else begin
        if (mode == 0 && reset == 1) begin
            registers[src_register] <= D;
            Q <= registers[src_register];
            
        end else if (mode == 1 && reset == 1) begin
            // Move contents from source to destination register
            registers[dest_register] <= registers[src_register];
            Q <= registers[dest_register];
        end
    end
end

endmodule
