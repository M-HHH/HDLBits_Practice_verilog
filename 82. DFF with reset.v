module top_module (
    input clk,
    input [7:0] d,
    input reset,
    output [7:0] q
);

    always @ (posedge clk)
        begin
    	if(reset)
    		begin
    		q <= 8'b0;
    		end
    	else
            begin
                q <= d;
            end
        end
    
endmodule

