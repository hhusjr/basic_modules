`timescale 1ns / 1ns


module d_latch_tb();
    reg clk, d;
    wire q;
    
    d_latch dev(
        .d(d),
        .q(q),
        .clk(clk)
    );
    
    initial begin
        d = 0;
        clk = 1;
    end
    
    always begin
        d = ~d;
        #4;
    end
    
    always begin
        clk = ~clk;
        #15;
    end
endmodule
