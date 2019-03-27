module top_module (
    input clk,
    input x,
    output z
); 
    
    reg q1 = 0;
    reg q2 = 0;
    reg q3 = 0;
    
    always @ (posedge clk)
        begin
            q1 <= x ^ q1; 
        end
    
    always @ (posedge clk)
        begin
            q2 <= x & (~q2);
        end
    
    always @ (posedge clk)
        begin
            q3 <= x | (~q3);
        end
    
    assign z = ~(q1 | q2 | q3); 

endmodule
