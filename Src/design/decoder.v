`timescale 1ns / 1ns


module decoder38(
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

module decoder416(
    input [3:0] a,
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
    output c7,
    output c8,
    output c9,
    output c10,
    output c11,
    output c12,
    output c13,
    output c14,
    output c15
    );
    decoder38 m0(.a(a[2:0]), .sta(sta & 1), .stb(stb | a[3]), .stc(stc), .c0(c0), .c1(c1), .c2(c2), .c3(c3), .c4(c4), .c5(c5), .c6(c6), .c7(c7));
    decoder38 m1(.a(a[2:0]), .sta(sta & a[3]), .stb(stb | 0), .stc(stc), .c0(c8), .c1(c9), .c2(c10), .c3(c11), .c4(c12), .c5(c13), .c6(c14), .c7(c15));
 endmodule
 
 module decoder524(
    input [4:0] a,
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
    output c7,
    output c8,
    output c9,
    output c10,
    output c11,
    output c12,
    output c13,
    output c14,
    output c15,
    output c16,
    output c17,
    output c18,
    output c19,
    output c20,
    output c21,
    output c22,
    output c23
 );
    decoder38 m0(.a(a[2:0]), .sta(sta & 1), .stb(stb | a[3]), .stc(stc | a[4]), .c0(c0), .c1(c1), .c2(c2), .c3(c3), .c4(c4), .c5(c5), .c6(c6), .c7(c7));
    decoder38 m1(.a(a[2:0]), .sta(sta & a[3]), .stb(stb | a[4]), .stc(stc), .c0(c8), .c1(c9), .c2(c10), .c3(c11), .c4(c12), .c5(c13), .c6(c14), .c7(c15));
    decoder38 m2(.a(a[2:0]), .sta(sta & a[4]), .stb(stb), .stc(stc), .c0(c16), .c1(c17), .c2(c18), .c3(c19), .c4(c20), .c5(c21), .c6(c22), .c7(c23));
 endmodule
 
 module decoder532(
    input [4:0] a,
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
    output c7,
    output c8,
    output c9,
    output c10,
    output c11,
    output c12,
    output c13,
    output c14,
    output c15,
    output c16,
    output c17,
    output c18,
    output c19,
    output c20,
    output c21,
    output c22,
    output c23,
    output c24,
    output c25,
    output c26,
    output c27,
    output c28,
    output c29,
    output c30,
    output c31
 );
    decoder416 m0(
        .a(a), 
        .sta(sta), .stb(stb | a[4]), .stc(stc),
        .c0(c0), .c1(c1), .c2(c2), .c3(c3), .c4(c4), .c5(c5), .c6(c6), .c7(c7),
        .c8(c8), .c9(c9), .c10(c10), .c11(c11), .c12(c12), .c13(c13), .c14(c14), .c15(c15)    
    );
    decoder416 m1(
        .a(a),
        .sta(sta & a[4]), .stb(stb), .stc(stc),
        .c0(c16), .c1(c17), .c2(c18), .c3(c19), .c4(c20), .c5(c21), .c6(c22), .c7(c23),
        .c8(c24), .c9(c25), .c10(c26), .c11(c27), .c12(c28), .c13(c29), .c14(c30), .c15(c31)    
    );
 endmodule
 