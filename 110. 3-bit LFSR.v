module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    wire temp1, temp2, temp3;
    
    assign temp1 = KEY[1]?SW[0] : LEDR[2];
    assign temp2 = KEY[1]?SW[1] : LEDR[0];
    assign temp3 = KEY[1]?SW[2] : (LEDR[2] ^ LEDR[1]);

    always @ (posedge KEY[0])
        begin
            LEDR[0]  <= temp1;
            LEDR[1]  <= temp2;
            LEDR[2]  <= temp3;
        end

endmodule
