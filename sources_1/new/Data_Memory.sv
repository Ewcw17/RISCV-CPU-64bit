module Data_Memory(
    input logic MemRead, MemWrite, clk,
    input logic [63:0] Address, Write_Data,
    output logic [63:0] Read_Data
    );
    
    //The memory module only has 256 slots or 2^8 addressable locations
    //Since we are implementing a 64-bit implementation, each location is 64 bits wide
    logic [63:0] Memory [255:0];
    
    //To write data, we need a positive edge
    always_ff @(posedge clk) begin
        if(MemWrite == 1'b1 && MemRead == 1'b0) begin
            Memory[Address[7:0]] <= Write_Data;
            $display("Write Data: %h", Write_Data);
            $display("Memory: %h", Memory[Address[7:0]]);
        end
    end
    
    //Reading is combinational, so it can happen whenever, but only one of MemWrite and MemRead
    //is allowed to be asserted at a time
    always_comb begin
        if(MemRead == 1'b1 && MemWrite == 1'b0) begin
            assign Read_Data = Memory[Address[7:0]];
        end else begin
            assign Read_Data = 64'h0;
        end
    end         
    
endmodule