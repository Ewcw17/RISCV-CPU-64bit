module Registers(
    input logic clk, RegWrite,
    input logic [4:0] Read_Register1, Read_Register2, Write_Register,
    input logic [63:0] Write_Data,
    output logic [63:0] Read_Data1, Read_Data2
    );
    
    logic [63:0] Register_File [31:0];
    
    initial begin
        Register_File[0] = 64'd0;
        Register_File[1] = 64'd17;
        Register_File[2] = 64'd27;
        Register_File[3] = 64'd37;
        Register_File[4] = 64'd47;
        Register_File[5] = 64'd57;
        
        for (int i = 6; i < 32; i++) begin
            Register_File[i] = 64'b0;
        end
    end
    
    
    always_ff @(posedge clk) begin
        if (RegWrite) begin
            Register_File[Write_Register] = Write_Data;
        end
    end
    
    assign Read_Data1 = (Read_Register1 == 5'b0) ? 0 : Register_File[Read_Register1];
    assign Read_Data2 = (Read_Register2 == 5'b0) ? 0 : Register_File[Read_Register2];
    
endmodule
