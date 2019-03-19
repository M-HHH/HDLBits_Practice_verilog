
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire [3:0] cout_temp;
    
    full_adder inst1_full_adder (
    	.a(x[0]),
    	.b(y[0]),
    	.cin(1'b0),
    	.sum(sum[0]),
    	.cout(cout_temp[0])
    );
    
    full_adder inst2_full_adder(
    	.a(x[1]),
    	.b(y[1]),
    	.cin(cout_temp[0]),
    	.sum(sum[1]),
    	.cout(cout_temp[1])
    );
    
    full_adder inst3_full_adder(
    	.a(x[2]),
    	.b(y[2]),
    	.cin(cout_temp[1]),
    	.sum(sum[2]),
    	.cout(cout_temp[2])
    );

    full_adder inst4_full_adder(
    	.a(x[3]),
    	.b(y[3]),
    	.cin(cout_temp[2]),
    	.sum(sum[3]),
    	.cout(sum[4])
    );

endmodule

module full_adder(
	input a, b, cin,
	output cout, sum
);

assign sum  = a ^ b ^ cin;
assign cout = a&b | a&cin | b&cin;

endmodule
