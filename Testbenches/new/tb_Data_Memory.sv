`timescale 1ns / 1ps

module tb_Data_Memory();

    logic MemRead, MemWrite, clk = 1'b0;
    logic [63:0] Address, Write_Data, Read_Data;
    
    Data_Memory dut(MemRead, MemWrite, clk, Address, Write_Data, Read_Data);
    
    logic running = 1'b1;
    
    always begin
        #5;
        if (running) 
            clk = ~clk;
        else 
            $finish;
    end
    
    initial begin
    
        MemWrite = 1'b0; MemRead = 1'b0;
        Address = 64'd225; Write_Data = 64'd55;
        #10;
        assert( (Read_Data == 64'd0))
        else begin $error ("Incorrect output for Data Memory test #1"); end
        
        MemWrite = 1'b1; MemRead = 1'b1;
        Address = 64'd225; Write_Data = 64'd55;
        #10;
        assert( (Read_Data == 64'd0))
        else begin $error ("Incorrect output for Data Memory test #2"); end
        
        MemWrite = 1'b1; MemRead = 1'b0;
        Address = 64'd225; Write_Data = 64'd637;
        #10;
        assert( (Read_Data == 64'd0))
        else begin $error ("Incorrect output for Data Memory test #3"); end
        
        Address = 64'd5; Write_Data = 64'd776;
        #10;
        assert( (Read_Data == 64'd0))
        else begin $error ("Incorrect output for Data Memory test #4"); end
        
        Address = 64'd10; Write_Data = 64'd100000;
        #10;
        assert( (Read_Data == 64'd0))
        else begin $error ("Incorrect output for Data Memory test #5"); end
        
        MemWrite = 1'b0; MemRead = 1'b1;
        Address = 64'd5; Write_Data = 64'd55;
        #10;
        assert( (Read_Data == 64'd776))
        else begin $error ("Incorrect output for Data Memory test #6"); end
        
        Address = 64'd225; Write_Data = 64'd55;
        #10;
        assert( (Read_Data == 64'd637))
        else begin $error ("Incorrect output for Data Memory test #7"); end
        
        Address = 64'd10; Write_Data = 64'd55;
        #10;
        assert( (Read_Data == 64'd100000))
        else begin $error ("Incorrect output for Data Memory test #8"); end

        running = 1'b0;
    end
    
endmodule