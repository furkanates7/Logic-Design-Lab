module two_s_complement(In, Out);
    input [3:0] In;
    output [3:0] Out;
    
    assign Out = ~In + 1; 
endmodule
