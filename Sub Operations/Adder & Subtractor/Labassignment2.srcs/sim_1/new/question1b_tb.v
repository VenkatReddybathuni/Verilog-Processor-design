`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2024 10:22:57
// Design Name: 
// Module Name: question1b_tb
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


module question1b_tb();
    reg [7:0] C;
    reg carry_borrow_out;
    wire [8:0] C_gray;
    gray_converter uut(.C(C), .carry_borrow_out(carry_borrow_out), .C_gray(C_gray));
    initial begin
        C = 8'b1011; carry_borrow_out = 0;
        #10;
        $finish();
    end
endmodule
