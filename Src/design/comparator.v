`timescale 1ns / 1ps

module comparator_1b(
    input a,
    input b,
    output l,
    output g,
    output m
);
    assign l = a & ~b;
    assign g = ~(a ^ b);
    assign m = ~a & b;
endmodule

module comparator_4b(
    input [3:0] a,
    input [3:0] b,
    input in_l,
    input in_g,
    input in_m,
    output l,
    output g,
    output m
);
    wire [3:0] l1, g1, m1;
    
    comparator_1b dev0(.a(a[0]), .b(b[0]), .l(l1[0]), .g(g1[0]), .m(m1[0]));
    comparator_1b dev1(.a(a[1]), .b(b[1]), .l(l1[1]), .g(g1[1]), .m(m1[1]));
    comparator_1b dev2(.a(a[2]), .b(b[2]), .l(l1[2]), .g(g1[2]), .m(m1[2]));
    comparator_1b dev3(.a(a[3]), .b(b[3]), .l(l1[3]), .g(g1[3]), .m(m1[3]));
    
    assign l = l1[3] | g1[3] & l1[2] | g1[3] & g1[2] & l1[1] | g1[3] & g1[2] & g1[1] & l1[0] | g1[3] & g1[2] & g1[1] & g1[0] & in_l;
    assign g = g1[3] & g1[2] & g1[1] & g1[0] & in_g;
    assign m = ~l & ~g;
endmodule

module comparator_16b(
    input [15:0] a,
    input [15:0] b,
    input in_l,
    input in_g,
    input in_m,
    output l,
    output g,
    output m
    );
    
    wire l1, l2, l3, g1, g2, g3, m1, m2, m3;
    comparator_4b dev0(.a(a[3:0]), .b(b[3:0]), .in_l(in_l), .in_g(in_g), .in_m(in_m), .l(l1), .g(g1), .m(m1));
    comparator_4b dev1(.a(a[7:4]), .b(b[7:4]), .in_l(l1), .in_g(g1), .in_m(m1), .l(l2), .g(g2), .m(m2));
    comparator_4b dev2(.a(a[11:8]), .b(b[11:8]), .in_l(l2), .in_g(g2), .in_m(m2), .l(l3), .g(g3), .m(m3));
    comparator_4b dev3(.a(a[15:12]), .b(b[15:12]), .in_l(l3), .in_g(g3), .in_m(m3), .l(l), .g(g), .m(m));    
endmodule
