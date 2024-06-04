`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2024 03:05:15
// Design Name: 
// Module Name: universal_shift_register
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

module clock_divider(
    input main_clk,
    output slow_clk);
    reg [31: 0] counter;
    always@ (posedge main_clk)
    begin
    counter <= counter + 1;
    end
    assign slow_clk= counter[27];
endmodule
// Use normal clk for simulation purposes
module universal_shift_register(
    input [3:0]Q,
    input [1:0] mode,
    // mode = 2'b00 is no shift
    // mode = 2'b01 is parallel load
    //mode = 2'b10 is left shift
    // mode = 2'b11 is right shift
    input reset,
    input clk,
    output reg [3:0]OUT
    );
    wire slow_clk;
    clock_divider inst(.main_clk(clk), .slow_clk(slow_clk));
    always@(posedge slow_clk)
    begin 
    if(reset == 0)
    OUT <= 4'b0000;
    else if(mode == 2'b01)
    OUT <= Q;
    else if(mode == 2'b11)
    begin
    OUT <= {1'b0,OUT[3:1]};
    end
    else if (mode ==2'b10)
    begin
        OUT <= {OUT[2:0],1'b0};
    end
    else if(2'b00)
    OUT <= OUT;
    
    //when en = 0 OUT will be 0000
    end
endmodule
