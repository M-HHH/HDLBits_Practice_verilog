//Given a 100-bit input vector [99:0], reverse its bit ordering.
//在组合模块中使用for循环, integer i;


module top_module
( 
    input [99:0] in,
    output [99:0] out
);
    
    always @ (*)
        begin
            for(integer i = 99; i>=0; i--)
                out[99-i] = in[i];
        end

endmodule
