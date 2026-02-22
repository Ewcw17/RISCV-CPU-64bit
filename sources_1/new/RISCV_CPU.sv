module RISCV_CPU(
    input logic clk, reset
    );
    
    //Data Signals
    //For Instruction fetch and next address
    logic [31:0] Program_Counter_out;
    logic [31:0] Next_Address;
    logic [31:0] Branch_Location;
    logic [31:0] Incremented_Address;
    logic [31:0] Instruction;
    
    //Memory and R-type instruction signals
    logic [63:0] RegisterRead1, RegisterRead2;
    logic [63:0] ALU_Input2;
    logic [63:0] ALU_Result;
    logic [63:0] DataMem_Read;
    logic [63:0] Write_Data;
    logic [63:0] ImmGen;
    
    //Control Signals
    logic Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUZero;
    logic [1:0] ALUOp;
    logic [3:0] Opcode;
    
    //Initialising Modules
    
    //Instruction Fetch
    Program_Counter PC(.next_address(Next_Address), .clk(clk), .reset(reset),
        .current_address(Program_Counter_out));
    Instruction_Memory IM(.Current_Address(Program_Counter_out), .Instruction(Instruction));
    Adder AD1(.a(Program_Counter_out), .b(32'd4), .out(Incremented_Address));
    Adder AD2(.a(Program_Counter_out), .b({ImmGen[30:0], 1'b0}), .out(Branch_Location));
    Mux2to1_32bit Mux32(.a(Incremented_Address), .b(Branch_Location),
        .select(Branch & ALUZero), .out(Next_Address));
    
    //R-type Modules
    Registers Regs(.clk(clk), .RegWrite(RegWrite), .Read_Register1(Instruction[19:15]),
        .Read_Register2(Instruction[24:20]), .Write_Register(Instruction[11:7]),
        .Write_Data(Write_Data), .Read_Data1(RegisterRead1), .Read_Data2(RegisterRead2));
    RISC_ALU ALU(.a(RegisterRead1), .b(ALU_Input2), .opcode(Opcode), .out(ALU_Result),
        .zero(ALUZero));
    Mux2to1_64bit Mux64_1(.a(RegisterRead2), .b(ImmGen), .select(ALUSrc), .out(ALU_Input2));
    Immediate_Generator IG(.Instruction(Instruction), .Immediate(ImmGen));
    ALU_Control ALUCont(.ALUOp(ALUOp), .funct7(Instruction[31:25]),
        .funct3(Instruction[14:12]), .Opcode(Opcode));
    //////////
    //////////////
    
    //Memory Modules(no SZA)
    Control Ctrl(.Instruction_Opcode(Instruction[6:0]), .Branch(Branch),
        .MemtoReg(MemtoReg), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite),
        .ALUOp(ALUOp));
    Data_Memory DM(.MemRead(MemRead), .MemWrite(MemWrite), .clk(clk),
        .Address(ALU_Result), .Write_Data(RegisterRead2), .Read_Data(DataMem_Read));
    Mux2to1_64bit Mux64_2(.a(DataMem_Read), .b(ALU_Result), .select(MemtoReg),
        .out(Write_Data));
    
endmodule
