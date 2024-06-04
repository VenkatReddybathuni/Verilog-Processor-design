`timescale 1ns / 1ps

module adder(
    input a, b, cin,
    output OUT, cout
);
    // sum is equal to xor(a, b, cin)
    xor G1 (OUT, a, b, cin);
    //carry is majority function
    and G2 (o1, a, b);
    and G3 (o2, b, cin);
    and G4 (o3, cin, a);
    or G5 (cout, o1, o2, o3);
endmodule

module add_or_sub_8bit(
    input Mode, carry_borrow_in,
    input [7:0] A, B,
    output [7:0] C,
    output reg carry_borrow_out
    );
    wire [7:0] B0, Carry;
    //finding 2's complement of B in case the mode = 1
    adder inst00 (.a(~B[0]), .b(1), .cin(0), .OUT(B0[0]), .cout(Carry[0]));
    adder inst01 (.a(~B[1]), .b(0), .cin(Carry[0]), .OUT(B0[1]), .cout(Carry[1]));
    adder inst02 (.a(~B[2]), .b(0), .cin(Carry[1]), .OUT(B0[2]), .cout(Carry[2]));
    adder inst03 (.a(~B[3]), .b(0), .cin(Carry[2]), .OUT(B0[3]), .cout(Carry[3]));
    adder inst04 (.a(~B[4]), .b(0), .cin(Carry[3]), .OUT(B0[4]), .cout(Carry[4]));
    adder inst05 (.a(~B[5]), .b(0), .cin(Carry[4]), .OUT(B0[5]), .cout(Carry[5]));
    adder inst06 (.a(~B[6]), .b(0), .cin(Carry[5]), .OUT(B0[6]), .cout(Carry[6]));
    adder inst07 (.a(~B[7]), .b(0), .cin(Carry[6]), .OUT(B0[7]), .cout(Carry[7]));

    reg [7:0] B_final;
    always @* begin
        //Finalizing the B value based on Mode value
        // B_final = B if ,ode = 0 and B_final = 2's complement of B
        if(Mode == 0)
        begin
        B_final = B;
        end 
        else
        begin
        B_final = B0;
        end
    end
    //Applying 8 bit addition function
    wire [7:0] Carry1;
    adder inst0 (.a(A[0]), .b(B_final[0]), .cin(carry_borrow_in), .OUT(C[0]), .cout(Carry1[0]));
    adder inst1 (.a(A[1]), .b(B_final[1]), .cin(Carry1[0]), .OUT(C[1]), .cout(Carry1[1]));
    adder inst2 (.a(A[2]), .b(B_final[2]), .cin(Carry1[1]), .OUT(C[2]), .cout(Carry1[2]));
    adder inst3 (.a(A[3]), .b(B_final[3]), .cin(Carry1[2]), .OUT(C[3]), .cout(Carry1[3]));
    adder inst4 (.a(A[4]), .b(B_final[4]), .cin(Carry1[3]), .OUT(C[4]), .cout(Carry1[4]));
    adder inst5 (.a(A[5]), .b(B_final[5]), .cin(Carry1[4]), .OUT(C[5]), .cout(Carry1[5]));
    adder inst6 (.a(A[6]), .b(B_final[6]), .cin(Carry1[5]), .OUT(C[6]), .cout(Carry1[6]));
    adder inst7 (.a(A[7]), .b(B_final[7]), .cin(Carry1[6]), .OUT(C[7]), .cout(Carry1[7]));
    // Carry_borrow_out assignement as there will be a negation caused by 2's complement when we are using 2's compelement
    always @* begin
    if(Mode == 1 & B != 8'b00000)
    begin
    carry_borrow_out = ~Carry1[7];
    end 
    else
    begin
    carry_borrow_out = Carry1[7];
    end
    end
endmodule
