module top_module (
    input clk,
    input reset,
    output [3:0] q);
    
    always @ (posedge clk)
        begin
            if(reset)
                q <= 4'b0001;
            else if(q <= 4'b1001)
                q <= q + 1'b1;
            else 
                q <= 4'b0001;
                
        end

endmodule
