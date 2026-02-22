`timescale 1ns / 1ps

module tb_ALU_Control();

    logic [1:0] ALUOp;
    logic [6:0] funct7;
    logic [2:0] funct3;
    logic [3:0] Opcode;

    ALU_Control dut(ALUOp, funct7, funct3, Opcode);
    
    initial begin 
        //Testing when Opcode should be add, regardless of funct3 and funct7
        //For storing and loading instructions
        ALUOp = 2'b00; funct7 = 7'b1010011; funct3 = 3'b101;
        #10;
        assert(Opcode == 4'b0010)
        else begin $error ("Incorrect output for ALU_Control test #1"); end
        
        //Testing when Opcode should be subtract, regardless of funct3 and funct7
        //For branch if equal instruction
        ALUOp = 2'b01; funct7 = 7'b1110110; funct3 = 3'b000;
        #10;
        assert(Opcode == 4'b0110)
        else begin $error("Incorrect output for ALU_Control test #2"); end
        
        //Testing when Opcode should be variable, due to funct7 and funct 3
        //For R-type instructions
        ALUOp = 2'b10; funct7 = 7'b0100000; funct3 = 3'b000;
        #10;
        assert(Opcode == 4'b0110)
        else begin $error("Incorrect output for ALU_Control test #3"); end
        
        ALUOp = 2'b10; funct7 = 7'b0000000; funct3 = 3'b110;
        #10;
        assert(Opcode == 4'b0001)
        else begin $error("Incorrect output for ALU_Control test #4"); end
        
        ALUOp = 2'b10; funct7 = 7'b0000000; funct3 = 3'b111;
        #10;
        assert(Opcode == 4'b0000)
        else begin $error("Incorrect output for ALU_Control test #5"); end
        
        $finish;
    end
    
endmodule