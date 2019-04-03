module top_module (
    input clk,
    input d,
    output q
);
    
    reg q1, q2;
    
    assign q = clk?q1:q2;
    
    always @ (posedge clk)
        begin
            q1 <= d;
        end
    
    always @ (negedge clk)
        begin
           q2 <= d; 
        end

endmodule


