module Instruction_Memory(
    input logic [31:0] Current_Address,
    output logic [31:0] Instruction
    );
    
    logic [31:0] Not_Memory [31:0];
    
    initial
		$readmemh("test.txt.txt", Not_Memory);
		//Add r17 r4 r5
		//or r18 r2 r3
		//sd r17 6(r10)
    always_comb begin
        Instruction = Not_Memory[Current_Address[31:2]];
    end
endmodule
