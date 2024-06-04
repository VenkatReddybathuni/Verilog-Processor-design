`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 01:39:37
// Design Name: 
// Module Name: prime_tb
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


module prime_tb();
reg [3:0]A;
wire f;

primefn uut (.A(A), .f(f));

initial
begin
A = 4'b0010; 
#5;
A = 4'b0011;
#5;
A = 4'b0101;
#5;
A = 4'b0110;
#5;
$finish();
end
endmodule
