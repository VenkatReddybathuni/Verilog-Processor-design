`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2024 08:37:43
// Design Name: 
// Module Name: static
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


module static(input x, y, w, z, output a, b, c, d ,e, f);

    not #(1) n1(a, w);
    nand #(1) g1(b, x, w);
    nand #(1) g2(c, a, y);
    nand #(1) g3(d, b, c);
    nand #(1) g4(e, w, z);
    nand #(1) g5(f, d, e);
    
endmodule
