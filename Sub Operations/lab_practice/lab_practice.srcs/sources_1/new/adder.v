`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 02:00:11
// Design Name: 
// Module Name: adder
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


module adder_one(input A, B, Cin, output S, Cout);

begin

xor g1(S, A, B, Cin);

and g2(o1, A, B);
xor g3(o2, A, B);
and g4(o3, Cin, o2);
or g5(Cout, o1, o3);

end
endmodule

module adder_four(input [3:0]A, [3:0]B, output Carry, [3:0]S);
begin
wire [2:0]Cin;
adder_one inst1(.A(A[0]), .B(B[0]), .Cin(1), .S(S[0]), .Cout(Cin[0]));
adder_one inst2(.A(A[1]), .B(B[1]), .Cin(Cin[0]), .S(S[1]), .Cout(Cin[1]));
adder_one inst3(.A(A[2]), .B(B[2]), .Cin(Cin[1]), .S(S[2]), .Cout(Cin[2]));
adder_one inst4(.A(A[3]), .B(B[3]), .Cin(Cin[2]), .S(S[3]), .Cout(Carry));

end
endmodule
