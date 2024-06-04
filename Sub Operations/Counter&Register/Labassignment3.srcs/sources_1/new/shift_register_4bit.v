`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2024 17:36:12
// Design Name: 
// Module Name: shift_register_4bit
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


module shift_register_4bit(
    input [3:0]Q,
    input [1:0] mode,
    // mode[1] = 0 is no shift
    //mode = 2'b10 is right shift
    // mode = 2'b11 is left shift
    input en, transfer,
    //transfer is high means parallel copy of bits from counter and low is for not copying 
    input clk,
    output reg [3:0]OUT
    );
    always@(posedge clk)
    begin 
    #0.01;
    if(transfer & en)
    OUT = Q;
    if(mode[1] == 1 & en)
    begin
        if(mode[0] == 1)
        begin
        OUT <= OUT >> 1;
        end
        else
        OUT <= OUT << 1;
    end
    else if(en)
    OUT <= OUT;
    else
    OUT <= 4'b0000;
    //when en = 0 OUT will be 0000
    end
endmodule
