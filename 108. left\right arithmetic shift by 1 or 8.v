module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    always @ (posedge clk)
        begin
            if(load)
                q <= data;
            else if (ena)
                begin
                    case(amount)
                        2'b00 : 	begin
                            q <= {q[62:0], 1'b0};
                        end
                        
                        2'b01:  begin
                            q <= {q[55:0], 8'b0};
                        end
                        
                        2'b10: begin
                            q <= {q[63], q[63:1]};
                        end
                        
                        2'b11: begin
                            q <= {{8{q[63]}}, q[63-:56]};
                        end
                    endcase
                end
        end

endmodule
