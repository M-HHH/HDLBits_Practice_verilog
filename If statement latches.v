// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else 
            shut_off_computer = 0;
    end

    always @(*) begin
        if (~arrived)
          keep_driving = ~gas_tank_empty;
        else 
          keep_driving = 0;
          
    end

endmodule


//Combinational circuits must have a value assigned to all outputs under all conditions. 
//This usually means you always need else clauses or a default value assigned to the outputs.
