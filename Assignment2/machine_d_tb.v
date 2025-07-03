`timescale 1ns / 1ps

module machine_d_tb;
    reg x;
    reg CLK;
    reg RESET;
    wire F;
    wire [2:0] S;

    
    machine_d uut (
        .x(x),
        .CLK(CLK),
        .RESET(RESET),
        .F(F),
        .S(S)
    );

    
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;  
    end

    
    initial begin
        RESET = 1; x = 0;
        #10 RESET = 0;  
        
        x = 1; #10; 
        x = 0; #10; 
        x = 1; #10; 
        x = 0; #10; 
        x = 1; #10; 
        
        RESET = 1; #10;
        RESET = 0; #10;
        
        $finish;  
    end

    initial begin
        $monitor("Time: %0t | x: %b | RESET: %b | S: %b | F: %b", $time, x, RESET, S, F);
    end
endmodule
