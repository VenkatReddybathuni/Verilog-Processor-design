`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2024 09:06:38
// Design Name: 
// Module Name: dynamic_tb
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


module dynamic_tb();
reg x, y, w, z;
wire f;

dynamic uut(.x(x), .y(y), .w(w), .z(z), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f));
    initial
    begin
    x = 1; y = 1; w = 1; z = 1;
    #100;
    x = 1; y = 1; w = 0; z = 1;
    #100;
    $finish();
    end
endmodule
