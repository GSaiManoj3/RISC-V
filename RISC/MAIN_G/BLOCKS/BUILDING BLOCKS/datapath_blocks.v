// Implementing a 32 Bit Gate Level Mux 
module SingleBit (
    input Data1, Data2, Data3,
    input [1:0] Select,
    output Result
);
wire [2:0] Connectors;
and G1(Connectors[0],Data1,(~Select[0]),(~Select[1]));
and G2(Connectors[1],Data2,(Select[0]),(~Select[1]));
and G3(Connectors[2],Data3,(~Select[0]),(Select[1]));
or  G4(Result,Connectors[0],Connectors[1],Connectors[2]);
endmodule 

module Mux3 (
    input [31:0] Data1, Data2, Data3,
    input [1:0] Select,
    output [31:0] Result 
);

SingleBit G1 (Data1[0],Data2[0],Data3[0],Select,Result[0]);
SingleBit G2 (Data1[1],Data2[1],Data3[1],Select,Result[1]);
SingleBit G3 (Data1[2],Data2[2],Data3[2],Select,Result[2]);
SingleBit G4 (Data1[3],Data2[3],Data3[3],Select,Result[3]);
SingleBit G5 (Data1[4],Data2[4],Data3[4],Select,Result[4]);
SingleBit G6 (Data1[5],Data2[5],Data3[5],Select,Result[5]);
SingleBit G7 (Data1[6],Data2[6],Data3[6],Select,Result[6]);
SingleBit G8 (Data1[7],Data2[7],Data3[7],Select,Result[7]);
SingleBit G9 (Data1[8],Data2[8],Data3[8],Select,Result[8]);
SingleBit G10 (Data1[9],Data2[9],Data3[9],Select,Result[9]);
SingleBit G11 (Data1[10],Data2[10],Data3[10],Select,Result[10]);
SingleBit G12 (Data1[11],Data2[11],Data3[11],Select,Result[11]);
SingleBit G13 (Data1[12],Data2[12],Data3[12],Select,Result[12]);
SingleBit G14 (Data1[13],Data2[13],Data3[13],Select,Result[13]);
SingleBit G15 (Data1[14],Data2[14],Data3[14],Select,Result[14]);
SingleBit G16 (Data1[15],Data2[15],Data3[15],Select,Result[15]);
SingleBit G17 (Data1[16],Data2[16],Data3[16],Select,Result[16]);
SingleBit G18 (Data1[17],Data2[17],Data3[17],Select,Result[17]);
SingleBit G19 (Data1[18],Data2[18],Data3[18],Select,Result[18]);
SingleBit G20 (Data1[19],Data2[19],Data3[19],Select,Result[19]);
SingleBit G21 (Data1[20],Data2[20],Data3[20],Select,Result[20]);
SingleBit G22 (Data1[21],Data2[21],Data3[21],Select,Result[21]);
SingleBit G23 (Data1[22],Data2[22],Data3[22],Select,Result[22]);
SingleBit G24 (Data1[23],Data2[23],Data3[23],Select,Result[23]);
SingleBit G25 (Data1[24],Data2[24],Data3[24],Select,Result[24]);
SingleBit G26 (Data1[25],Data2[25],Data3[25],Select,Result[25]);
SingleBit G27 (Data1[26],Data2[26],Data3[26],Select,Result[26]);
SingleBit G28 (Data1[27],Data2[27],Data3[27],Select,Result[27]);
SingleBit G29 (Data1[28],Data2[28],Data3[28],Select,Result[28]);
SingleBit G30 (Data1[29],Data2[29],Data3[29],Select,Result[29]);
SingleBit G31 (Data1[30],Data2[30],Data3[30],Select,Result[30]);
SingleBit G32 (Data1[31],Data2[31],Data3[31],Select,Result[31]);

endmodule

module Test();
reg [31:0] Data1,Data2,Data3;
reg [1:0] Select;
wire [31:0] Result ;

Forward2 dut(Data1,Data2,Data3,Select,Result);

initial begin
    $dumpvars(0,Test);
    $dumpfile("Dump.vcd");
end

initial begin
    $monitor($time," %d %d",Result,Select);
    #10;
    Data1 = 32'hFFFFFFFF;
    Data2 = 32'h00000000;
    Data3 = 32'h0000FFFF;
    #10;
    Select = 2'b00;
    #10;
    Select = 2'b01;
    #10;
    Select = 2'b10;
    #10;
    Select = 2'b11;
    $finish;
end
endmodule

///// Implementing For a single bit 
module Forward2 (
  input [31:0] rd2 , Result_WriteBack , Alu_Result_M ,
  input [1:0] Select,
  output [31:0] Result
);
Mux3 G1(rd2,Result_WriteBack,Alu_Result_M,Select,Result);
endmodule 

module Forward1 (
    input [31:0] rd1 , Result_WriteBack , Alu_Result_M ,
    input [1:0] Select,
    output [31:0] Pc_Next
  );
  Mux3 G1(rd1,Result_WriteBack,Alu_Result_M,Select,Pc_Next);
  endmodule 
  //////// Verifying MUX

module Sign_Extend (
    input [31:0] Instruction,
    input [2:0] ImmSrc,
    output [31:0] Imm_Extend
);
localparam I = 3'b000,
           B = 3'b010,
           J = 3'b011,
           S = 3'b001,
           L = 3'b000;

wire [31:0] Imm_I , Imm_B , Imm_J , Imm_S , Imm_L;
Imm_I = {{20{Instruction[31]}},Instruction[31:20]};


endmodule