module machine_jk(
    input wire x,      
    input wire CLK,    
    input wire RESET,  
    output wire F,     
    output wire [2:0] S 
);
   
    wire Q0, Q1, Q2;
    
    wire J0, K0, J1, K1, J2, K2;
    
    assign S = {Q2, Q1, Q0};  
    
    assign F = (S == 3'b111) ? 1 : 0;
    
    jkff jkff0 (.J(J0), .K(K0), .CLK(CLK), .RESET(RESET), .Q(Q0));
    jkff jkff1 (.J(J1), .K(K1), .CLK(CLK), .RESET(RESET), .Q(Q1));
    jkff jkff2 (.J(J2), .K(K2), .CLK(CLK), .RESET(RESET), .Q(Q2));
    
  
    assign J0 = (S == 3'b000) ? (x ? 1 : 0) : (S == 3'b001) ? (x ? 0 : 1) : 
                (S == 3'b010) ? (x ? 0 : 1) : (S == 3'b011) ? (x ? 0 : 1) : 
                (S == 3'b100) ? (x ? 0 : 1) : (S == 3'b101) ? (x ? 0 : 1) :
                (S == 3'b110) ? (x ? 0 : 1) : 0;  
    
    assign K0 = (S == 3'b000) ? (x ? 0 : 1) : (S == 3'b001) ? (x ? 1 : 0) : 
                (S == 3'b010) ? (x ? 1 : 0) : (S == 3'b011) ? (x ? 1 : 0) : 
                (S == 3'b100) ? (x ? 1 : 0) : (S == 3'b101) ? (x ? 1 : 0) :
                (S == 3'b110) ? (x ? 1 : 0) : 0;  
    
    assign J1 = (S == 3'b000) ? (x ? 0 : 1) : (S == 3'b001) ? (x ? 1 : 0) : 
                (S == 3'b010) ? (x ? 1 : 0) : (S == 3'b011) ? (x ? 1 : 0) : 
                (S == 3'b100) ? (x ? 1 : 0) : (S == 3'b101) ? (x ? 1 : 0) :
                (S == 3'b110) ? (x ? 1 : 0) : 0;  
    
    assign K1 = (S == 3'b000) ? (x ? 0 : 1) : (S == 3'b001) ? (x ? 1 : 0) : 
                (S == 3'b010) ? (x ? 1 : 0) : (S == 3'b011) ? (x ? 1 : 0) : 
                (S == 3'b100) ? (x ? 1 : 0) : (S == 3'b101) ? (x ? 1 : 0) :
                (S == 3'b110) ? (x ? 1 : 0) : 0;  
    
    assign J2 = (S == 3'b000) ? (x ? 1 : 0) : (S == 3'b001) ? (x ? 0 : 1) : 
                (S == 3'b010) ? (x ? 1 : 0) : (S == 3'b011) ? (x ? 0 : 1) : 
                (S == 3'b100) ? (x ? 0 : 1) : (S == 3'b101) ? (x ? 0 : 1) :
                (S == 3'b110) ? (x ? 0 : 1) : 0;  
    
    assign K2 = (S == 3'b000) ? (x ? 0 : 1) : (S == 3'b001) ? (x ? 1 : 0) : 
                (S == 3'b010) ? (x ? 1 : 0) : (S == 3'b011) ? (x ? 1 : 0) : 
                (S == 3'b100) ? (x ? 1 : 0) : (S == 3'b101) ? (x ? 1 : 0) :
                (S == 3'b110) ? (x ? 1 : 0) : 0;  
endmodule
