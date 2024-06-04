`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.01.2024 17:57:20
// Design Name: 
// Module Name: top_module
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


module top_module(
    input clk, reset, en, transfer,
    input [1:0] c_mode, s_mode,
    //c_mode is for counter modes
    //s_mode is for shift register modes
    output [3:0] c_OUT,s_OUT
    //c_OUT is for counter Outputs
    //s_OUT is for shift register Outputs
    );
    counter inst1(.clk(clk), .reset(reset), .en(en), .M(c_mode), .Q(c_OUT));
    shift_register_4bit inst2(.Q(c_OUT), .mode(s_mode), .en(~en), .transfer(transfer), .clk(clk), .OUT(s_OUT));
endmodule
