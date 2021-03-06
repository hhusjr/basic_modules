`timescale 1ns / 1ns


module mux81_8b_tb();
    reg [2:0] a;
    wire [7:0] d;
    
    mux81_8b dev(
        .c0(0),
        .c1(1),
        .c2(2),
        .c3(3),
        .c4(4),
        .c5(5),
        .c6(6),
        .c7(7),
        
        .a(a),
        .en(1),
        
        .d(d)
    );
    
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
