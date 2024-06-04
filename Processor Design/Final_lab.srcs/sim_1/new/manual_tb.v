`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2024 20:47:22
// Design Name: 
// Module Name: manual_tb
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


module manual_tb();
    reg clk,en,reset;
    reg [7:0] OPCODE;
    wire [7:0] OUT1, OUT2;
    manual uut(.clk(clk), .en(en), .reset(reset), .OPCODE(OPCODE), .OUT1(OUT1), .OUT2(OUT2));
    initial
    begin
    clk = 1;
    forever #5 clk = ~clk;
    end
    initial
    begin
    en = 1; reset = 0; OPCODE = 8'b10010001;
    #10;
    en = 1; reset = 1; OPCODE = 8'b10010001;
    #10;
    en = 1; reset = 1; OPCODE = 8'b01100001;
    #10;
    en = 1; reset = 1; OPCODE = 8'b00010101;
    #10;
    en = 1; reset = 1; OPCODE = 8'b01000110;
    #10;
    en = 1; reset = 1; OPCODE = 8'b10100111;
    #10;
    en = 1; reset = 1; OPCODE = 8'b00000000;
    #10;
    en = 1; reset = 1; OPCODE = 8'b11111111;
    #10;
    
    
    
    
    $finish();
    end

endmodule
