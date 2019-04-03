module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] temp;
    reg [31:0] capture;
//    wire [31:0] capture;
    
    always @ (posedge clk)
        begin
            if(reset)
                temp <= 32'b0;
            else
                begin
          		 temp <= in; 
                end
        end
    
//	   assign capture = ~in & temp;
    
    always @ (posedge clk)
        begin
            if(reset)
                capture <= 32'b0;
            else
         	  capture <= ~in & temp;        
        end

    
    always @ (posedge clk)
        begin
            if(reset)
                out <= 32'b0;
            else
                begin
                    for (int i=0; i<32; i=i+1)
                        begin
                            if(capture[i] == 1'b1)
                                out[i] <= 1'b1;
                        end
                end
        end
    
endmodule
