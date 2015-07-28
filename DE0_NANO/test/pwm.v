module  pwm(
		input clk,
		output reg pwm);
		 

	
	
	integer counter;
	integer dut;
	integer div = 5000000;
	integer r = 0;
	integer delay = 0;
	integer THETA_TMP_COUNTER;
	//integer x;
	
	reg  [7:0] THETA = 8'd0;
	reg [8:0] THETA_TMP;        //Lower bits of THETA (counting up or counting down)
	reg [9:0] THETA_HLP;        //Helper for reversing lower bits of counting direction for theta
	
	reg [10:0] SINE_TMP;         //Temporary holder for output (two's compliment)
	reg [10:0] SINE_OUT;         //Output Sine in two's compliment
	
always @(posedge clk) begin



    if(r == div ) begin
       THETA <= (THETA + 8'b1) % 8'd255; // theta_a is flopped theat 0 to 255  
        r <= 1;
		  
		  		   //adding delay here 	 
			if(THETA == 8'd0) begin
				THETA_TMP_COUNTER = THETA_TMP_COUNTER + 1;
			end
			else begin
				THETA_TMP_COUNTER = THETA_TMP_COUNTER;
			end

				
		  //end of delay.
		
			
		 
    end
	 
    else begin
        
		  
		  	if(THETA_TMP_COUNTER == 2) begin
				//div = 40;
			   THETA = 9'd0;
				if(delay == 500000000) begin
					 THETA_TMP_COUNTER = 0;
					 delay = 0;
				end
				else begin 
					delay = delay + 1;
				end 
					 
			end
			
			else begin
				r <= r + 1;
			end
		  
		  
    end
	 

	 
end 
	// pwm generator 
always @(posedge clk) begin
	
	pwm = 1'b1;
	if(counter == 255) begin // Top value, set to setup pwm fre.
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
		
		
end
always @(THETA) begin
    if (THETA[6:0] == 7'd64) begin        
        SINE_TMP = 9'd255;
    end
    else begin
        if (THETA[6]) begin                 //If counting down should begin reverse counting order
            THETA_HLP = 7'd64 - {1'd0, THETA[5:0]}; // counting down 
            THETA_TMP = {THETA_HLP[5:0]};
        end
        else begin                          //Continue counting up by default
            THETA_TMP = {THETA[5:0]};
        end
		  

		 
        case (THETA_TMP)                    //Look Up Table half wave 
        6'd0: SINE_TMP = 9'd0;	  
        6'd1: SINE_TMP = 9'd6;
        6'd2: SINE_TMP = 9'd13;
        6'd3: SINE_TMP = 9'd19;
        6'd4: SINE_TMP = 9'd25;
        6'd5: SINE_TMP = 9'd31;
        6'd6: SINE_TMP = 9'd37;
        6'd7: SINE_TMP = 9'd44;
        6'd8: SINE_TMP = 9'd50;
        6'd9: SINE_TMP = 9'd56;
        6'd10: SINE_TMP = 9'd62;
        6'd11: SINE_TMP = 9'd68;
        6'd12: SINE_TMP = 9'd74;
        6'd13: SINE_TMP = 9'd80;
        6'd14: SINE_TMP = 9'd86;
        6'd15: SINE_TMP = 9'd92;
        6'd16: SINE_TMP = 9'd98;
        6'd17: SINE_TMP = 9'd103;
        6'd18: SINE_TMP = 9'd109;
        6'd19: SINE_TMP = 9'd115;
        6'd20: SINE_TMP = 9'd120;
        6'd21: SINE_TMP = 9'd126;
        6'd22: SINE_TMP = 9'd131;
        6'd23: SINE_TMP = 9'd136;
        6'd24: SINE_TMP = 9'd142;
        6'd25: SINE_TMP = 9'd147;
        6'd26: SINE_TMP = 9'd152;
        6'd27: SINE_TMP = 9'd157;
        6'd28: SINE_TMP = 9'd162;
        6'd29: SINE_TMP = 9'd167;
        6'd30: SINE_TMP = 9'd171;
        6'd31: SINE_TMP = 9'd176;
        6'd32: SINE_TMP = 9'd180;
        6'd33: SINE_TMP = 9'd185;
        6'd34: SINE_TMP = 9'd189;
        6'd35: SINE_TMP = 9'd193;
        6'd36: SINE_TMP = 9'd197;
        6'd37: SINE_TMP = 9'd201;
        6'd38: SINE_TMP = 9'd205;
        6'd39: SINE_TMP = 9'd208;
        6'd40: SINE_TMP = 9'd212;
        6'd41: SINE_TMP = 9'd215;
        6'd42: SINE_TMP = 9'd219;
        6'd43: SINE_TMP = 9'd222;
        6'd44: SINE_TMP = 9'd225;
        6'd45: SINE_TMP = 9'd228;
        6'd46: SINE_TMP = 9'd231;
        6'd47: SINE_TMP = 9'd233;
        6'd48: SINE_TMP = 9'd236;
        6'd49: SINE_TMP = 9'd238;
        6'd50: SINE_TMP = 9'd240;
        6'd51: SINE_TMP = 9'd242;
        6'd52: SINE_TMP = 9'd244;
        6'd53: SINE_TMP = 9'd246;
        6'd54: SINE_TMP = 9'd247;
        6'd55: SINE_TMP = 9'd249;
        6'd56: SINE_TMP = 9'd250;
        6'd57: SINE_TMP = 9'd251;
        6'd58: SINE_TMP = 9'd252;
        6'd59: SINE_TMP = 9'd253;
        6'd60: SINE_TMP = 9'd254;
        6'd61: SINE_TMP = 9'd254;
        6'd62: SINE_TMP = 9'd255;
        6'd63: SINE_TMP = 9'd255;
		  default: SINE_TMP = 9'd00;

        endcase
    end
	 
	 SINE_OUT = SINE_TMP;
	 

	 
  

end

	
endmodule 