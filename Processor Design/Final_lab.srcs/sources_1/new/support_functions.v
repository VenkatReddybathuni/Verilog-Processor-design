`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 15:22:10
// Design Name: 
// Module Name: support_functions
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


module ADD #(parameter n = 8)(
    input [n-1:0] A, B,
    output  cout,
    output [n-1:0] OUT
    );
    assign {cout,OUT} = A + B;
endmodule

module SUB #(parameter n = 8)(
    input [n-1:0] A, B,
    output  bout,
    output reg [n-1:0] OUT
    );
    assign bout = (A < B);

    always @* begin
        if (A < B)
            OUT <= B - A;
        else
            OUT <= A - B;
end
endmodule

module MUL #(parameter n = 8)(
    input [n-1:0] A, B,
    output reg [2*(n)-1:0] OUT
    );
    always @ * begin
    OUT <= A * B;
    end
endmodule

//module XRA #(parameter n = 8)(
//    input [n-1:0] A
//    );

