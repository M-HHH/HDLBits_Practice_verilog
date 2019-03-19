module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    
    always @ (sel)
        begin
            if(sel == 4'b0000)
                 out = a;
            else if (sel == 4'b0001)
                 out = b;
            else if(sel == 4'b0010)
                out = c;
            else if(sel == 4'b0011)
                out = d;
            else if(sel == 4'b0100)
                out = e;
            else if(sel == 4'b0101)
                out = f;
            else if(sel == 4'b0110)
                out = g;
            else if(sel == 4'b0111)
                out = h;
            else if(sel == 4'b1000)
                out = i;
            else
                out = 16'b1;
        end

endmodule


