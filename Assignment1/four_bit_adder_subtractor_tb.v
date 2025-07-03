`timescale 1ns/10ps
module four_bit_subtractor_tb;

    reg [3:0] A, B;         
    reg subtract;          
    wire [3:0] Result;     
    wire Cout;            

    four_bit_adder_subtractor uut (
        .A(A),
        .B(B),
        .subtract(subtract),
        .Result(Result),
        .Cout(Cout)
    );

    initial begin
        {A, B} = 8'b00000000; subtract = 0; #10;
        {A, B} = 8'b00010001; subtract = 1; #10;
        {A, B} = 8'b01010011; subtract = 1; #10;
        {A, B} = 8'b11101100; subtract = 0; #10;
        $finish;  
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, four_bit_subtractor_tb);  
    end

endmodule
