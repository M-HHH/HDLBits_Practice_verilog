//**根据真值表编写电路的verilog程序**
//**case () .... endcase**

//此代码应有更简便的方法，希望可以提交commit或issue

module top_module
(
	input x3,
	input x2, 
	input x1,
	output f
);

always @ (*)
begin
    case ({x3,x2,x1})
		3'b000 : f = 0;
		3'b001 : f = 0;
		3'b010 : f = 1;
		3'b011 : f = 1;
		3'b100 : f = 0;
		3'b101 : f = 1;
		3'b110 : f = 0;
		3'b111 : f = 1;
        default: f = 0;
endcase
end
    
endmodule
