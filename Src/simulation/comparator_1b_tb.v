`timescale 1ns / 1ns

module comparator_1b_tb();
    reg a, b;
    reg [2:0] e;
    wire l, g, m;
    
    comparator_1b cp(.a(a), .b(b), .l(l), .g(g), .m(m));
    
    initial begin
        e = 0;
        
        a = 0;
        b = 0;
        #5;
        if ({l, g, m} !== 3'b010) begin
            $display("Error: a=0, b=0");
            e = e + 1;
        end
        #5;
        
        a = 1;
        b = 1;
        #5;
        if ({l, g, m} !== 3'b010) begin
            $display("Error: a=1, b=1");
            e = e + 1;
        end
        #5;
        
        a = 0;
        b = 1;
        #5;
        if ({l, g, m} !== 3'b001) begin
            $display("Error: a=0, b=1");
            e = e + 1;
        end
        #5;
        
        a = 1;
        b = 0;
        #5;
        if ({l, g, m} !== 3'b100) begin
            $display("Error: a=1, b=0");
            e = e + 1;
        end
        #5;
        
        $display("Verify OK, ERR: %d", e);
    end
endmodule
