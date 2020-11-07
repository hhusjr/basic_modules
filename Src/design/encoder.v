`timescale 1ns / 1ns

module encoder83(
    input c0, // 000 highest priority
    input c1, // 001
    input c2, // 010
    input c3, // 011
    input c4, // 100
    input c5, // 101
    input c6, // 110
    input c7, // 111 lowest priority
    input en,
    output y,
    output y_ex,
    output [2:0] a
    );
    assign a[2] = en & (c4 | c5 | c6 | c7);
    assign a[1] = en & (c7 | c6 | ~c5 & ~c4 & (c3 | c2));
    assign a[0] = en & (c7 | ~c6 & (c5 | ~c4 & (c3 | (~c2 & c1))));
    wire p;
    assign p = c0 | c1 | c2 | c3 | c4 | c5 | c6 | c7;
    assign y = en & ~p;
    assign y_ex = en & ~y;
endmodule

module encoder164(
    input c0,
    input c1,
    input c2,
    input c3,
    input c4,
    input c5,
    input c6,
    input c7,
    input c8,
    input c9,
    input c10,
    input c11,
    input c12,
    input c13,
    input c14,
    input c15,
    input en,
    output y,
    output y_ex,
    output [3:0] a
);
    wire [2:0] o1, o2;
    wire y1;
    
    assign a[2:0] = o1 | o2;
    
    encoder83 m0(
        .c0(c0),
        .c1(c1),
        .c2(c2),
        .c3(c3),
        .c4(c4),
        .c5(c5),
        .c6(c6),
        .c7(c7),
        
        .en(y1),
        .a(o1[2:0]),
        .y(y)
    );
    encoder83 m1(
        .c0(c8),
        .c1(c9),
        .c2(c10),
        .c3(c11),
        .c4(c12),
        .c5(c13),
        .c6(c14),
        .c7(c15),
        
        .en(en),
        .a(o2[2:0]),
        .y(y1),
        .y_ex(a[3])
    );
    
    assign y_ex = en & ~(y1 & y);
endmodule
