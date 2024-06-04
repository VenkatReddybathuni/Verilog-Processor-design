`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 08:42:23
// Design Name: 
// Module Name: swap_tb
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


module swap_tb();
reg clk, reset;
reg [2:0] ADDR0,ADDR1;

reg_file uut(.clk(clk), .reset(reset), .ADDR0(ADDR0), .ADDR1(ADDR1));

initial
clk = 1;
always #2 clk = ~clk;

initial
begin
ADDR0 = 3'b100;
ADDR1 = 3'b111;
reset = 0;
#5;
reset = 1;
#5;
ADDR0 = 3'b101;
ADDR1 = 3'b110;
#5;
$finish();
end
endmodule
