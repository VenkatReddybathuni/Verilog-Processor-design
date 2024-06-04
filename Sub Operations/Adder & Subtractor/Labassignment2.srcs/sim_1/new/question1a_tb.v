`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2024 22:06:46
// Design Name: 
// Module Name: question1a_tb
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
module question1a_tb();
    reg Mode;
    reg carry_borrow_in;
    reg [7:0] A;
    reg [7:0] B;
    wire [7:0] C;
    wire carry_borrow_out;

    add_or_sub_8bit uut (
        .Mode(Mode),
        .carry_borrow_in(carry_borrow_in),
        .A(A),
        .B(B),
        .C(C),
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
