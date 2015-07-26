module  pwm(
		input clk,
		output reg pwm);
		 

	integer counter;
	
always @(posedge clk)
begin
//pwm = !pwm;


if(counter == 500) begin
	counter = 0;
	pwm = 1'b1; 
	

end
else begin
	counter = counter + 1;
	pwm = pwm;
end
	
if(counter >= 250)
	pwm = 1'b0;
else
	pwm =1'b1;
end

	
endmodule 