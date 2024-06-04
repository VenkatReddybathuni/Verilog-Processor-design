`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2024 09:43:37
// Design Name: 
// Module Name: op_codes_tb
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

module op_codes_tb();
reg clk, reset, en;
reg [3:0]op_code;
reg [3:0] ADDR0,ADDR1,ADDR2;

op_codes uut(.clk(clk), .reset(reset), .en(en), .op_code(op_code), .ADDR0(ADDR0), .ADDR1(ADDR1), .ADDR2(ADDR2));

initial
clk = 1;
always #2 clk = ~clk;

initial
begin
en = 1;
op_code = 4'b1000;
ADDR0 = 4'b0001;
ADDR1 = 4'b0010;
ADDR2 = 4'b0011;
reset = 0;
#5;
reset = 1;
#10;
op_code = 4'b1000;
ADDR0 = 4'b0111;
ADDR1 = 4'b1000;
ADDR2 = 4'b1001;
#10;
$finish();
end
endmodule
