`timescale 1ns / 1ps
module tb_Adder(
    );
    
    logic [31:0] a, b, out;
    
    Adder dut(a, b, out);
    
    initial begin
        a = 32'd1013577133; b = 32'd819726590;
        #10;
        assert( (out == 32'd1833303723))
        else begin $error ("Incorrect output for Adder test #1"); end
        
        a = 32'd7; b = 32'd10;
        #10;
        assert( (out == 32'd17))
        else begin $error ("Incorrect output for Adder test #2"); end
        
        a = 32'd0; b = 32'd0;
        #10;
        assert( (out == 32'd0))
        else begin $error ("Incorrect output for Adder test #3"); end
        
        $finish;
    end
endmodule
