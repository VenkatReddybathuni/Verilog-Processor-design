`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2024 13:31:56
// Design Name: 
// Module Name: CA_tb
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


module CA_tb();
reg [3:0]A;
wire f;
Prime_fn_CA uut(.A(A), .f(f));
    initial 
    begin
    A = 4'b0001;
    #10;
    A = 4'b0101;
    #10;
    A = 4'b1111;
    #10;
    A = 4'b0011;
    #10;
    $finish();
    end
endmodule
