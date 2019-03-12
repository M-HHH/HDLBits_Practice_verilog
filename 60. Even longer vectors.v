//采用移位运算进行比较


module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );

    assign out_both = in[98:0] & in[99:1];
    assign out_any  = in[99:1] | in[98:0];
    assign out_different = in ^ {in[0],in[99:1]};   //因为out_different要求一个wrapping且xor比较左边，故采用in[99:0] ^ {in[0], in[99:1]}
    
endmodule
