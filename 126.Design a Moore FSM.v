module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    
    // Give state names and assignments. I'm lazy, so I like to use decimal numbers.
	// It doesn't really matter what assignment is used, as long as they're unique.
	// We have 6 states here.
	parameter Under_S1=0, S1_S2_norm=1, S1_S2_supp=2, S2_S3_norm=3, S2_S3_supp=4, Above_S3=5;
	reg [2:0] state, next;		// Make sure these are big enough to hold the state encodings.
	


    // Edge-triggered always block (DFFs) for state flip-flops. Synchronous reset.	
	always @(posedge clk) begin
		if (reset) state <= Under_S1;
		else state <= next;
	end



    // Combinational always block for state transition logic. Given the current state and inputs,
    // what should be next state be?
    // Combinational always block: Use blocking assignments.    
	always@(*) begin
		case (state)
			Under_S1: next = s[1] ? S1_S2_norm : Under_S1;
			S1_S2_norm: next = s[2] ? S2_S3_norm : (s[1] ? S1_S2_norm : Under_S1);
			S1_S2_supp: next = s[2] ? S2_S3_norm : (s[1] ? S1_S2_supp : Under_S1);
			S2_S3_norm: next = s[3] ? Above_S3 : (s[2] ? S2_S3_norm : S1_S2_supp);
			S2_S3_supp: next = s[3] ? Above_S3 : (s[2] ? S2_S3_supp : S1_S2_supp);
			Above_S3: next = s[3] ? Above_S3 : S2_S3_supp;
			default: next = 'x;
		endcase
	end
	
	
	
	// Combinational output logic. In this problem, a procedural block (combinational always block) 
	// is more convenient. Be careful not to create a latch.
	always@(*) begin
		case (state)
            Under_S1: {fr3, fr2, fr1, dfr} = 4'b1111; //under_S1
			S1_S2_norm: {fr3, fr2, fr1, dfr} = 4'b0110; //s1_s2_norm
			S1_S2_supp: {fr3, fr2, fr1, dfr} = 4'b0111; //s1_s2_supp
			S2_S3_norm: {fr3, fr2, fr1, dfr} = 4'b0010; //s2_s3_norm
			S2_S3_supp: {fr3, fr2, fr1, dfr} = 4'b0011; //s2_s3_supp
			Above_S3: {fr3, fr2, fr1, dfr} = 4'b0000; //above_s3
			default: {fr3, fr2, fr1, dfr} = 'x;
		endcase
	end

endmodule
