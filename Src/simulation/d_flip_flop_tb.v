`timescale 1ns / 1ns


module d_flip_flop_tb();
    reg clk, d;
    wire q;
    
    d_flip_flop dev(
        .d(d),
        .q(q),
        .clk(clk)
    );
    
    initial begin
        d = 0;
        clk = 0;
    end
    
    always begin
        d = ~d;
        #3;
    end
    
    always begin
        clk = ~clk;
        #5;
    end
endmodule
