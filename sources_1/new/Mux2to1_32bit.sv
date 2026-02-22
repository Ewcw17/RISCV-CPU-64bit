module Mux2to1_32bit(
    input logic [31:0] a, b,
    input logic select,
    output logic [31:0] out
    );
    
    always_comb begin
        out = select ? b : a;
    end
endmodule
