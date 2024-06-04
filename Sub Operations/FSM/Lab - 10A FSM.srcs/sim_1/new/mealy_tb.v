`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2024 20:46:27
// Design Name: 
// Module Name: mealy_tb
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


`timescale 1ns / 1ps
module mealy_tb();
reg clk;
reg Resetn;
reg w;
wire z;
mealy uut(.Clock(clk), .Resetn(Resetn), .w(w), .z(z));
initial 
begin
clk = 1;
forever #5 clk = ~clk;
end

initial
begin
w = 0;Resetn = 0;
#10.1;
w = 0; Resetn = 1;
#10;
w = 1;
#10;
w = 1; 
#10;
w = 0; 
#10;
w = 1; 
#10;
w = 1; 
#30;
$finish();
end

endmodule
