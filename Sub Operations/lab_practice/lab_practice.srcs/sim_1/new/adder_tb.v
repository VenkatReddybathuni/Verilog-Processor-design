`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 02:19:23
// Design Name: 
// Module Name: adder_tb
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


module adder_tb();
reg [3:0]A, B;
wire [3:0]S;
wire Carry;

adder_four uut(.A(A), .B(B), .Carry(Carry), .S(S));
initial
begin
A = 4'b0011; B = 4'b0010; 
#10;
A = 4'b1111; B = 4'b1111; 
#5;
$finish();
end

endmodule
