module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    MUXDFF Inst1_MUXDFF
    (
        .clk(KEY[0]),
        .w(KEY[3]),
        .R(SW[3]),
        .E(KEY[1]),
        .L(KEY[2]),
        .Q(LEDR[3])
    );
    
    MUXDFF Inst2_MUXDFF
    (
        .clk(KEY[0]),
        .w(LEDR[3]),
        .R(SW[2]),
        .E(KEY[1]),
        .L(KEY[2]),
        .Q(LEDR[2])
    );
    
    MUXDFF Inst3_MUXDFF
    (
        .clk(KEY[0]),
        .w(LEDR[2]),
        .R(SW[1]),
        .E(KEY[1]),
        .L(KEY[2]),
        .Q(LEDR[1])
    );
    
    MUXDFF Inst4_MUXDFF
    (
        .clk(KEY[0]),
        .w(LEDR[1]),
        .R(SW[0]),
        .E(KEY[1]),
        .L(KEY[2]),
        .Q(LEDR[0])
    );

endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q
);
    
    wire temp1, temp2;
    
    assign temp1 = E ? w:Q;
    assign temp2 = L ? R:temp1;
    
    always @ (posedge clk)
        begin
           Q <= temp2; 
        end

endmodule
