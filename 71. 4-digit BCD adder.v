module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    wire [3:0] cout_temp;
    
    bcd_fadd inst1_bcd_fadd(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(cout_temp[0]),
        .sum(sum[3:0])
    );
    
    bcd_fadd inst2_bcd_fadd(
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(cout_temp[0]),
        .cout(cout_temp[1]),
        .sum(sum[7:4])
    );
    
    bcd_fadd inst3_bcd_fadd(
        .a(a[11:8]),
        .b(b[11:8]),
        .cin(cout_temp[1]),
        .cout(cout_temp[2]),
        .sum(sum[11:8])
    );
    
    bcd_fadd inst4_bcd_fadd(
        .a(a[15:12]),
        .b(b[15:12]),
        .cin(cout_temp[2]),
        .cout(cout_temp[3]),
        .sum(sum[15:12])
    );
    
    assign cout = cout_temp[3];

endmodule
