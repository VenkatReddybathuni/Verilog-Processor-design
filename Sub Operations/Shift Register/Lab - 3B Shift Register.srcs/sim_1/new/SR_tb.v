`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2024 16:28:45
// Design Name: 
// Module Name: SR_tb
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


module SR_tb();
reg D, clk;
wire [3:0]Q;
shift_register uut(.D(D), .clk(clk), .Q(Q));
    initial
    begin
    clk = 1;
    forever #5 clk = ~clk;
    end
    
    initial
    begin
    D = 1;
    #10;
    D = 0;
    #10;
    D = 1;
    #10;
    D = 1;
    #10;
    D = 0;
    #10;
    D = 0;
    #10;
    D = 0;
    #10;
    D = 0;
    #10;
    $finish();
    end
    
endmodule
