//这个题参考Ring or vibrate。
//主要在于转换verilog编程时与传软件编程的思维区别。
//传统软件编程的思考是if..else， 如果..， 则...
//而verilog 编程时考虑的是，在什么情况下输出为我想要的，是逆向思维，首先想到是的输出，其次再是输入。


module top_module
(
	input too_cold,
	input too_hot,
	input mode,
	input fan_on,
	output heater,
	output aircon,
	output fan
);

assign heater = mode  & too_cold;
assign aircon = !mode & too_hot;
//assign fan    = heater | aircon | fan_on;   //虽然写这句话也是success，但直接拿输出来判断肯定是有问题的
assign fan    = (mode & too_cold) | (!mode & too_hot) | fan_on;

endmodule
