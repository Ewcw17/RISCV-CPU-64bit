`timescale 1ns / 1ps

module tb_RISCV_CPU();

    logic clk = 1'b0, reset;
    
    RISCV_CPU dut(clk, reset);
    
    logic running = 1'b1;
    
    always #5 clk = ~clk;
    
    initial begin
        reset = 1'b1;
        #25;
        reset = 1'b0;
        #13;
    
        $stop;
    end
endmodule
