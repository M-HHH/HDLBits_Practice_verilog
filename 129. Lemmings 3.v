module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter LEFT = 3'b000, RIGHT = 3'b001, FALL_L = 3'b010, FALL_R = 3'b011, DIG_L = 3'b100, DIG_R = 3'b101;

    reg [2:0]  state = 3'b110, next_state = 3'b111;

    always @(*) begin
        state <= next_state;
    end

    always @(posedge clk or posedge areset) begin
        begin
            if(areset)
                next_state <= LEFT;
            else
                case (state)
                    LEFT : begin
                        if(!ground)
                            next_state <= FALL_L;
                        else if(dig & ground)
                            next_state <= DIG_L;
                        else if(bump_left)
                            next_state <= RIGHT;
                        else
                            next_state <= LEFT;
                    end

                    RIGHT : begin
                        if(!ground)
                            next_state <= FALL_R;
                        else if(dig & ground)
                            next_state <= DIG_R;
                        else if(bump_right)
                            next_state <= LEFT;
                        else 
                            next_state <= RIGHT;
                    end

                    DIG_L : begin
                        if(!ground)
                            next_state <= FALL_L;
                        else
                            next_state <= DIG_L;
                    end

                    DIG_R : begin
                        if(!ground)
                            next_state <= FALL_R;
                        else
                            next_state <= DIG_R;
                    end

                    FALL_L : begin
                        if(ground)
                            next_state <= LEFT;
                        else 
                            next_state <= FALL_L;
                    end

                    FALL_R : begin
                        if(ground)
                            next_state <= RIGHT;
                        else 
                            next_state <= FALL_R;
                    end

                    default: 
                        next_state <= LEFT;
                endcase
                
        end
    end

    assign aaah = ((state == FALL_L) | (state == FALL_R));
    assign digging = ((state == DIG_L) | (state == DIG_R));
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule


