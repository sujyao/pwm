module  theta(
		input clk,
		input enable,
		output  reg  [8:0] theTA);
		 
	
	integer div = 2000; // slow down the speed to send the angle to look up table
	integer r = 0;
	

	
always @(posedge clk ) begin
	if(enable == 1'b1) begin
		if(r == div ) begin
			theTA = (theTA + 9'b1) % 9'd500; // theta_a is flopped theat 0 to 499 
			r = 0;
	
		end
		else begin
			r = r + 1;
		end
	end 
end	
endmodule
