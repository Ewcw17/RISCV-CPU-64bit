module Mux2to1_64bit(
    input logic [63:0] a, b,
    input logic select,
    output logic [63:0] out
    );
    
    always_comb begin
        out = select ? b : a;
    end
endmodule
