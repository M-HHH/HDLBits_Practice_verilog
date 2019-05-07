module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    parameter BYTE2 = 2'd0, BYTE3 = 2'd1, DONE = 2'd2, BYTE1 = 2'd3;
    reg [1:0] state, next_state;
    reg [23:0] ps2data;

    // State transition logic (combinational)
    always @(*) 
        begin
            if (in[3] == 1 && state == BYTE1) 
                next_state = BYTE2;
            else if (state == BYTE2) 
                next_state = BYTE3;
            else if (state == BYTE3) 
                next_state = DONE;
            else if (state == DONE && in[3] == 1) 
                next_state = BYTE2;
            else if (state == DONE && in[3] != 1) 
                next_state = BYTE1;
            else 
                next_state = BYTE1;
        end

    // State flip-flops (sequential)
    always @(posedge clk) begin
        if (reset) 
            state <= BYTE1;
        else 
            begin
                state <= next_state;
                ps2data <= {ps2data[15:0], in};
            end
    end

    // Output logic
    assign done = (state == DONE)?1:0;
    assign out_bytes = ps2data;
endmodule


