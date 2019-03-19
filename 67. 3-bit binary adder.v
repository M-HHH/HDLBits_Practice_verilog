module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    full_adder inst_full_adder0(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(cout[0])
    );
    
   full_adder inst_full_adder1(
       .a(a[1]),
       .b(b[1]),
       .cin(cout[0]),
       .sum(sum[1]),
       .cout(cout[1])
    );
    
    full_adder inst_full_adder2(
        .a(a[2]),
        .b(b[2]),
        .cin(cout[1]),
        .sum(sum[2]),
        .cout(cout[2])
    );

endmodule

module full_adder (
	input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout =a&b | a&cin | b&cin;
    
endmodule 
