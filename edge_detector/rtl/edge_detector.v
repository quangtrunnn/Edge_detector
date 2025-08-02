module edge_detector(
	input wire clk,
	input wire rst_n,
	input wire sig_in,
	output reg pulse_out_p,
	output reg pulse_out_n
);
reg sig_in_d;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		sig_in_d <= 1'b0;
		pulse_out_p <= 1'b0;
		pulse_out_n <= 1'b0;
	end else begin
		pulse_out_p <= (~sig_in_d) & sig_in;
		pulse_out_n <= sig_in_d & (~sig_in);
		sig_in_d <= sig_in ;
	end
end
endmodule
