module spwm(clk, p1, sine_a, tri_out);

input clk;      //16MHz
reg tick = 0;

reg  [7:0] theta_a = 8'd0;
reg  [7:0] theta_tri = 8'd0;
output [8:0] sine_a;
output [9:0] tri_out;

integer div = 500000;
integer r = 0;

output p1;
reg p1;


always@(posedge clk) begin
    if(r == div) begin
        theta_a <= (theta_a + 8'b1) % 8'd255; // theta_a is flopped
        r <= 1;
    end
    else begin
        r <= r + 1;
    end
end

always@(posedge clk) begin
    theta_tri <= (theta_tri + 8'b1) % 8'd255;
end



//generate spwm
always@(posedge clk) begin // latch to flip-flop
    if ($signed(sine_a) > $signed(tri_out))
        p1 <= 1'b1;
    else if ($signed(sine_a) < $signed(tri_out))
        p1 <= 1'b0;
end

SINE_LUT lut_a(theta_a, sine_a);
TRI_LUT lut_tri(theta_tri, tri_out);
endmodule