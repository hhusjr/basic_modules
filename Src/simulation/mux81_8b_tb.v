`timescale 1ns / 1ns


module mux81_8b_tb();
    wire [2:0] a;
    wire [7:0] d;
    
    mux81_8b dev(
        .c0(8'b00000001),
        .c1(8'b00000010),
        .c2(8'b00000100),
        .c3(8'b00001000),
        .c4(8'b00010000),
        .c5(8'b00100000),
        .c6(8'b01000000),
        .c7(8'b10000000),
        
        .a(a),
        .en(1),
        
        .d(d)
    );
    
    initial begin
        
    end
endmodule
