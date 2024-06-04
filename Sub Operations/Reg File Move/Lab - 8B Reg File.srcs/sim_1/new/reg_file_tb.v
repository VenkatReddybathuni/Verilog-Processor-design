`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2024 00:48:46
// Design Name: 
// Module Name: reg_file_tb
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


//module reg_file_tb();
//reg [3:0]D;
//reg reset, clk;
//reg [1:0]mode;
//wire [3:0]Q;

//regi uut (.D(D), .clk(clk), .reset(reset), .mode(mode), .Q(Q));
//initial
//clk = 0;
//always #2 clk = ~clk;

//initial
//    begin
//    D = 4'b1100; mode = 11; reset = 1;
//    #10;
//    mode = 10; reset = 1;
//    #10;
//    mode = 01; reset = 1;
//    #10;
//    mode = 00; reset = 1;
//    #10;
//    $finish();
//    end
//endmodule

module reg_file_tb();

reg [3:0] D;
reg clk, reset;
reg mode;
reg [2:0] src_register, dest_register;
wire [3:0] Q;

// Instantiate the reg_file module
reg_file uut (
    .D(D),
    .clk(clk),
    .reset(reset),
    .mode(mode),
    .src_register(src_register),
    .dest_register(dest_register),
    .Q(Q)
);

// Clock generation
initial begin
    clk = 0;
    forever #2 clk = ~clk;
end

initial begin

    mode = 0;
    src_register = 3'b000;
    dest_register = 3'b001;
    D = 4'b1010;
    reset = 0;
    #10;
    
    reset = 1;
    #10 
    
    mode = 1;
    #10

    $finish;
end

endmodule
