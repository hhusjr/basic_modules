`timescale 1ns / 1ns

module comparator_16b_tb();
    reg [15:0] a, b;
    reg in_l, in_g, in_m;
    wire l, g, m;
    reg n;
    
    comparator_16b dev(.a(a), .b(b), .in_l(in_l), .in_g(in_g), .in_m(in_m), .l(l), .g(g), .m(m));
    
    initial begin
        n = 0;
        
        in_l = 0;
        in_g = 1;
        in_m = 0;
        
        a = 28939;
        b = 12730;
        #5;
        if ({l, g, m} !== 3'b100) begin
            $display("Error: a=28939, b=12730");
            n = n + 1;
        end
        #5;
        
        a = 12730;
        b = 28939;
        #5;
        if ({l, g, m} !== 3'b001) begin
            $display("Error: a=12730, b=28939");
            n = n + 1;
        end
        #5;
        
        a = 12292;
        b = 12292;
        #5;
        if ({l, g, m} !== 3'b010) begin
            $display("Error: a=12292, b=12292");
            n = n + 1;
        end
        #5;
        
        $display("Verify OK, ERR: %d", n);
    end
endmodule

