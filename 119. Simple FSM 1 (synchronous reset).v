// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
        end else begin
            case (present_state)
                // Fill in state transition logic
            endcase

            // State flip-flops
            present_state = next_state;   

            case (present_state)
                // Fill in output logic
            endcase
        end
    end

endmodule
