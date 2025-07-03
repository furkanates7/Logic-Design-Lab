module machine_d(
    input wire x,      
    input wire CLK,   
    input wire RESET, 
    output wire F,     
    output wire [2:0] S 
);

    
    wire Q0, Q1, Q2;
    
   
    wire D0, D1, D2;
    
    assign S = {Q2, Q1, Q0};  
    
    assign F = (S == 3'b111) ? 1 : 0;
    
   
    dff dff0 (.D(D0), .CLK(CLK), .RESET(RESET), .Q(Q0));
    dff dff1 (.D(D1), .CLK(CLK), .RESET(RESET), .Q(Q1));
    dff dff2 (.D(D2), .CLK(CLK), .RESET(RESET), .Q(Q2));
    
    
    assign D0 = (S == 3'b000) ? (x ? 1 : 0) : (S == 3'b001) ? (x ? 0 : 1) : 
                (S == 3'b010) ? (x ? 0 : 1) : (S == 3'b011) ? (x ? 0 : 1) : 
                (S == 3'b100) ? (x ? 0 : 1) : (S == 3'b101) ? (x ? 0 : 1) :
                (S == 3'b110) ? (x ? 0 : 1) : 0;  
    
    assign D1 = (S == 3'b000) ? (x ? 0 : 1) : (S == 3'b001) ? (x ? 1 : 0) : 
                (S == 3'b010) ? (x ? 1 : 0) : (S == 3'b011) ? (x ? 1 : 0) : 
                (S == 3'b100) ? (x ? 1 : 0) : (S == 3'b101) ? (x ? 1 : 0) :
                (S == 3'b110) ? (x ? 1 : 0) : 0;  
    
    assign D2 = (S == 3'b000) ? (x ? 1 : 0) : (S == 3'b001) ? (x ? 0 : 1) : 
                (S == 3'b010) ? (x ? 1 : 0) : (S == 3'b011) ? (x ? 0 : 1) : 
                (S == 3'b100) ? (x ? 0 : 1) : (S == 3'b101) ? (x ? 0 : 1) :
                (S == 3'b110) ? (x ? 0 : 1) : 0;  
endmodule
