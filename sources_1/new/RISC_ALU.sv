`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2026 07:01:26 PM
// Design Name: 
// Module Name: RISC_ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RISC_ALU(
    input logic [63:0] a,
    input logic [63:0] b,
    input logic [3:0] opcode, 
    output logic [63:0] out,
    output logic zero
    );
    
    always @(a, b, opcode) begin
        case(opcode)
        // For the other general instructions
        4'b0000: out = a & b;
        4'b0001: out = a | b;
        4'b0010: out = a + b;
        4'b0110: out = a - b;
        
        //For branching instructions
        4'b0111: out = (a < b ? 1 : 0);
        default: out = 32'b0;
        endcase
    end
    
    always_comb begin
        if (out == 1'b0) begin
            assign zero = 1'b1;
        end else begin
            assign zero = 1'b0;
        end
    end 
    
endmodule
