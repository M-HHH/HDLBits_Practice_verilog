module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);
    
    reg [7:0] in_temp;
    
    always @ (posedge clk)
        begin
        	in_temp <= in;
            anyedge <= in ^ in_temp;
        end

endmodule
