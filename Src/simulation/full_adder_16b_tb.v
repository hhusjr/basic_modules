`timescale 1ns / 1ns

`define PERIOD 1

module data(
    input clk,
    input [22:0] n,
    input [22:0] e,
    output reg [15:0] a, b,
    output reg ci,
    output reg [15:0] ex_s,
    output reg ex_co
);
	reg [49:0] tvs [10485760:0];
	
	initial begin
		$readmemb("../../../../../TestVectors/full_adder_16b_tb.tv", tvs);
	end
   
	always @(posedge clk) begin
		{a, b, ci, ex_s, ex_co} <= tvs[n];
	end
	
	always @(negedge clk) begin 
        if (tvs[n] === 50'bx) begin
            $display("%d tests completed, ERR: %d.", n, e);
            $stop;
        end
	end
endmodule

module full_adder_16b_tb();
	wire [15:0] s;
	wire co;
	
	wire [15:0] a, b;
	wire ci;
	
	wire [15:0] ex_s;
	wire ex_co;
	
	reg [22:0] n, e;
	
	reg clk;
	
	full_adder_16b m(.a(a), .b(b), .s(s), .co(co), .ci(ci));
	data d(.clk(clk), .n(n), .e(e), .a(a), .b(b), .ci(ci), .ex_s(ex_s), .ex_co(ex_co));
	
	initial begin
		n = 0;
		e = 0;
		clk = 0;
	end
	
	always begin
		#`PERIOD clk = ~clk;
	end
	
	
	always @(negedge clk) begin 
		if (s !== ex_s | co !== ex_co) begin
			$display("Error #%d: a=%b, b=%b, ci=%b, s=%b, ex_s=%b, co=%b, ex_co=%b", n, a, b, ci, s, ex_s, co, ex_co);
			e = e + 1;
		end else begin
			$display("Test #%d PASS, ERR: %d", n, e);
		end
		n = n + 1;
	end
endmodule
