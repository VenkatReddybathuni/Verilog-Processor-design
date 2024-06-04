`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2024 14:54:19
// Design Name: 
// Module Name: ques2test
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


module ques2test();
    reg [2:0]select;
    reg [4:0] number;
    wire OUT;
    question2a uut(.select(select),.number(number),.OUT(OUT));
    initial
    begin
    number = 5'b00000; select = 3'b101; #10;
    number = 5'b00001; select = 3'b101; #10;
    number = 5'b00010; select = 3'b101; #10;
    number = 5'b00011; select = 3'b101; #10;
    number = 5'b00100; select = 3'b101; #10;
    number = 5'b00101; select = 3'b101; #10;
    number = 5'b00110; select = 3'b101; #10;
    number = 5'b00111; select = 3'b101; #10;
    number = 5'b01000; select = 3'b101; #10;
    number = 5'b01001; select = 3'b101; #10;
    number = 5'b01010; select = 3'b101; #10;
    number = 5'b01011; select = 3'b101; #10;
    number = 5'b01100; select = 3'b101; #10;
    number = 5'b01101; select = 3'b101; #10;
    number = 5'b01110; select = 3'b101; #10;
    number = 5'b01111; select = 3'b101; #10;
    number = 5'b10000; select = 3'b101; #10;
    number = 5'b10001; select = 3'b101; #10;
    number = 5'b10010; select = 3'b101; #10;
    number = 5'b10011; select = 3'b101; #10;
    number = 5'b10100; select = 3'b101; #10;
    number = 5'b10101; select = 3'b101; #10;
    number = 5'b10110; select = 3'b101; #10;
    number = 5'b10111; select = 3'b101; #10;
    number = 5'b11000; select = 3'b101; #10;
    number = 5'b11001; select = 3'b101; #10;
    number = 5'b11010; select = 3'b101; #10;
    number = 5'b11011; select = 3'b101; #10;
    number = 5'b11100; select = 3'b101; #10;
    number = 5'b11101; select = 3'b101; #10;
    number = 5'b11110; select = 3'b101; #10;
    number = 5'b11111; select = 3'b101; #10;
    $finish();
    end 
endmodule
