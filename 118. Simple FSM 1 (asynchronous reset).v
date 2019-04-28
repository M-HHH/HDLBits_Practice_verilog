module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(state)
            A: begin
                if(in == 1'b1)
                    next_state <= A;
                else
                    next_state <= B;
            end
                
            B: begin
                if(in == 1'b1)
                    next_state <= B;
                else
                    next_state <= A;
            end
            
            default: begin
               next_state <= B; 
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(areset)
            state <= B;
        else 
            state <= next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == A)?0:1;

endmodule
