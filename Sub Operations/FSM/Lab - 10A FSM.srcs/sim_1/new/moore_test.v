`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2024 09:27:27
// Design Name: 
// Module Name: moore_test
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
module moore_tb();
reg clk;
reg Resetn;
reg w;
wire z;
moore uut(.Clock(clk), .Resetn(Resetn), .w(w), .z(z));
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
w = 1; Resetn = 1;
#10;
w = 1; Resetn = 1;
#10;
w = 0; Resetn = 1;
#10;
w = 1; Resetn = 1;
#30;

$finish();
end

endmodule

//module moore_test();
//reg clk;
//reg reset;
//reg din;
//wire dout;
//moore uut(.clk(clk), .reset(reset), .din(din), .dout(dout));
//initial 
//begin
//clk = 1;
//forever #5 clk = ~clk;
//end

//initial
//begin
//reset = 0;
//#10;
//reset = 1;
//din = 0;
//#10;
//din = 1;
//#10;
//din = 1;
//#10;
//din = 0;
//#10;
//din = 1;
//#10;
//din = 1;
//#20

//$finish();
//end

//endmodule
