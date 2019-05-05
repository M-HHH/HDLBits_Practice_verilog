module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

     parameter LEFT=0, RIGHT=1;
    reg state, next_state;

    always @(*) begin
        // State transition logic
        state <= next_state;
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            next_state <= LEFT;
        else
            begin
                case(state)
                    LEFT : begin
                        if(bump_left)
                            next_state <= RIGHT;
                        else
                            next_state <= LEFT;
                    end

                    RIGHT : begin
                        if(bump_right)
                            next_state <= LEFT;
                        else
                            next_state <= RIGHT;
                    end

                    default: begin
                        next_state <= LEFT;
                    end
                endcase
            end
    end

    // Output logic
    // assign walk_left = (state == ...);
    // assign walk_right = (state == ...);

    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule
