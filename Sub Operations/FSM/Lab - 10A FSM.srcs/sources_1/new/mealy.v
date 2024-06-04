`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2024 20:45:45
// Design Name: 
// Module Name: mealy
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


`timescale 1ns / 1ps
module mealy(Clock, w, Resetn, z);
    input Clock, w, Resetn ; // w is the input and we are assuming active low reset
    output z ; // z is the output
    reg z;
    reg [2:0] y, Y; // Y is the next state variable, y is the present state variable
parameter [2:0]A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101, G = 3'b110, H = 3'b111;
always @(w or y)
begin
    case (y)
        A: if (w == 0)
        begin
            Y = E; z = 0;
        end
        else
        begin
            Y = B; z = 0;
        end
        B: if (w == 0)
        begin
            Y = C; z = 0;
        end
        else
        begin
            Y = B; z = 0;
        end
        C: if (w == 0)
        begin
            Y = E; z = 0;
        end
        else
        begin
            Y = D; z = 0;
        end
        D: if (w == 0)
        begin
            Y = C; z = 0;
        end
        else
        begin
            Y = G; z = 1;
        end
        E: if (w == 0)
        begin
            Y = E; z = 0;
        end
        else
        begin
            Y = F; z = 0;
        end
        F: if (w == 0)
        begin
            Y = C; z = 0;
        end
        else
        begin
            Y = G; z = 0;
        end
        G: if (w == 0)
        begin
            Y = C; z = 1;
        end
        else
        begin
            Y = B; z = 0;
        end
    endcase
end
always @(posedge Clock or negedge Resetn)
begin
if (Resetn == 0)
y <= A;
else
y <= Y;
end
endmodule