module full_adder(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);

    assign S = A ^ B ^ Cin;          
    assign Cout = (A & B) | (B & Cin) | (A & Cin); 

endmodule