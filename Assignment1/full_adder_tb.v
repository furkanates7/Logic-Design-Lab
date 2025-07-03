`timescale 1ns/10ps
module full_adder_tb;

    reg A, B, Cin;
    wire S, Cout;

    full_adder uut (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, full_adder_tb);

        for (integer i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i; #10;
            $display("A=%b B=%b Cin=%b | S=%b Cout=%b", A, B, Cin, S, Cout);
        end

        $finish;
    end

endmodule
