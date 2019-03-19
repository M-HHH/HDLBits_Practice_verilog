module Top_module
(
  input clk,
  input rst_n,
  input ori_signal,
  output pos_out,
  output neg_out
);

reg delay1, delay2, delay3;

//为了防止亚稳态问题，并且得到的上升沿信号与下降沿信号无法被原采样时钟clk采样，故将ori_sinal打两拍，得到和采样时钟同时钟域的delay2后再进行取样。
always @ (posedge clk or negedge rst_n)
begin
  if(!rst_n)
    delay1 <= 1'b0;
  else
    delay1 <= ori_signal;
end

always @ (posedge clk or negedge rst_n)
begin
  if(!rst_n)
    delay2 <= 1'b0;
  else
    delay2 <= delay1;
end

always @ (posedge clk or negedge rst_n)
begin
  if(!rst_n)
    delay3 <= 1'b0;
  else
    delay3 <= delay2;
end

assign pos_out = delay2 && (~delay3);
assign neg_out = (~delay2) && (delay3);

endmodule
