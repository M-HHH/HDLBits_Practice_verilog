module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        state <= next_state;
    end

    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        if(reset)
            next_state <= OFF;
        else 
            begin
                case(state)
                   OFF: begin
                       if(j == 1'b0)
                           next_state <= OFF;
                       else if (j == 1'b1)
                           next_state <= ON;
                   end
                    
                    ON : begin
                        if(k == 1'b0)
                            next_state <= ON;
                        else if (k == 1'b1)
                            next_state <= OFF;
                    end
                    
                    default : begin
                       next_state <= OFF; 
                    end
                endcase 
            end
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == OFF)?0:1;
endmodule
