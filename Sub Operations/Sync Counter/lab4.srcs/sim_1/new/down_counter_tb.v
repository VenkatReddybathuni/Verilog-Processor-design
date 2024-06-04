`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2024 03:14:04
// Design Name: 
// Module Name: down_counter_tb
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


module down_counter_tb();
     reg clk;
     reg reset;
     reg preset;
     wire [3:0] Q;
     Down_counter uut(.clk(clk), .reset(reset), .preset(preset), .Q(Q));
     initial
//     begin
     clk = 1;
//     end
     always #5 clk = ~clk;
 
     initial
     begin
     reset = 1; preset = 0;
     #10;
     reset = 1; preset = 1;
     #100;
     reset = 1; preset = 0;
     #10; 
     reset = 1; preset = 1;
     #200;
     $finish();
     end
endmodule