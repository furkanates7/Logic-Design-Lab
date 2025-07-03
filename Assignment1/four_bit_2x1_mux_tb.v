`timescale 1ns/10ps
module four_bit_2x1_mux_tb;

	reg [3:0] In_1;
	wire [3:0] Out;

	four_bit_2x1_mux uut (
		.In_1(In_1),
		.In_0(4'b0000),
		.Select(1'b0),
		.Out(Out)
	);

	integer i;

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, four_bit_2x1_mux_tb);

		for (i = 0; i < 16; i = i + 1) begin
			In_1 = i;
			#10;
			$display("In_1 = %b, Out = %b", In_1, Out);
		end

		$display("Test completed.");
		$finish;
	end

	
	
endmodule
