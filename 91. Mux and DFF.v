module top_module (
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
