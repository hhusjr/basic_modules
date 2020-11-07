`timescale 1ns / 1ns


module decoder38_tb();
    reg [2:0] a;
    wire c0, c1, c2, c3, c4, c5, c6, c7;
    
    decoder38 dev(.a(a), .sta(1), .stb(0), .stc(0), .c0(c0), .c1(c1), .c2(c2), .c3(c3), .c4(c4), .c5(c5), .c6(c6), .c7(c7));
    
    initial begin
        a = 0;
        while (1) begin
            #5;
            if (a === 3'b111) begin
                $stop;
            end
            a = a + 1;
        end
    end
endmodule
