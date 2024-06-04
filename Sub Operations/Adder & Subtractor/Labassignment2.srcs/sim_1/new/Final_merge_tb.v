`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2024 10:43:24
// Design Name: 
// Module Name: Final_merge_tb
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


module Final_merge_tb();
    reg Mode;
    reg carry_borrow_in;
    reg [7:0] A;
    reg [7:0] B;
    wire [7:0] C_gray;
    wire carry_borrow_out;

    Final_merge uut (
        .Mode(Mode),
        .carry_borrow_in(carry_borrow_in),
        .A(A),
        .B(B),
        .C_gray(C_gray),
        .carry_borrow_out(carry_borrow_out)
    );

    initial begin
        Mode = 0;
        carry_borrow_in = 0;
        A = 8'b00111000;
        B = 8'b00100000; 
        #10;

        Mode = 1;
        carry_borrow_in = 0;
        A = 8'b00111000;
        B = 8'b00100000; 
        #10;
        
        Mode = 1;
        carry_borrow_in = 0;
        A = 8'b00111000;
        B = 8'b00111100; 
        #10;
        $finish();
    end
endmodule
