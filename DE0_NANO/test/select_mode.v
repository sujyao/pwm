module  select_mode(
		input wire clk,key0,key1,
		output wire led0,led1);
		
reg  [1:0] ledr;
reg  [1:0] keys;


		 
always @(posedge clk ) begin
	keys<={key0,key1};

	if(keys == 2'b01) begin //50HZ
		ledr <= 2'b01;
	
	end
	
	else if(keys == 2'b10) begin //60Hz
		ledr <= 2'b10;
	
		
	end




	
end

assign led0 = ledr[0];
assign led1 = ledr[1];	

	
endmodule 