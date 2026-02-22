module ALU_Control(
    input logic [1:0] ALUOp,
    input logic [6:0] funct7,
    input logic [2:0] funct3,
    output logic [3:0] Opcode
    );
    
    //funct7 = Instruction[31:25];
    //funct3 = Instruction[14:12];
    
    always_comb begin
        case(ALUOp)
        
        2'b00: begin
            Opcode = 4'b0010;
        end
        
        2'b01: begin
            Opcode = 4'b0110;
        end
            
        2'b10: begin
            if(funct7 == 7'b000000 && funct3 == 3'b000) begin
                Opcode = 4'b0010;
            end else if(funct7 == 7'b0100000 && funct3 == 3'b000) begin
                Opcode = 4'b0110;
            end else if(funct7 == 7'b0000000 && funct3 == 3'b111) begin
                Opcode = 4'b0000;
            end else if(funct7 == 7'b0000000 && funct3 == 3'b110) begin
                Opcode = 4'b0001;
            end
        end
        
        default begin
            Opcode = 4'b0000;
        end
        endcase
    end
endmodule
