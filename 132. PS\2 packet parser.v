module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); 

    parameter BYTE1 = 1, BYTE2 = 2, BYTE3 = 3, DONE = 4;
    reg [2:0] state, next_state;

    always @(*) begin
        state <= next_state;
    end

    always @(posedge clk) begin
        if(reset)
            next_state <= BYTE1;
        else
            case (state)
                BYTE1 : begin
                    if(in[3] == 1'b0)
                        next_state <= BYTE1;
                    else
                        next_state <= BYTE2;
                end 

                BYTE2 : begin
                   next_state <= BYTE3;
                end

                BYTE3 : begin
                    next_state <= DONE; 
                end

                DONE : begin
                    if(in[3] == 1'b0)
                        next_state <= BYTE1;
                    else
                        next_state <= BYTE2;
                end

                default: 
                    next_state <= BYTE1;
            endcase
    end

    assign done = (state == DONE)?1:0;

endmodule
