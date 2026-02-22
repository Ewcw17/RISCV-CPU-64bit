`timescale 1ns / 1ps

module tb_Immediate_Generator();
    logic [31:0] Instruction;
    logic [63:0] Immediate;
    
    Immediate_Generator dut(Instruction, Immediate);
    
    initial begin
        
        Instruction = 32'b00111010101010110101010100000011;
        #10;
        assert( (Immediate == 64'b0000000000000000000000000000000000000000000000000000001110101010))
        else begin $error ("Incorrect output for Imm Gen test #1"); end
        
        Instruction = 32'b11111010101001011010101010100011;
        #10;
        assert( (Immediate == 64'b1111111111111111111111111111111111111111111111111111111110110101))
        else begin $error ("Incorrect output for Imm Gen test #2"); end
        
        Instruction = 32'b01010101100110010011010101100011;
        #10;
        assert( (Immediate == 64'b0000000000000000000000000000000000000000000000000000001010100101))
        else begin $error ("Incorrect output for Imm Gen test #3"); end
        
        Instruction = 32'b11010010001001000110110110100011;
        #10;
        assert( (Immediate == 64'b1111111111111111111111111111111111111111111111111111110100111011))
        else begin $error ("Incorrect output for Imm Gen test #4"); end
        
        $finish;
        
    end
endmodule