//Combinational circuits must have a value assigned to all outputs under all conditions. 
//This usually means you always need else clauses or a default value assigned to the outputs.
//组合电路必须在所有条件下为所有输出赋值。
//这通常意味着您总是需要else子句或分配给输出的默认值。


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


