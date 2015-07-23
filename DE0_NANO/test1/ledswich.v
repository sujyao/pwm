module ledswich(
input wire clk,
output reg pwm
	
);

	integer counter;

always @(posedge clk) begin 

if(counter == 100000000) begin
	counter = 0;
	pwm = 1'b0; 
end


else begin
	counter = counter + 1;
	pwm = pwm;
end
	
if(counter >= 75000000)
	pwm = 1'b1;
else
	pwm =1'b0;

end

endmodule 