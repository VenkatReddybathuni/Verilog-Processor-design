`timescale 1ns / 1ps

module counter(input clk, reset, [2:0] mode, output reg [3:0] Q);
    always @(negedge clk) begin
        if (mode == 2'b00)
            if (!reset)
                Q <= 4'b0000;
            else
                if (Q == 15)
                    Q <= 0;
                else
                    Q <= Q + 1;
                
        else if (mode == 2'b01)
            if (!reset)
                Q <= 4'b0000;
            else
                if (Q == 4'b0000)
                    Q <= 4'b1111;
                else
                    Q <= Q - 1;

        else if (mode == 2'b10)
            if (!reset)
                Q <= 4'b0000;
            else
                if (Q == 4'b1010)
                    Q <= 4'b0000;
                else
                    Q <= Q + 1;
                
        else
            if (!reset)
                Q <= 4'b0000;
            else
                if (Q == 4'b0000)
                    Q <= 4'b1010;
                else
                    Q <= Q - 1;
    end
endmodule
