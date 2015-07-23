module  select_mode(
		input wire clk,key0,key1,
		output wire led0,led1,
		output reg pwm);
		
reg  [1:0] ledr;
reg  [1:0] keys;
integer counter;
		 
always @(posedge clk ) begin
	keys<={key0,key1};

	if(keys == 2'b01) begin //50HZ
		ledr <= 2'b01;
		if(counter == 625) begin
			counter = 0;
			pwm = 1'b0; 
		end
	
		else begin
			counter = counter + 1;
			pwm = pwm;
		end
			
		if(counter >= 200)
			pwm = 1'b1;
		else
			pwm =1'b0;	
		
	end
	
	else if(keys == 2'b10) begin //60Hz
		ledr <= 2'b10;
		if(counter == 625) begin
			counter = 0;
			pwm = 1'b0; 
		end
	
		else begin
			counter = counter + 1;
			pwm = pwm;
		end
			
		if(counter >= 400)
			pwm = 1'b1;
		else
			pwm =1'b0;	
				
		
		
	end




	
end

assign led0 = ledr[0];
assign led1 = ledr[1];		 

	
endmodule 