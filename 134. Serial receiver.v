module top_module(
	input clk,
    input in,
    input reset,
    output done
);

    parameter S0=4'd0, B0=4'd2,B1=4'd3,B2=4'd4,B3=4'd5,B4=4'd6,B5=4'd7,B6=4'd8,B7=4'd9,B10=4'd10,d=4'd11;
    parameter B9=4'd13, B8=4'd1;
    reg [3:0] state;
    reg [3:0] next_state;
    
    always @(posedge clk)
    begin
        if(reset)     
            state<=S0; 
        else 
            state<=next_state;  
    end 
    
    always @ (*)
        begin
           next_state = state;
            
            case (state)
                S0: begin
                    if(in)
                        next_state = S0;
                	else
                        next_state = B0;
                end
                
                B0 : next_state = B1;
                
                B1:    next_state=B2;
                
                B2:    next_state=B3;
                
                B3:    next_state=B4;
                
                B4:    next_state=B5;
                
                B5:    next_state=B6;
                
                B6:    next_state=B7;
                
                B7:   next_state=B8;
                
                B8 : begin
                    if(in)
                        next_state = d;
                    else
                        next_state = B9;
                end
                
                d: begin
                    if(in)
                        next_state = S0;
                    else
                        next_state = B0;
                end
                
                B9: begin
                    if(in)
                        next_state = S0;
                    else
                        next_state = B9;
                end
                
            endcase;
        end
    
    assign done = (state == d)?1'b1:1'b0;
 
    
endmodule 
