`timescale 1ns / 1ns


module mux81_16b_tb();
    reg [3:0] a;
    wire [7:0] d;
    
    mux81_16b dev(
        .c0(0),
        .c1(1),
        .c2(2),
        .c3(3),
        .c4(4),
        .c5(5),
        .c6(6),
        .c7(7),
        .c8(8),
        .c9(9),
        .c10(10),
        .c11(11),
        .c12(12),
        .c13(13),
        .c14(14),
        .c15(15),
        
        .a(a),
        .en(1),
        
        .d(d)
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
