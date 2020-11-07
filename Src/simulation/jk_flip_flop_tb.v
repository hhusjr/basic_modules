`timescale 1ns / 1ns


module jk_flip_flop_tb();
    reg j, k, clk;
    wire q;
    
    jk_flip_flop dev(
        .j(j),
        .k(k),
        .clk(clk),
        .q(q)
    );
    
    initial begin
        // Qn+1 = J*~Qn + ~K*Qn
        clk = 0;
        j = 1;
        k = 0;
    end
    
    always begin
        clk = ~clk;
        #15;
    end
    
    always begin
        #9;
        j = ~j;
    end
    
    always begin
        #4;
        k = ~k;
    end
endmodule
