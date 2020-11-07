`timescale 1ns / 1ns

module t_flip_flop_tb();
    reg clk, as, ar;
    wire q, qhat;
    t_flip_flop m(
        .clk(clk),
        .q(q),
        .ar(ar),
        .as(as)
    );
    
    initial begin
        clk = 0;
        as = 1;
        ar = 0;
        #5;
        as = 0;
    end
    
    always begin
        #15;
        clk = ~clk;
    end
endmodule
