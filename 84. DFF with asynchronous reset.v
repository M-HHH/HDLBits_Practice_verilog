module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    
    always @ (posedge clk or posedge areset)
        //The only difference in code between synchronous and asynchronous reset flip-flops is in the sensitivity list.
        begin
            if(areset)
                q <= 8'b0000_0000;
            else
                q <= d;
        end

endmodule
