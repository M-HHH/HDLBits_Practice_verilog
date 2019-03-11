//**change mind when coding the hardware design**
//**Hardware designers often think "The (output should be ...) when the (inputs are...)"**


//Title: Suppose you are designing a circuit to control a cellphone's ringer and vibration motor. 
//Whenever the phone needs to ring from an incoming call (input ring), 
//your circuit must either turn on the ringer (output ringer = 1) or the motor (output motor = 1), but not both. 
//If the phone is in vibrate mode (input vibrate_mode = 1), turn on the motor. Otherwise, turn on the ringer.


module top_module
(
  input ring,
  intput vibrate_mode,
  output ringer,
  output motor
);

assign motor  = ring & vibrate_mode;
assign ringer = ring & !vibrate_mode;


endmodule
