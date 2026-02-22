module Control(
    input logic [6:0] Instruction_Opcode,
    output logic Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
    output logic [1:0] ALUOp
    );
    
    always_comb begin
        case(Instruction_Opcode)
        //R-type instructions
        7'b0110011: begin
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b1;
            ALUOp = 2'b10;
        end
        //ld Instruction (Load Doubleword) 
        7'b0000011: begin
            Branch = 1'b0;
            MemRead = 1'b1;
            MemtoReg = 1'b1;
            MemWrite = 1'b0;
            ALUSrc = 1'b1;
            RegWrite = 1'b1;
            ALUOp = 2'b00;
        end
        //sd Instruction (Store Doubleword)
        7'b0100011: begin
            Branch = 1'b0;
            MemRead = 1'b0;
            MemtoReg = 1'b?;
            MemWrite = 1'b1;
            ALUSrc = 1'b1;
            RegWrite = 1'b0;
            ALUOp = 2'b00;
        end
        //beq Instruction (Branch if not equal)
        7'b1100011: begin
            Branch = 1'b1;
            MemRead = 1'b0;
            MemtoReg = 1'b?;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            RegWrite = 1'b0;
            ALUOp = 2'b01;
        end 
        default : begin
            Branch = 1'b?;
            MemRead = 1'b?;
            MemtoReg = 1'b?;
            MemWrite = 1'b?;
            ALUSrc = 1'b?; 
            RegWrite = 1'b?;
            ALUOp = 2'b??;
        end
        endcase
    end
endmodule
