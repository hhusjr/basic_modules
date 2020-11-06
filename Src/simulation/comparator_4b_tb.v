`timescale 1ns / 1ns

`define PERIOD 1

module comparator_4b_tb_data(
    input clk,
    input [22:0] n,
    input [22:0] e,
    output reg [3:0] a,
    output reg [3:0] b,
    output reg in_l,
    output reg in_g,
    output reg in_m,
    output reg ex_l,
    output reg ex_g,
    output reg ex_m
);
	reg [13:0] tvs [100:0];
	
	initial begin
		$readmemb("../../../../../TestVectors/comparator_4b_tb.tv", tvs);
	end
   
	always @(posedge clk) begin
		{a, b, in_l, in_g, in_m, ex_l, ex_g, ex_m} <= tvs[n];
	end
	
	always @(negedge clk) begin 
        if (tvs[n] === 14'bx) begin
            $display("%d tests completed, ERR: %d.", n, e);
            $stop;
        end
	end
endmodule

module comparator_4b_tb();
    wire l, g, m;
    wire in_l, in_g, in_m;
    wire ex_l, ex_g, ex_m;
    wire [3:0] a, b;
	
	reg [22:0] n, e;
	
	reg clk;
	
	comparator_4b dev(.a(a), .b(b), .in_l(in_l), .in_g(in_g), .in_m(in_m), .l(l), .g(g), .m(m));
	comparator_4b_tb_data d(.clk(clk), .n(n), .e(e), .a(a), .b(b), .in_l(in_l), .in_g(in_g), .in_m(in_m), .ex_l(ex_l), .ex_g(ex_g), .ex_m(ex_m));
	
	initial begin
		n = 0;
		e = 0;
		clk = 0;
	end
	
	always begin
		#`PERIOD clk = ~clk;
	end
	
	always @(negedge clk) begin 
		if (l !== ex_l | g !== ex_g | m !== ex_m) begin
			$display("Error #%d: a=%b, b=%b, in_l=%b, in_g=%b, in_m=%b, l=%b, g=%b, m=%b, ex_l=%b, ex_g=%b, ex_m=%b", n, a, b, in_l, in_g, in_m, l, g, m, ex_l, ex_g, ex_m);
			e = e + 1;
		end else begin
			$display("Test #%d PASS, ERR: %d", n, e);
		end
		n = n + 1;
	end
endmodule
