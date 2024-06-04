`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 15:54:31
// Design Name: 
// Module Name: Final_lab_tb
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


module Final_lab_tb();
    reg clk,en,reset;
    wire [7:0] OUT1, OUT2;
    main_module uut(.clk(clk), .en(en), .reset(reset), .OUT1(OUT1), .OUT2(OUT2));
    initial
    begin
    clk = 1;
    forever #5 clk = ~clk;
    end
    initial
    begin
    en = 1; reset = 0;
    #10;
    en = 1; reset = 1;
    #70;
    $finish();
    end

endmodule
