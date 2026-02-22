//This is a 32 bit adder because the chosen memory size is 32 bits
//This adder is used only for incrementing memory addresses
module Adder(
    input logic [31:0] a, b,
    output logic [31:0] out
    );
    
    always_comb begin
        out = a + b;
    end

endmodule