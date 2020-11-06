`timescale 1ns / 1ns

module mux41_1b(
    input c0,
    input c1,
    input c2,
    input c3,
    input [1:0] a,
    input en,
    output d,
    output y
    );
    assign d = en & (~a[0] & ~a[1] & c0 | a[0] & ~a[1] & c1 | ~a[0] & a[1] & c2 | a[0] & a[1] & c3);
    assign y = a[1];
endmodule

module mux41_8b(
    input [7:0] c0,
    input [7:0] c1,
    input [7:0] c2,
    input [7:0] c3,
    input [1:0] a,
    input en,
    output [7:0] d,
    output y
    );
    assign d = en & (~a[0] & ~a[1] & c0 | a[0] & ~a[1] & c1 | ~a[0] & a[1] & c2 | a[0] & a[1] & c3);
    assign y = ~a[1];
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
    output [7:0] d,
    output y
    );
    
    wire [7:0] d0, d1;
    wire y0, y1;
    mux41_8b m0(.c0(c0), .c1(c1), .c2(c2), .c3(c3), .a(a[1:0]), .en(en), .d(d0), .y(y0));
    mux41_8b m1(.c0(c4), .c1(c5), .c2(c6), .c3(c7), .a(a[2:1]), .en(y0), .d(d1), .y(y1));
    
    assign y = y0 & y1;
    assign d = d0 | d1;
endmodule
