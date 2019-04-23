module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    reg [0:7] q;
    wire [2:0] temp;

    always @ (posedge clk)
        begin
            if(enable == 1'b1)
                begin
                    q <= {S, q[0:6]};
                end       
        end
    
    assign temp = {A, B, C};

    assign Z = (temp == 3'h0)?q[0] : 
        (temp == 3'h1)?q[1]: 
        (temp == 3'h2)?q[2]: 
        (temp == 3'h3)?q[3]: 
        (temp == 3'h4)?q[4]:
        (temp == 3'h5)?q[5]:
        (temp == 3'h6)?q[6]: 
        (temp == 3'h7)?q[7]:1'b0;
endmodule
