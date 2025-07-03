module four_bit_adder_subtractor(
    input [3:0] A,
    input [3:0] B,
    input subtract,
    output [3:0] Result,
    output Cout
);

    wire [3:0] B_xor; 
    wire C1, C2, C3;  

    assign B_xor = B ^ {4{subtract}};

    full_adder FA0 (
        .A(A[0]),
        .B(B_xor[0]),
        .Cin(subtract),  
        .S(Result[0]),
        .Cout(C1)
    );

    full_adder FA1 (
        .A(A[1]),
        .B(B_xor[1]),
        .Cin(C1),
        .S(Result[1]),
        .Cout(C2)
    );

    full_adder FA2 (
        .A(A[2]),
        .B(B_xor[2]),
        .Cin(C2),
        .S(Result[2]),
        .Cout(C3)
    );

    full_adder FA3 (
        .A(A[3]),
        .B(B_xor[3]),
        .Cin(C3),
        .S(Result[3]),
        .Cout(Cout)
    );

endmodule
