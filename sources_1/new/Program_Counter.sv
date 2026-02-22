module Program_Counter(
    input logic [31:0] next_address,
    input logic clk, reset,
    output logic [31:0] current_address
    );
    
    //The program counter is just a 32 bit register that stores the
    //current address
    always_ff @(posedge clk) begin
        if (reset) begin
            current_address = 32'b0;
        end else begin
            current_address = next_address;
        end
    end
endmodule

