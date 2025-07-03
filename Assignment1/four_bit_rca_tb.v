`timescale 1ns/10ps
module four_bit_rca_tb;

    reg [3:0] A, B;     
    reg Cin;            
    wire [3:0] S;       
    wire Cout;          

    four_bit_rca uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("dump.vcd");      
        $dumpvars(0, four_bit_rca_tb); 

        for (integer i = 0; i < 16; i = i + 1) begin
            for (integer j = 0; j < 16; j = j + 1) begin
                for (integer k = 0; k < 2; k = k + 1) begin
                    A = i; B = j; Cin = k; #10;
                    $display("A=%b B=%b Cin=%b | S=%b Cout=%b", A, B, Cin, S, Cout);
                end
            end
        end

        $display("Test completed.");
        $finish;  
    end

endmodule
