// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations

    reg [1:0] present_state, next_state;
	parameter state_b = 2'b01, state_a = 2'b10;
    
    always @ (*)
        begin
           present_state = next_state; 
        end
    
    always @ (posedge clk)
        begin
            if(reset)
                next_state <= state_b[1:0];
           	else
                begin
                    case(present_state[1:0])
                        state_b : begin
                            if(~in)
                                next_state <= state_a[1:0];
                           	else
                                next_state <= state_b[1:0];
                        end
                        
                        state_a : begin
                            if(~in)
                                next_state <= state_b[1:0];
                            else
                                next_state <= state_a[1:0];
                        end
                        
                        
                    endcase
                end
        end
    
    assign out = (present_state == state_b[1:0]);

endmodule


//But in this code, its doesn't take advantage of the recommended scheme.
//So if you have a better way to solve this problem, please pull a request so I can merge it.
//THX
