module  pwm(
		input clk,
		output reg pwm);
		 

	
	
	integer counter;
	integer dut;
	integer div = 5000000; // slow down the clock 
	integer r = 0;
	integer delay = 0;
	integer THETA_TMP_COUNTER = 0;
	//integer x;
	
	reg  [9:0] THETA = 10'd0;   // 10 bit, up to 1024
	reg [8:0] THETA_TMP;        //Lower bits of THETA (counting up or counting down)
	reg [9:0] THETA_HLP;        //Helper for reversing lower bits of counting direction for theta
	
	reg [12:0] SINE_TMP;         //Temporary holder for output (two's compliment)
	reg [12:0] SINE_OUT;         //Output Sine in two's compliment
	
always @(posedge clk) begin
	if(r == div ) begin
		THETA = (THETA + 10'b1) % 10'd89; // theta_a is flopped theat 0 to 255  
      r = 1;
		  
		//adding delay here 	 
		if(THETA == 10'd0) begin
			THETA_TMP_COUNTER = THETA_TMP_COUNTER + 1;
		end
		else begin
			THETA_TMP_COUNTER = THETA_TMP_COUNTER;
		end

		  //end of delay. 
   end
   else begin
	// pwm generator  
		pwm = 1'b1;
		if(counter == 5000) begin // Top value, set to setup pwm fre.
			counter = 0;
			pwm = 1'b1; 
		end
	
		else begin
			counter = counter + 1;
			pwm = pwm;
		end
		if(counter <= SINE_OUT) // duty cycle value 
			pwm = 1'b1;
		else
			pwm =1'b0;
	  
		if(THETA_TMP_COUNTER == 1) begin
			THETA = 10'd0;
			if(delay == 50000000) begin
				THETA_TMP_COUNTER = 0;
				delay = 0;
			end
			else begin 
				delay = delay + 1;
				pwm = 1'b0;
					
			end 		 
		end	
		else begin
			r = r + 1;	
		end	  
	end
end 
always @(THETA) begin      // sine look up table 
	case (THETA)                    			
			10'd0	:	SINE_TMP	 =	13'd	0	;
			10'd1	:	SINE_TMP	 =	13'd	178	;
			10'd2	:	SINE_TMP	 =	13'd	357	;
			10'd3	:	SINE_TMP	 =	13'd	534	;
			10'd4	:	SINE_TMP	 =	13'd	712	;
			10'd5	:	SINE_TMP	 =	13'd	888	;
			10'd6	:	SINE_TMP	 =	13'd	1063	;
			10'd7	:	SINE_TMP	 =	13'd	1237	;
			10'd8	:	SINE_TMP	 =	13'd	1409	;
			10'd9	:	SINE_TMP	 =	13'd	1579	;
			10'd10	:	SINE_TMP	 =	13'd	1747	;
			10'd11	:	SINE_TMP	 =	13'd	1913	;
			10'd12	:	SINE_TMP	 =	13'd	2077	;
			10'd13	:	SINE_TMP	 =	13'd	2238	;
			10'd14	:	SINE_TMP	 =	13'd	2396	;
			10'd15	:	SINE_TMP	 =	13'd	2551	;
			10'd16	:	SINE_TMP	 =	13'd	2703	;
			10'd17	:	SINE_TMP	 =	13'd	2852	;
			10'd18	:	SINE_TMP	 =	13'd	2996	;
			10'd19	:	SINE_TMP	 =	13'd	3137	;
			10'd20	:	SINE_TMP	 =	13'd	3274	;
			10'd21	:	SINE_TMP	 =	13'd	3407	;
			10'd22	:	SINE_TMP	 =	13'd	3536	;
			10'd23	:	SINE_TMP	 =	13'd	3659	;
			10'd24	:	SINE_TMP	 =	13'd	3779	;
			10'd25	:	SINE_TMP	 =	13'd	3893	;
			10'd26	:	SINE_TMP	 =	13'd	4003	;
			10'd27	:	SINE_TMP	 =	13'd	4107	;
			10'd28	:	SINE_TMP	 =	13'd	4206	;
			10'd29	:	SINE_TMP	 =	13'd	4300	;
			10'd30	:	SINE_TMP	 =	13'd	4388	;
			10'd31	:	SINE_TMP	 =	13'd	4471	;
			10'd32	:	SINE_TMP	 =	13'd	4548	;
			10'd33	:	SINE_TMP	 =	13'd	4619	;
			10'd34	:	SINE_TMP	 =	13'd	4685	;
			10'd35	:	SINE_TMP	 =	13'd	4744	;
			10'd36	:	SINE_TMP	 =	13'd	4797	;
			10'd37	:	SINE_TMP	 =	13'd	4845	;
			10'd38	:	SINE_TMP	 =	13'd	4886	;
			10'd39	:	SINE_TMP	 =	13'd	4921	;
			10'd40	:	SINE_TMP	 =	13'd	4949	;
			10'd41	:	SINE_TMP	 =	13'd	4971	;
			10'd42	:	SINE_TMP	 =	13'd	4987	;
			10'd43	:	SINE_TMP	 =	13'd	4997	;
			10'd44	:	SINE_TMP	 =	13'd	5000	;
			10'd45	:	SINE_TMP	 =	13'd	4997	;
			10'd46	:	SINE_TMP	 =	13'd	4987	;
			10'd47	:	SINE_TMP	 =	13'd	4971	;
			10'd48	:	SINE_TMP	 =	13'd	4949	;
			10'd49	:	SINE_TMP	 =	13'd	4921	;
			10'd50	:	SINE_TMP	 =	13'd	4886	;
			10'd51	:	SINE_TMP	 =	13'd	4845	;
			10'd52	:	SINE_TMP	 =	13'd	4797	;
			10'd53	:	SINE_TMP	 =	13'd	4744	;
			10'd54	:	SINE_TMP	 =	13'd	4685	;
			10'd55	:	SINE_TMP	 =	13'd	4619	;
			10'd56	:	SINE_TMP	 =	13'd	4548	;
			10'd57	:	SINE_TMP	 =	13'd	4471	;
			10'd58	:	SINE_TMP	 =	13'd	4388	;
			10'd59	:	SINE_TMP	 =	13'd	4300	;
			10'd60	:	SINE_TMP	 =	13'd	4206	;
			10'd61	:	SINE_TMP	 =	13'd	4107	;
			10'd62	:	SINE_TMP	 =	13'd	4003	;
			10'd63	:	SINE_TMP	 =	13'd	3893	;
			10'd64	:	SINE_TMP	 =	13'd	3779	;
			10'd65	:	SINE_TMP	 =	13'd	3659	;
			10'd66	:	SINE_TMP	 =	13'd	3536	;
			10'd67	:	SINE_TMP	 =	13'd	3407	;
			10'd68	:	SINE_TMP	 =	13'd	3274	;
			10'd69	:	SINE_TMP	 =	13'd	3137	;
			10'd70	:	SINE_TMP	 =	13'd	2996	;
			10'd71	:	SINE_TMP	 =	13'd	2852	;
			10'd72	:	SINE_TMP	 =	13'd	2703	;
			10'd73	:	SINE_TMP	 =	13'd	2551	;
			10'd74	:	SINE_TMP	 =	13'd	2396	;
			10'd75	:	SINE_TMP	 =	13'd	2238	;
			10'd76	:	SINE_TMP	 =	13'd	2077	;
			10'd77	:	SINE_TMP	 =	13'd	1913	;
			10'd78	:	SINE_TMP	 =	13'd	1747	;
			10'd79	:	SINE_TMP	 =	13'd	1579	;
			10'd80	:	SINE_TMP	 =	13'd	1409	;
			10'd81	:	SINE_TMP	 =	13'd	1237	;
			10'd82	:	SINE_TMP	 =	13'd	1063	;
			10'd83	:	SINE_TMP	 =	13'd	888	;
			10'd84	:	SINE_TMP	 =	13'd	712	;
			10'd85	:	SINE_TMP	 =	13'd	534	;
			10'd86	:	SINE_TMP	 =	13'd	357	;
			10'd87	:	SINE_TMP	 =	13'd	178	;
			10'd88	:	SINE_TMP	 =	13'd	0	;



		default: SINE_TMP = 13'd0;
		
	endcase
	SINE_OUT = SINE_TMP;
end
	 

endmodule
