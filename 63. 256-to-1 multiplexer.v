module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    
    wire temp;
    
    assign temp = sel[0] * 1 + sel[1] * 2 + sel[2] * 4 + sel[3] * 8 + sel[4] * 16 + sel[5] * 32 + sel[6] * 64 + sel[7] * 128;
    
    assign out = in[temp];

endmodule


//another solution

//Vector indices can be variable, as long as the synthesizer can figure out that the width 
//of the bits being selected is constant. In particular, selecting one bit out of a vector 
//using a variable index will work.
module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    
    assign out = in[sel];

endmodule
