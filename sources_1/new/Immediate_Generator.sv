module Immediate_Generator(
    input logic [31:0] Instruction,
    output logic [63:0] Immediate
    );
    
    logic [6:0] opcode;
    
    always_comb begin
    
        logic [6:0] opcode = Instruction[6:0];
    
        case(opcode)
        
        7'b0000011: begin //ld
            Immediate = {{52{Instruction[31]}}, Instruction[31:20]};
        end
        7'b0100011: begin //sd
            Immediate = {{52{Instruction[31]}}, Instruction[31:25], Instruction[11:7]};
        end
        7'b1100011: begin //beq
            Immediate = {{52{Instruction[31]}}, Instruction[31], Instruction[7], Instruction[30:25], Instruction[11:8]};
        end
        endcase
    end
endmodule
