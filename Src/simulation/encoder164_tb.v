`timescale 1ns / 1ns


module encoder164_tb();
    wire [3:0] a;
    reg [15:0] s;
    
    encoder164 dev(
        .c0(s[0]), .c1(s[1]), .c2(s[2]), .c3(s[3]), .c4(s[4]), .c5(s[5]), .c6(s[6]), .c7(s[7]),
        .c8(s[8]), .c9(s[9]), .c10(s[10]), .c11(s[11]), .c12(s[12]), .c13(s[13]), .c14(s[14]), .c15(s[15]),
        .en(1), .a(a)
    );
    
    initial begin
        s = 16'b1111111111111111;
        while (1) begin
            #5;
            if (s === 16'b0000000000000001) begin
                $stop;
            end
            s = s >> 1;
        end
    end
endmodule
