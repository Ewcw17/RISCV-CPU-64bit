`timescale 1ns / 1ps

module tb_Instruction_Memory();

    logic [31:0] Current_Address;
    logic [31:0] Instruction;
    
    Instruction_Memory dut(Current_Address, Instruction);
    
    initial begin
       Current_Address = 32'h0;
       #10;
       
       Current_Address = 32'h8;
       #10;
       
       Current_Address = 32'h4;
       #10;
       
       $finish;
    end
    
endmodule