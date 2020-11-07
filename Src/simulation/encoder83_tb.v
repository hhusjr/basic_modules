`timescale 1ns / 1ns


module encoder83_tb();
    wire [2:0] a;
    reg [7:0] s;
    
    encoder83 dev(
        .c0(s[0]), .c1(s[1]), .c2(s[2]), .c3(s[3]), .c4(s[4]), .c5(s[5]), .c6(s[6]), .c7(s[7]),
        .en(1), .a(a)
    );
    
    initial begin
        s = 8'b11111111;
        while (1) begin
            #5;
            if (s === 8'b00000001) begin
                $stop;
            end
            s = s >> 1;
        end
    end
endmodule
