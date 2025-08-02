
`timescale 1ns/1ns

module test_bench;
  	reg clk,rst_n;
	reg sig_in;
	wire pulse_out_p, pulse_out_n;

  	edge_detector dut(
  		.clk		(clk		),
  	 	.rst_n(rst_n),
		.sig_in(sig_in),
		.pulse_out_p(pulse_out_p),
		.pulse_out_n(pulse_out_n)
  	 );
			
  	initial begin 
		clk=0;
		forever #10 clk =~clk;
	end

initial begin
  	$display("=======START SIMULATION=========");

		rst_n=0;
		sig_in=0;
		#25;
		rst_n =1;

		#20 sig_in =1;
		#20 sig_in =1;

		#20 sig_in =0;
		#20 sig_in =0;
		
            	#20 sig_in =1;
		#20 sig_in =0;

		#40;
		$display("===== END SIMULATION=====");

	
		$finish;


	end
always @(posedge clk) begin
$display ("Time=%4t | sig_in=%b | pulse_out_p=%b | pulse_out_n=%b", $time, sig_in, pulse_out_p,pulse_out_n);
end
  	//initial 
  	//  $monitor("Time = %t: reset = %0b, count = %0d, overflow = %0b",$stime,reset,count,overflow);
endmodule
