`timescale 1ns / 1ns


module decoder416_tb();
    reg [3:0] a;
    wire c0, c1, c2, c3, c4, c5, c6, c7;
    wire c8, c9, c10, c11, c12, c13, c14, c15;
    
    decoder416 dev(
        .a(a), 
        .sta(1), .stb(0), .stc(0), 
        .c0(c0), .c1(c1), .c2(c2), .c3(c3), .c4(c4), .c5(c5), .c6(c6), .c7(c7),
        .c8(c8), .c9(c9), .c10(c10), .c11(c11), .c12(c12), .c13(c13), .c14(c14), .c15(c15)    
    );
    
    initial begin
        a = 0;
        while (1) begin
            #5;
            if (a === 4'b1111) begin
                $stop;            
            end
            a = a + 1;
        end
    end
endmodule
