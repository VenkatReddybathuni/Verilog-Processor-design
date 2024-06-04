`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2024 08:46:26
// Design Name: 
// Module Name: static_tb
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


module static_tb();
reg x, y, w, z;
wire f;

static uut(.x(x), .y(y), .w(w), .z(z), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f));
    initial
    begin
    x = 1; y = 0; w = 1; z = 1;
    #10;
    x = 1; y = 0; w = 0; z = 1;
    #10;
    x = 1; y = 0; w = 1; z = 1;
    #10;
    x = 1; y = 0; w = 0; z = 1;
    #10;
    $finish();
    end
endmodule
