`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.01.2024 03:09:51
// Design Name: 
// Module Name: johnson_ring_4bit
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


module johnson_ring_4bit(
    input clk, reset,
    output reg [3:0] Q
    );
    always@(posedge clk)
        begin
            if(!reset)
                begin
                    Q[3] <=0;
                    Q[2] <=0;
                    Q[1] <=0;
                    Q[0] <=0;
                end
            else begin 
                Q[3]<=Q[2];
                Q[2]<=Q[1];
                Q[1]<=Q[0];
                Q[0]<=(~Q[3]);
                end
        end   
endmodule
