module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    // State transition logic
    parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;

    reg [1:0] state, next_state;

    always @(*) begin
        state <= next_state;
    end

    // State flip-flops with synchronous reset
    always @(posedge clk) begin
        if(reset)
            next_state <= A;
        else
            begin
                case(state)
                    A : begin
                        if(in)
                            next_state <= B;
                        else
                            next_state <= A; 
                    end

                    B : begin
                        if(in)
                            next_state <= B;
                        else
                            next_state <= C;
                    end

                    C  : begin
                        if(in)
                            next_state <= D;
                        else
                            next_state <= A;
                    end

                    D : begin
                        if(in)
                            next_state <= B;
                        else
                            next_state <= C;
                    end

                    default : begin
                        next_state <= A;
                    end
                endcase
            end
    end
    // Output logic
    assign out = (state == D)?1:0;
endmodule
