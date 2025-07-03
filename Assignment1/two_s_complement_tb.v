`timescale 1ns/10ps
module two_s_complement_tb;

    reg [3:0] In;         
    wire [3:0] Out;       

    two_s_complement uut (
        .In(In),
        .Out(Out)
    );

    initial begin
        $dumpfile("dump.vcd");       
        $dumpvars(0, two_s_complement_tb);

        for (integer i = 0; i < 16; i = i + 1) begin
            In = i; #10;  
            $display("In = %b, Out = %b", In, Out); 
        end

        $display("Test completed.");
        $finish; 
    end

endmodule
