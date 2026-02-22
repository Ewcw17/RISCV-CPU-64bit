# RISCV-CPU-64bit
Simplified Implementation of a 64-bit RISCV CPU in SystemVerilog

Simply put, this project is a CPU able to run an assembly instructions if they are written following the RISC-V Instruction Set Architecture.\
This project was realised using AMD Vivado as a hardware design suite. 

# Implementation Details
This subset of the RISC-V ISA supports the following instructions:
- (R-Type) and, or, add, sub
- (I-type) ld
- (S-type) sd
- (B-type) beq

This follows the implementation found in "Computer Organisation and Design - The Hardware/Software Interface, RISC-V Edition" by David A. Patterson and John L. Henessey. The names of modules and files have been delicately written so as to adhere to the terminology found in the textbook. This is to aid in a holistic understanding of the project.

A picture of the implementation can be found below:
![fire](https://github.com/Ewcw17/RISCV-CPU-64bit/blob/main/Pictures/Implementation_Scheme.png?raw=true)

This is considered a 64-bit implementation because the size of the registers, as well as the size of ALU operands are both 64-bit. This is not to be confused with the fact that all RISC-V instructions are 32-bits wide. 

# Overview and Description of Major modules
- **Program Counter**\
*This module is responsible for determining which instruction to execute next. In this implementation, it either takes the next instruction in memory(4 bytes away, due to each instruction being 32-bits wide), or it can use a branch instruction to branch to any address.*
- **Instruction Memory**\
*This module is where the assembly program would be stored. Depending on the address fed to it by the program counter, it would search through its memory to find the corresponding instruction.*
- **Register File**(Registers.sv)\
*For the RISC architectures, different to accumulator architectures, all operations are performed with the help of multiple registers. In this case, there are 32 registers in which intermediate values may be stored and manipulated. The prior instruction is broken up into multiple parts and portioned out to the register file as well as other modules.*
- **ALU(Arithmetic Logic Unit)**\
*This module is responsible for a mojority of the mathematical and logical operations performed by the CPU. This would include simple addition, indexing an array using immediates and determining when to branch or not.*
- **Control**\
*To help the CPU decide whether to store information in memory, to add, to read from a register, many control signals are required. This module dissects the given instruction and determines which modules to use and how.*
- **Data Memory**\
*This is where data is stored when not needed as urgently as registers. In this project, only 256 addressable locations are actually made available for memory. Of course, more can be added or removed.*

# Testbenching
Similarly to how on another hardware design suite such as Quartus, waveform simulations would be performed, in Vivado, this is done using a process known as testbenching. Here, simulation parameters are written in SystemVerilog and will thus be shown in the Vivado simulation window. \
Below is an image of a testbench for the Data Memory:
![fire](https://github.com/Ewcw17/RISCV-CPU-64bit/blob/main/Pictures/Data_Memory_Testbench.png?raw=true)
As can be observed, while the MemWrite signal is high, the data is written to memory. Subsequently, when the MemRead signal is high, that same value can be read from memory. As per specification, MemRead and MemWrite should never be asserted simultaneously; they produce 0 as a result.

Similarly for the Data Memory, testbenches were performed for a large majority of the modules. They can be found in /Testbenches

# À faire
- Implementation of the remaining instruction types(Easy)
- Pipelined implementation for efficiency(Medium)
- Proper testing of a full assembly program(Easy)