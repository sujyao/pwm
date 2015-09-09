module  sspwm(
		input clk,
		input [10:0] Sine_out,
		output reg pwm);
		 

		 
		 
integer counter = 0;


always @(posedge clk) begin
	
 
	// pwm generator  
	pwm = 1'b1;
	if(counter == 2000) begin // Top value, set to setup pwm fre.25kHz
		counter = 0;
		pwm = 1'b1; 
	end
	
	else begin
		counter = counter + 1;
		pwm = pwm;
	end
	
	if(counter >= Sine_out) begin // duty cycle value 
		pwm = 1'b0;
	end
	else begin 
		pwm =1'b1;
	end 
	
	
	
end
	
endmodule