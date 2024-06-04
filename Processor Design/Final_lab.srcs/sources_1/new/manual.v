`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2024 20:37:43
// Design Name: 
// Module Name: manual
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


module manual #(parameter n = 8, k = 16)(
    input clk,en,reset,
    input [n-1 :0] OPCODE,
    output reg [n-1:0] OUT1, OUT2
    );
//    wire slow_clk;
    reg [n - 1:0] registers [0:k - 1];
    reg C_B;
    reg [n-1:0] Acc, EXT;
    reg [4:0]PC = 0;
    reg [n-1:0] b;
    reg [n-1:0] temp_a;
    integer i;
//    clock_divider inst1(.main_clk(clk), .slow_clk(slow_clk));
    always @(posedge clk) begin
        if (en & reset == 0) begin
        registers[0] <= 8'b000;
        registers[1] <= 8'b001;
        registers[2] <= 8'b010;
        registers[3] <= 8'b011;
        registers[4] <= 8'b100;
        registers[5] <= 8'b1000;
        registers[6] <= 8'b010;
        registers[7] <= 8'b111;
        registers[8] <= 8'b1000;
        registers[9] <= 8'b1001;
        registers[10] <= 8'b1010;
        registers[11] <= 8'b1011;
        registers[12] <= 8'b1100;
        registers[13] <= 8'b1101;
        registers[14] <= 8'b1110;
        registers[15] <= 8'b1111; 
        OUT1 <= Acc; // Reset outputs
        OUT2 <= 0;
        C_B <= 0; 
        PC <= 0;
        
        end
        else if(en & reset) begin
        if(PC < k) begin
            if(OPCODE[n-1:n/2] == 4'b0001)
            begin
                {C_B, Acc} <= Acc + registers[OPCODE[n/2-1:0]];
            end
            else if(OPCODE[n-1:n/2] == 4'b1001)
            begin
                Acc <= registers[OPCODE[n/2-1:0]];
            end
            else if(OPCODE[n-1:n/2] == 4'b1010)
            begin
                registers[OPCODE[n/2-1:0]] <= Acc;
            end
            else if(OPCODE[n-1:n/2] == 4'b0110)
            begin
                Acc <= Acc ^ registers[OPCODE[n/2-1:0]];
            end
            else if(OPCODE == 8'b11111111)
            begin
                PC <= k;  
            end
            else if(OPCODE[n-1:n/2] == 4'b0010)
            begin
                C_B <= (Acc < registers[OPCODE[n/2-1:0]]);
                if(Acc < registers[OPCODE[n/2-1:0]]) begin
                Acc <= registers[OPCODE[n/2-1:0]] - Acc;
                end
                else begin
                Acc <= Acc - registers[OPCODE[n/2-1:0]];
                end
            end
            else if(OPCODE[n-1:n/2] == 4'b0011)
            begin
                {EXT, Acc} = Acc * registers[OPCODE[n/2-1:0]];
            end
            else if(OPCODE[n-1:n/2] == 4'b0100)
            begin
//                write it
                b = registers[OPCODE[(n/2)-1:0]];
                EXT = 0;
                for (i = 0; i < n; i = i + 1) begin
                EXT = {EXT[n-2:0], Acc[n-1]};
                Acc[n-1:1] = Acc[n-2:0]; 
                EXT = EXT - b; 
                if (EXT[n-1] == 1) begin 
                Acc[0] = 0;
                EXT = EXT + b; 
                end
                else Acc[0] = 1;
            end
            end
            else if(OPCODE == 8'b0000001)
            begin
                Acc <= {Acc[n-2:0], 1'b0};
            end
            else if(OPCODE == 8'b0000010)
            begin
                Acc <= {1'b0, Acc[n-1:1]};
            end
            else if(OPCODE == 8'b0000011)
            begin
                Acc <= {Acc[0], Acc[n-1:1]};
            end
            else if(OPCODE == 8'b00000100)
            begin
                Acc <= {Acc[n-2:0], Acc[n-1]};
            end
            else if(OPCODE == 8'b00000101)
            begin
                Acc <= {Acc[n-1], Acc[n-1:1]};
            end
            else if(OPCODE[n-1:n/2] == 4'b0101)
            begin
                Acc = Acc & registers[OPCODE[n/2-1:0]];
            end
            else if(OPCODE[n-1:n/2] == 4'b0111)
            begin
                if(Acc >= registers[OPCODE[n/2-1:0]]) begin
                C_B <= 0;
                end
                else C_B <= 1;
            end
            else if(OPCODE == 8'b00000110)
            begin
                {C_B, Acc} = Acc + 1;
            end
            else if(OPCODE == 8'b00000111)
            begin
                if (Acc == 0) C_B <= 1;
                else C_B <= 0;
                Acc <= Acc - 1;
            end
            else if(OPCODE[n-1:n/2] == 4'b1000)
            begin
                if(C_B == 1) begin
                PC <= OPCODE[n/2-1:0] - 1;
                end
            end
            else if(OPCODE[n-1:n/2] == 4'b1011)
            begin
                PC <= OPCODE[n/2-1:0] - 1;
            end
            PC <= PC+1;
            OUT1 <= Acc;
                OUT2 <= registers[OPCODE[n/2-1:0]];
        end
        else begin
        OUT1 <= 0; // Reset outputs
        OUT2 <= 0;
        Acc <= 8'bX; // Reset accumulator
        C_B <= 0; 
        end
        end
    end
endmodule
