module  switch(
		input clk,
		input  key,
		input  key1,
		output  led,
		output  led1);
		 

		 
		 reg LED,LED1;
		 integer a,b;



always @(posedge clk) begin
	
	if(key == 1'b0) begin
		a =1;
		b =0;
	end
 
	if(key1 == 1'b1) begin
		b = 1;
		a = 0;
	end 

	if(a==1) begin
		LED = 1'b1;
	end
	else begin
		LED = 1'b0;
	end

	if(b==1) begin
		LED1 = 1'b1;
	end 
	else begin
	LED = 1'b0;
	end
 
end
  
  assign led = LED;
  assign led1 = LED1;
	
endmodule