`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2024 13:12:31
// Design Name: 
// Module Name: struct_tb
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


module struct_tb();
reg [3:0]A;
wire f;
Prime_fn_struct uut(.A(A), .f(f));
    initial
    begin
    A = 4'b0010;
    #10;
    A = 4'b0011;
    #10;
    A = 4'b1001;
    #10;
    $finish();
    end
endmodule
