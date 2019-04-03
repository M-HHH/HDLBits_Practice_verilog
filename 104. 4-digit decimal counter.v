module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    //one
    count Inst1_count
    (
        .clk(clk),
        .reset(reset),
        .ena(1'b1),
        .q(q[3:0])
    );
    
    //ten 
    count Inst2_count
    (
        .clk(clk),
        .reset(reset),
        .ena(q[3:0] == 4'd9),
        .q(q[7:4])
    );
    
    //hundred
    count Inst3_count
    (
        .clk(clk),
        .reset(reset),
        .ena(q[7:4] == 4'd9 && q[3:0] == 4'd9),
        .q(q[11:8])
    );
    
    //thousand
    count Inst4_count
    (
        .clk(clk),
        .reset(reset),
        .ena(q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9),
        .q(q[15:12])
    );
    
    assign ena = {q[11:8] == 4'd9 && q[7:4] == 4'd9 && q[3:0] == 4'd9, q[7:4] == 4'd9 && q[3:0] == 4'd9, q[3:0] == 4'd9};

endmodule

module count
(
	input clk,
    input reset,
    input ena,
    output reg[3:0] q
);
    
    always @ (posedge clk)
        begin
            if(reset)
                q <= 4'b0;
            else if (ena)
                begin
                    if(q == 4'd9) 
                    	q <= 4'd0;
                    else
                        q <= q + 1'b1;
                end
        end

endmodule
