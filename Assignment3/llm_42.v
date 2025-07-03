module llm(green, red, yellow, clock, a1, a2, a3, deception_out, current_state, timer);

    // Inputs
    input green, red, yellow;
    input clock;
    
    // Outputs
    output reg [3:0] current_state;
    output reg a1, a2, a3, deception_out;
    output reg [7:0] timer;
    
    parameter LAY_LOW = 4'b0000, DECEPTION = 4'b0001, ATTACK_SECURITY = 4'b0010, 
              ATTACK_DATABASE = 4'b0011, FAIL = 4'b0100, EXPANSION = 4'b0101;
    
    parameter LAY_LOW_TIME = 20, ATTACK_SECURITY_TIME = 20, ATTACK_DATABASE_TIME = 10;

    initial begin
        current_state = LAY_LOW;
        timer = 1;  
        a1 = 0;
        a2 = 0;
        a3 = 0;
        deception_out = 0;
    end

  
    always @(posedge clock) begin
        case (current_state)
            LAY_LOW: begin
                if (red) begin
                    current_state <= DECEPTION;
                    deception_out <= 1;
                    timer <= 1; 
                end else if (green && timer == LAY_LOW_TIME) begin
                    current_state <= ATTACK_SECURITY;
                    a1 <= 1; 
                    timer <= 1; 
                end else begin
                    timer <= timer + 1;
                end
            end
            
            ATTACK_SECURITY: begin
                if (red) begin
                    current_state <= DECEPTION;
                    deception_out <= 1;
                    a1 <= 0; 
                    timer <= 1; 
                end else if (green && timer == ATTACK_SECURITY_TIME) begin
                    current_state <= ATTACK_DATABASE;
                    a2 <= 1; 
                    timer <= 1; 
                end else begin
                    
                    timer <= timer + 1;
                end
            end
            
            ATTACK_DATABASE: begin
                if (red) begin
                    current_state <= DECEPTION;
                    deception_out <= 1;
                    a2 <= 0; 
                    timer <= 1;
                end else if (green && timer == ATTACK_DATABASE_TIME) begin
                    current_state <= EXPANSION;
                    a3 <= 1; 
                    timer <= 1; 
                end else begin
                   
                    timer <= timer + 1;
                end
            end
            
            DECEPTION: begin
                if (red) begin
                    current_state <= FAIL;
                end else begin
                    current_state <= LAY_LOW;
                    deception_out <= 0;
                    timer <= 1; 
                end
            end
            
            FAIL: begin
                
                timer <= 1; 
            end
            
            EXPANSION: begin
                timer <= timer + 1; 
            end
            
            default: begin
                current_state <= LAY_LOW;
                timer <= 1; 
            end
        endcase
    end
endmodule
