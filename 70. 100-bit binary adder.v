module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    
    wire [99:0] cout_temp;
    
    fadd inst1_fadd(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .cout(cout_temp[0]),
        .sum(sum[0])
    );
    
    genvar i;

           generate 
               for(i=1; i<100; i=i+1)
                   begin: add
                       fadd inst2_fadd(
                           .a(a[i]),
                           .b(b[i]),
                           .cin(cout_temp[i-1]),
                           .cout(cout_temp[i]),
                           .sum(sum[i])
                       );
                   end
           endgenerate
                              
     assign cout = cout_temp[99];

endmodule

module fadd (
	input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
   assign cout = a&b | a&cin | b&cin;
endmodule
