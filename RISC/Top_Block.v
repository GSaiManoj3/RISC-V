`include "MAIN/data_memory.v"
`include "MAIN/instruction_memory.v"
`include "MAIN/risc.v"
module Top (
    input Clk, Reset,
    output [31:0] AluResult_Memory 
);
wire [2:0] funct3;
wire Memory_Write;
wire [31:0] Pc,InstrF,ReadData_Memory,WriteData_Memory;
RISC_V cpu (Clk,Reset,InstrF,ReadData_Memory,Pc,AluResult_Memory,WriteData_Memory,Memory_Write,funct3);
Instruction_Memory imem(Pc,InstrF);
Data_Memory dmem(AluResult_Memory,WriteData_Memory,Clk,Memory_Write,funct3,ReadData_Memory);
endmodule
