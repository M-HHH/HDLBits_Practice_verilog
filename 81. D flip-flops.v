
module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);

    always @ (posedge clk)
        begin
            q[0] <= d[0];
            q[1] <= d[1];
            q[2] <= d[2];
            q[3] <= d[3];
            q[4] <= d[4];
            q[5] <= d[5];
            q[6] <= d[6];
            q[7] <= d[7];
            
        end
    
endmodule

//simple way

module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);

    always @ (posedge clk)
        begin
            q <= d;
            
        end
    
endmodule

