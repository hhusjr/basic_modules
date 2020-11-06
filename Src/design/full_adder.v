`timescale 1ns / 1ns

module full_adder_16b(
	input [15:0] a,
	input [15:0] b,
	input ci,
	output co,
	output [15:0] s
);
	wire [15:0] c, p, g;
	wire [3:0] P, G, C;
	
	assign p = a | b;
	assign g = a & b;
	
	carry_mod  m(.pi(P), .gi(G), .ci(ci), .c(C));
	carry_mod m0(.pi(p[3:0]), .gi(g[3:0]), .ci(ci), .c(c[3:0]), .po(P[0]), .go(G[0]));
	carry_mod m1(.pi(p[7:4]), .gi(g[7:4]), .ci(C[0]), .c(c[7:4]), .po(P[1]), .go(G[1]));
	carry_mod m2(.pi(p[11:8]), .gi(g[11:8]), .ci(C[1]), .c(c[11:8]), .po(P[2]), .go(G[2]));
	carry_mod m3(.pi(p[15:12]), .gi(g[15:12]), .ci(C[2]), .c(c[15:12]), .po(P[3]), .go(G[3]));
	
	assign s[0] = a[0] ^ b[0] ^ ci;
	assign s[15:1] = a[15:1] ^ b[15:1] ^ c[14:0];
	assign co = c[15];
endmodule

module carry_mod(
	input [3:0] pi,
	input [3:0] gi,
	input ci,
	output [3:0] c,
	output po,
	output go
);
	assign c[0] = gi[0] | pi[0] & ci;
	assign c[1] = gi[1] | pi[1] & gi[0] | pi[1] & pi[0] & ci;
	assign c[2] = gi[2] | pi[2] & gi[1] | pi[2] & pi[1] & gi[0] | pi[2] & pi[1] & pi[0] & ci;
	assign c[3] = gi[3] | pi[3] & gi[2] | pi[3] & pi[2] & gi[1] | pi[3] & pi[2] & pi[1] & gi[0] | pi[3] & pi[2] & pi[1] & pi[0] & ci;

	assign po = pi[0] & pi[1] & pi[2] & pi[3];
	assign go = gi[3] | pi[3] & gi[2] | pi[3] & pi[2] & gi[1] | pi[3] & pi[2] & pi[1] & gi[0];
endmodule
