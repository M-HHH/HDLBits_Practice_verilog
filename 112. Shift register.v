module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg temp1, temp2, temp3;
    
    always @ (posedge clk)
        begin
            if(!resetn) 
                begin
                   temp1 <= 1'b0;
                    temp2 <= 1'b0;
                    temp3 <= 1'b0;
                    out <= 1'b0;
                end
            else
                begin
                   temp1 <= in;
                    temp2 <= temp1;
                    temp3 <= temp2;
                    out <= temp3;
                end
        end

endmodule
