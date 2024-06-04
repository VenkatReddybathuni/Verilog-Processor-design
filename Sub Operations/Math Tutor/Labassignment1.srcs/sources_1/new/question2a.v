`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.01.2024 12:27:46
// Design Name: 
// Module Name: question2a
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


module question2a(
    input [2:0] select,
    input [0:4] number,
    output reg OUT
    );
always@(*)
begin
    if(select == 3'b000 && number[4] == 0)
    begin
        OUT =1;
    end 
    else if(select == 3'b001 && (number == 5'b00000 | number == 5'b11000 |number == 5'b10010 | number == 5'b01100 | number == 5'b01001 | number == 5'b00110 | number == 5'b00011 | number == 5'b10101 | number == 5'b11110 | number == 5'b11011 | number == 5'b01111))
    begin
        OUT =1;
    end
    else if(select == 3'b010 && number[3:4] == 00)
    begin
        OUT =1;
    end
    else if(select == 3'b011 && (number==5'b00000 | number==5'b10100 | number==5'b01010 | number==5'b00101 | number==5'b11001 | number==5'b11110 | number==5'b01111))
    begin
        OUT =1;
    end
    else if( select == 3'b100 && ( number==5'b00000 | number==5'b11000 | number==5'b10010 | number==5'b01100 | number==5'b00110 | number==5'b11110 ))
    begin
        OUT =1;
    end
    else if (select== 3'b101 &( number==5'b00000 | number==5'b11100 | number==5'b10101 | number==5'b01110 | number==5'b00111  ))
    begin
        OUT = 1;
    end
    else if (select == 3'b110 & number[2:4] == 000) 
    begin
        OUT = 1;
    end
    else if (select == 3'b111 &( number==5'b00000 | number==5'b10010 | number==5'b01001 | number==5'b11011 ))
    begin
      OUT = 1;
    end    
    else
    begin
      OUT = 0;
    end 
end
endmodule
