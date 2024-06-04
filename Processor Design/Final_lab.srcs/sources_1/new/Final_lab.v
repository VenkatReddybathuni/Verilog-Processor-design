`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 15:11:14
// Design Name: 
// Module Name: Final_lab
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

module main_module #(parameter n = 8, k = 16)(
    input clk,en,reset,
    output reg [n-1:0] OUT1, OUT2
    );
    wire slow_clk;
    reg [n - 1:0] registers [0:k - 1];
    reg [n-1:0] commands [0 : k-1];
    reg C_B;
    reg [n-1:0] Acc, EXT;
    reg [4:0]PC = 0;
    reg [n-1:0] b;
    integer i;
    clock_divider inst1(.main_clk(clk), .slow_clk(slow_clk));
    always @(posedge slow_clk) begin
        if (en & reset == 0) begin
        registers[0] <= 8'b000;
        registers[1] <= 8'b001;
        registers[2] <= 8'b010;
        registers[3] <= 8'b011;
        registers[4] <= 8'b100;
        registers[5] <= 8'b101;
        registers[6] <= 8'b110;
        registers[7] <= 8'b111;
        registers[8] <= 8'b1000;
        registers[9] <= 8'b1001;
        registers[10] <= 8'b1010;
        registers[11] <= 8'b1011;
        registers[12] <= 8'b1100;
        registers[13] <= 8'b1101;
        registers[14] <= 8'b1110;
        registers[15] <= 8'b1111;
        commands[0] <= 8'b10010001;
        commands[1] <= 8'b01100001;
        commands[2] <= 8'b00010101;
        commands[3] <= 8'b00010110;
        commands[4] <= 8'b10100111;
        commands[5] <= 8'b11111111;
        
        OUT1 <= 0; // Reset outputs
        OUT2 <= 0;
        C_B <= 0; 
        PC <= 0;
        end
        else if(en & reset) begin
        if(PC < k) begin
            if(commands[PC][n-1:n/2] == 4'b0001)
            begin
                {C_B, Acc} <= Acc + registers[commands[PC][n/2-1:0]];
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC][n/2-1:0]];
            end
            else if(commands[PC][n-1:n/2] == 4'b1001)
            begin
                Acc <= registers[commands[PC][n/2-1:0]];
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC][n/2-1:0]];
            end
            else if(commands[PC][n-1:n/2] == 4'b1010)
            begin
                registers[commands[PC][n/2-1:0]] <= Acc;
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC][n/2-1:0]];
            end
            else if(commands[PC][n-1:n/2] == 4'b0110)
            begin
                Acc <= Acc ^ registers[commands[PC][n/2-1:0]];
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC][n/2-1:0]];
            end
            else if(commands[PC] == 8'b11111111)
            begin
                PC <= k;  
            end
            else if(commands[PC][n-1:n/2] == 4'b0010)
            begin
                C_B <= (Acc < registers[commands[PC][n/2-1:0]]);
                if(Acc < registers[commands[PC][n/2-1:0]]) begin
                Acc <= registers[commands[PC][n/2-1:0]] - Acc;
                end
                else begin
                Acc <= Acc - registers[commands[PC][n/2-1:0]];
                end
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC][n/2-1:0]];
            end
            else if(commands[PC][n-1:n/2] == 4'b0011)
            begin
                {EXT, Acc} = Acc * registers[commands[PC][n/2-1:0]];
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC][n/2-1:0]];
            end
            else if(commands[PC][n-1:n/2] == 4'b0100)
            begin
//                write it
                b = registers[commands[PC][(n/2)-1:0]];
                EXT = 0;
                for (i = 0; i < n; i = i + 1) begin
                EXT = {EXT[(n-2):0], Acc[(n-1)]}; // Shifting EXT to the left by one and adding the most significant bit of Acc
                Acc[(n-1):1] = Acc[(n-2):0]; // Shifting Acc to the left by one
                EXT = EXT - b; // Subtracting b from EXT
                if (EXT[(n-1)] == 1) begin // Checking if the most significant bit of EXT is 1
                Acc[0] = 0;
                EXT = EXT + b; // Restoring EXT if subtraction resulted in a negative value
                end
                else Acc[0] = 1;
                end
                OUT1 = Acc;
                OUT2 = registers[commands[PC][n/2-1:0]];
            end
            else if(commands[PC] == 8'b0000001)
            begin
                Acc <= {Acc[n-2:0], 1'b0};
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC]];
            end
            else if(commands[PC] == 8'b0000010)
            begin
                Acc <= {1'b0, Acc[n-1:1]};
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC]];
            end
            else if(commands[PC] == 8'b0000011)
            begin
                Acc <= {Acc[0], Acc[n-1:1]};
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC]];
            end
            else if(commands[PC] == 8'b00000100)
            begin
                Acc <= {Acc[n-2:0], Acc[n-1]};
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC]];
            end
            else if(commands[PC] == 8'b00000101)
            begin
                Acc <= {Acc[n-1], Acc[n-1:1]};
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC]];
            end
            else if(commands[PC][n-1:n/2] == 4'b0101)
            begin
                Acc = Acc & registers[commands[PC][n/2-1:0]];
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC][n/2-1:0]];
            end
            else if(commands[PC][n-1:n/2] == 4'b0111)
            begin
                if(Acc >= registers[commands[PC][n/2-1:0]]) begin
                C_B <= 0;
                end
                else C_B <= 1;
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC][n/2-1:0]];
            end
            else if(commands[PC] == 8'b00000110)
            begin
                {C_B, Acc} = Acc + 1;
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC]];
            end
            else if(commands[PC] == 8'b00000111)
            begin
                if (Acc == 0) C_B <= 1;
                else C_B <= 0;
                Acc <= Acc - 1;
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC]];
            end
            else if(commands[PC][n-1:n/2] == 4'b1000)
            begin
                if(C_B == 1) begin
                PC <= commands[PC][n/2-1:0] - 1;
                end
                OUT1 <= C_B;
                OUT2 <= commands[PC][n/2-1:0];
            end
            else if(commands[PC][n-1:n/2] == 4'b1011)
            begin
                PC <= commands[PC][n/2-1:0] - 1;
                OUT1 <= Acc;
                OUT2 <= registers[commands[PC][n/2-1:0]];
            end
            PC <= PC+1;
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