module TRI_LUT (THETA, TRI_OUT);

input  [7:0] THETA;         
output [9:0] TRI_OUT;       

reg [5:0] THETA_TMP;        
reg [6:0] THETA_HLP;        
reg [9:0] TRI_TMP;          
reg [9:0] TRI_OUT;          

always @ (THETA) begin          
	 THETA_HLP = 7'd64 - {1'd0, THETA[5:0]};
	 THETA_TMP = THETA[6] ? THETA_HLP[5:0] : THETA[6];
    if (THETA[6:0] == 7'd64) begin  
        TRI_TMP = 10'd364;
    end
    else begin
        case (THETA_TMP)            
            6'd0: TRI_TMP = 10'd0;
            6'd1: TRI_TMP = 10'd6;
            6'd2: TRI_TMP = 10'd12;
            6'd3: TRI_TMP = 10'd17;
            6'd4: TRI_TMP = 10'd23;
            6'd5: TRI_TMP = 10'd29;
            6'd6: TRI_TMP = 10'd35;
            6'd7: TRI_TMP = 10'd40;
            6'd8: TRI_TMP = 10'd46;
            6'd9: TRI_TMP = 10'd52;
            6'd10: TRI_TMP = 10'd58;
            6'd11: TRI_TMP = 10'd64;
            6'd12: TRI_TMP = 10'd69;
            6'd13: TRI_TMP = 10'd75;
            6'd14: TRI_TMP = 10'd81;
            6'd15: TRI_TMP = 10'd87;
            6'd16: TRI_TMP = 10'd92;
            6'd17: TRI_TMP = 10'd98;
            6'd18: TRI_TMP = 10'd104;
            6'd19: TRI_TMP = 10'd110;
            6'd20: TRI_TMP = 10'd116;
            6'd21: TRI_TMP = 10'd121;
            6'd22: TRI_TMP = 10'd127;
            6'd23: TRI_TMP = 10'd133;
            6'd24: TRI_TMP = 10'd139;
            6'd25: TRI_TMP = 10'd144;
            6'd26: TRI_TMP = 10'd150;
            6'd27: TRI_TMP = 10'd156;
            6'd28: TRI_TMP = 10'd162;
            6'd29: TRI_TMP = 10'd168;
            6'd30: TRI_TMP = 10'd173;
            6'd31: TRI_TMP = 10'd179;
            6'd32: TRI_TMP = 10'd185;
            6'd33: TRI_TMP = 10'd191;
            6'd34: TRI_TMP = 10'd196;
            6'd35: TRI_TMP = 10'd202;
            6'd36: TRI_TMP = 10'd208;
            6'd37: TRI_TMP = 10'd214;
            6'd38: TRI_TMP = 10'd220;
            6'd39: TRI_TMP = 10'd225;
            6'd40: TRI_TMP = 10'd231;
            6'd41: TRI_TMP = 10'd237;
            6'd42: TRI_TMP = 10'd243;
            6'd43: TRI_TMP = 10'd248;
            6'd44: TRI_TMP = 10'd254;
            6'd45: TRI_TMP = 10'd260;
            6'd46: TRI_TMP = 10'd266;
            6'd47: TRI_TMP = 10'd272;
            6'd48: TRI_TMP = 10'd277;
            6'd49: TRI_TMP = 10'd283;
            6'd50: TRI_TMP = 10'd289;
            6'd51: TRI_TMP = 10'd295;
            6'd52: TRI_TMP = 10'd300;
            6'd53: TRI_TMP = 10'd306;
            6'd54: TRI_TMP = 10'd312;
            6'd55: TRI_TMP = 10'd318;
            6'd56: TRI_TMP = 10'd324;
            6'd57: TRI_TMP = 10'd329;
            6'd58: TRI_TMP = 10'd335;
            6'd59: TRI_TMP = 10'd341;
            6'd60: TRI_TMP = 10'd347;
            6'd61: TRI_TMP = 10'd352;
            6'd62: TRI_TMP = 10'd358;
            6'd63: TRI_TMP = 10'd364;

        endcase
    end

    if (THETA > 8'd128) begin
        TRI_OUT = (~TRI_TMP) + 1'd1;
    end
    else begin                      
        TRI_OUT = TRI_TMP;
    end

end

endmodule