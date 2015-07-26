module SINE_LUT (THETA, SINE_OUT);

input  [7:0] THETA;         //Input THETA
output [8:0] SINE_OUT;      //Output SINE_OUT

reg [5:0] THETA_TMP;        //Lower bits of THETA (counting up or counting down)
reg [6:0] THETA_HLP;        //Helper for reversing lower bits of counting direction for theta
reg [8:0] SINE_TMP;         //Temporary holder for output (two's compliment)
reg [8:0] SINE_OUT;         //Output Sine in two's compliment

always @ (THETA) begin                      //Combinatorial Logic Look Up Table

	 THETA_HLP = 7'd64 - {1'd0, THETA[5:0]};
	 THETA_TMP = THETA[6] ? THETA_HLP[5:0] : THETA[6];
	 
    if (THETA[6:0] == 7'd64) begin          //At 90 degrees and 270 degrees
        SINE_TMP = 9'd255;
    end
    else begin
        case (THETA_TMP)                    //Look Up Table (quarter wave)
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

        endcase
    end

    if (THETA > 8'd128) begin               //Any theta between 180 and 360 degrees should be negative
        SINE_OUT = (~SINE_TMP) + 1'd1;      //Create negative value in two's compliment
    end
    else begin                              //Any theta between 0 and 180 degrees should be positive
        SINE_OUT = SINE_TMP;
    end

end

endmodule