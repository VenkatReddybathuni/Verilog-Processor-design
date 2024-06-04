`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 12.01.2024 13:21:07
//// Design Name: 
//// Module Name: question1a
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


module question1a(
    input [2:0] select,
    input [0:4] number,
    output reg OUT
);

  reg [0:31] O;

  always @* begin
    O[0]  = (~number[0]  & ~number[1]  & ~number[2]  & ~number[3]  & ~number[4]);
    O[1]  = (~number[0]  & ~number[1]  & ~number[2]  & ~number[3]  &  number[4]);
    O[2]  = (~number[0]  & ~number[1]  & ~number[2]  &  number[3]  & ~number[4]);
    O[3]  = (~number[0]  & ~number[1]  & ~number[2]  &  number[3]  &  number[4]);
    O[4]  = (~number[0]  & ~number[1]  &  number[2]  & ~number[3]  & ~number[4]);
    O[5]  = (~number[0]  & ~number[1]  &  number[2]  & ~number[3]  &  number[4]);
    O[6]  = (~number[0]  & ~number[1]  &  number[2]  &  number[3]  & ~number[4]);
    O[7]  = (~number[0]  & ~number[1]  &  number[2]  &  number[3]  &  number[4]);
    O[8]  = (~number[0]  &  number[1]  & ~number[2]  & ~number[3]  & ~number[4]);
    O[9]  = (~number[0]  &  number[1]  & ~number[2]  & ~number[3]  &  number[4]);
    O[10] = (~number[0]  &  number[1]  & ~number[2]  &  number[3]  & ~number[4]);
    O[11] = (~number[0]  &  number[1]  & ~number[2]  &  number[3]  &  number[4]);
    O[12] = (~number[0]  &  number[1]  &  number[2]  & ~number[3]  & ~number[4]);
    O[13] = (~number[0]  &  number[1]  &  number[2]  & ~number[3]  &  number[4]);
    O[14] = (~number[0]  &  number[1]  &  number[2]  &  number[3]  & ~number[4]);
    O[15] = (~number[0]  &  number[1]  &  number[2]  &  number[3]  &  number[4]);
    O[16] = ( number[0]  & ~number[1]  & ~number[2]  & ~number[3]  & ~number[4]);
    O[17] = ( number[0]  & ~number[1]  & ~number[2]  & ~number[3]  &  number[4]);
    O[18] = ( number[0]  & ~number[1]  & ~number[2]  &  number[3]  & ~number[4]);
    O[19] = ( number[0]  & ~number[1]  & ~number[2]  &  number[3]  &  number[4]);
    O[20] = ( number[0]  & ~number[1]  &  number[2]  & ~number[3]  & ~number[4]);
    O[21] = ( number[0]  & ~number[1]  &  number[2]  & ~number[3]  &  number[4]);
    O[22] = ( number[0]  & ~number[1]  &  number[2]  &  number[3]  & ~number[4]);
    O[23] = ( number[0]  & ~number[1]  &  number[2]  &  number[3]  &  number[4]);
    O[24] = ( number[0]  &  number[1]  & ~number[2]  & ~number[3]  & ~number[4]);
    O[25] = ( number[0]  &  number[1]  & ~number[2]  & ~number[3]  &  number[4]);
    O[26] = ( number[0]  &  number[1]  & ~number[2]  &  number[3]  & ~number[4]);
    O[27] = ( number[0]  &  number[1]  & ~number[2]  &  number[3]  &  number[4]);
    O[28] = ( number[0]  &  number[1]  &  number[2]  & ~number[3]  & ~number[4]);
    O[29] = ( number[0]  &  number[1]  &  number[2]  & ~number[3]  &  number[4]);
    O[30] = ( number[0]  &  number[1]  &  number[2]  &  number[3]  & ~number[4]);
    O[31] = ( number[0]  &  number[1]  &  number[2]  &  number[3]  &  number[4]);

    case (select)
      3'b000: OUT = (O[0] | O[2] | O[4] | O[6] | O[8] | O[10] | O[12] | O[14] | O[16] | O[18] | O[20] | O[22] | O[24] | O[26] | O[28] | O[30]);
      3'b001: OUT = (O[0] | O[3] | O[6] | O[9] | O[12] | O[15] | O[18] | O[21] | O[24] | O[27] | O[30]);
      3'b010: OUT = (O[0] | O[4] | O[8] | O[12] | O[16] | O[20] | O[24] | O[28]);
      3'b011: OUT = (O[0] | O[5] | O[10] | O[15] | O[20] | O[25] | O[30]);
      3'b100: OUT = (O[0] | O[6] | O[12] | O[18] | O[24] | O[30]);
      3'b101: OUT = (O[0] | O[7] | O[14] | O[21] | O[28]);
      3'b110: OUT = (O[0] | O[8] | O[16] | O[24]);
      3'b111: OUT = (O[0] | O[9] | O[18] | O[27]);
      default: OUT = 0; // Default case when select is not 3'b000 - 3'b111
    endcase
  end

endmodule
