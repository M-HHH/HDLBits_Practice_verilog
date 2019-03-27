module top_module (
    input d, 
    input ena,
    output q);
    
    always @ (*)
        begin
            if(ena == 1'b1)
                q = d;
        end

endmodule
