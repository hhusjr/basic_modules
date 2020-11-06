`timescale 1ns / 1ns

module mux41_1b(
    input c0,
    input c1,
    input c2,
    input c3,
    input [1:0] a,
    input en,
    output d
    );
    assign d = en & (~a[0] & ~a[1] & c0 | a[0] & ~a[1] & c1 | ~a[0] & a[1] & c2 | a[0] & a[1] & c3);
endmodule

module mux41_8b(
    input [7:0] c0,
    input [7:0] c1,
    input [7:0] c2,
    input [7:0] c3,
    input [1:0] a,
    input en,
    output [7:0] d
    );
    assign d = {8{en}} & (~{8{a[0]}} & ~{8{a[1]}} & c0 | {8{a[0]}} & ~{8{a[1]}} & c1 | ~{8{a[0]}} & {8{a[1]}} & c2 | {8{a[0]}} & {8{a[1]}} & c3);
endmodule

module mux81_8b(
    input [7:0] c0,
    input [7:0] c1,
    input [7:0] c2,
    input [7:0] c3,
    input [7:0] c4,
    input [7:0] c5,
    input [7:0] c6,
    input [7:0] c7,
    input [2:0] a,
    input en,
    output [7:0] d
    );
    wire [7:0] d0, d1;
    mux41_8b m0(.c0(c0), .c1(c1), .c2(c2), .c3(c3), .a(a[1:0]), .en(~a[2]), .d(d0));
    mux41_8b m1(.c0(c4), .c1(c5), .c2(c6), .c3(c7), .a(a[1:0]), .en(a[2]), .d(d1));
    assign d = {8{en}} & (d0 | d1);
endmodule

module mux81_16b(
    input [7:0] c0,
    input [7:0] c1,
    input [7:0] c2,
    input [7:0] c3,
    input [7:0] c4,
    input [7:0] c5,
    input [7:0] c6,
    input [7:0] c7,
    input [7:0] c8,
    input [7:0] c9,
    input [7:0] c10,
    input [7:0] c11,
    input [7:0] c12,
    input [7:0] c13,
    input [7:0] c14,
    input [7:0] c15,
    input [3:0] a,
    input en,
    output [7:0] d
    );
    wire [7:0] d0, d1;
    mux81_8b m0(.c0(c0), .c1(c1), .c2(c2), .c3(c3), .c4(c4), .c5(c5), .c6(c6), .c7(c7), .a(a[2:0]), .en(~a[3]), .d(d0));
    mux81_8b m1(.c0(c8), .c1(c9), .c2(c10), .c3(c11), .c4(c12), .c5(c13), .c6(c14), .c7(c15), .a(a[2:0]), .en(a[3]), .d(d1));
    assign d = {8{en}} & (d0 | d1);
endmodule
