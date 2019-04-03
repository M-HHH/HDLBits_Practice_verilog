module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    
    always @ (posedge clk)
        begin
            if(reset)
                q <= 4'b0000;
            else if(q <= 4'b1000)
                q <= q + 1'b1;
            else
                q <= 4'b0000;
        end 

endmodule
