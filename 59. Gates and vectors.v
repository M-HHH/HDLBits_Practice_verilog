//连接符内要指定位宽！
//连接符内要指定位宽！
//连接符内要指定位宽！


module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different,
		output  out);
		
		assign out = 1 & 0 & 1;

    //assign out_both[2:0]      = {{in[3] & in[2]}, {in[2] & in[1]}, {in[1] & in[0]}}; 连接符内要指定位宽
    assign out_both[2:0]      = {{in[3] & in[2]}, {& in[2] & in[1]}, {in[1] & in[0]}};
    assign out_any		 = {{in[3] | in[2]} , {in[2] | in[1]} , {in[1] | in[0]}};
    assign out_different = {{in[0] ^ in[3]}, {in[3] ^ in[2]}, {in[2] ^ in[1]}, {in[1] ^ in[0]}};

endmodule
