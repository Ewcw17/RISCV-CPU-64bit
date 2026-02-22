`timescale 1ns / 1ps

module tb_Control();

    logic [6:0] Opcode;
    logic Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    logic [1:0] ALUOp;
    
    Control dut(Opcode, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUOp);
    
    initial begin
        Opcode = 7'b0110011;
        #10;
        assert(Branch == 1'b0 && MemRead == 1'b0 && MemtoReg == 1'b0 && MemWrite == 1'b0 &&
            ALUSrc == 1'b0 && RegWrite == 1'b1 && ALUOp == 2'b10)
        else begin $error ("Incorrect output for Control test #1"); end
        
        Opcode = 7'b0000011;
        #10;
        assert(Branch == 1'b0 && MemRead == 1'b1 && MemtoReg == 1'b1 && MemWrite == 1'b0 &&
            ALUSrc == 1'b1 && RegWrite == 1'b1 && ALUOp == 2'b00)
        else begin $error ("Incorrect output for Control test #2"); end
        
        Opcode = 7'b0100011;
        #10;
        assert(Branch == 1'b0 && MemRead == 1'b0 && MemWrite == 1'b1 &&
            ALUSrc == 1'b1 && RegWrite == 1'b0 && ALUOp == 2'b00)
        else begin $error ("Incorrect output for Control test #3"); end
        
        Opcode = 7'b1100011;
        #10;
        assert(Branch == 1'b1 && MemRead == 1'b0 && MemWrite == 1'b0 &&
            ALUSrc == 1'b0 && RegWrite == 1'b0 && ALUOp == 2'b01)
        else begin $error ("Incorrect output for Control test #4"); end
    
        $finish;
    end

endmodule