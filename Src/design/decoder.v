`timescale 1ns / 1ns


module decoder(
    input [2:0] a,
    input sta,
    input stb,
    input stc,
    output c0,
    output c1,
    output c2,
    output c3,
    output c4,
    output c5,
    output c6,
    output c7
    );
    wire p;
    assign p = sta & ~(stb | stc);
    assign c0 = p & ~a[2] & ~a[1] & ~a[0];
    assign c1 = p & ~a[2] & ~a[1] & a[0];
    assign c2 = p & ~a[2] & a[1] & ~a[0];
    assign c3 = p & ~a[2] & a[1] & a[0];
    assign c4 = p & a[2] & ~a[1] & ~a[0];
    assign c5 = p & a[2] & ~a[1] & a[0];
    assign c6 = p & a[2] & a[1] & ~a[0];
    assign c7 = p & a[2] & a[1] & a[0];
endmodule
