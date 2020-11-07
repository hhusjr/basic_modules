`timescale 1ns / 1ns


module sr_latch(
    input s,
    input r,
    output q,
    output qhat
);
    assign q = ~(r | qhat);
    assign qhat = ~(s | q);
endmodule

// Qn+1=S+~RQn£¨SR=0£©
module clocked_sr_latch(
    input s,
    input r,
    input as,
    input ar,
    input clk,
    output q,
    output qhat
);
    sr_latch m(
        .s(as | (clk & s)),
        .r(ar | (clk & r)),
        .q(q),
        .qhat(qhat)
    );
endmodule

module d_latch(
    input d,
    input clk,
    input as,
    input ar,
    output q,
    output qhat
);
    clocked_sr_latch m(
        .s(d),
        .r(~d),
        .as(as),
        .ar(ar),
        .clk(clk),
        .q(q),
        .qhat(qhat)
    );
endmodule

module d_flip_flop(
    input d,
    input clk,
    input as,
    input ar,
    output q,
    output qhat
);
    wire qd;
    d_latch master(
        .d(d),
        .clk(~clk),
        .q(qd),
        .as(0),
        .ar(0)
    );
    d_latch slave(
        .d(qd),
        .clk(clk),
        .as(as),
        .ar(ar),
        .q(q),
        .qhat(qhat)
    );
endmodule

module jk_flip_flop(
    input j,
    input k,
    input clk,
    input as,
    input ar,
    output q,
    output qhat
);
    d_flip_flop m(
        .d(j & ~q | ~k & q),
        .clk(clk),
        .q(q),
        .qhat(qhat),
        .as(as),
        .ar(ar)
    );
endmodule

module t_flip_flop(
    input clk,
    input as,
    input ar,
    output q,
    output qhat
);
    jk_flip_flop m(
        .j(1),
        .k(1),
        .clk(clk),
        .q(q),
        .as(as),
        .ar(ar),
        .qhat(qhat)
    );
endmodule
