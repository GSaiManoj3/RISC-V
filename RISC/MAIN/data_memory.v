// Just a Memory with no values i.e RAM basically 
module Data_Memory (
    input [31:0] Address , Write_Data,
    input Clk , Write_Enable,
    input [2:0] funct3,
    output [31:0] Read_Data
);
//Cant perform Read and write simultaneously so address is for both
reg [31:0] RAM[127:0] ;// 128*32 Memory Can be any size tho
wire [31:0] Data_Connector;

assign Data_Connector = RAM[Address[31:2]];// Since FIrst 2 Bits are considered as offset
assign Read_Data = (funct3[2] == 1'b1) ? ((funct3[0]==1'b1) ? {16'b0,Data_Connector[15:0]}: {24'b0,Data_Connector[7:0]}) : 
                   ((funct3[1] == 1'b1) ? {Data_Connector} : 
                   ((funct3[0] == 1'b1) ? {{16{Data_Connector[31]}},Data_Connector[15:0]} : {{24{Data_Connector[31]}},Data_Connector[7:0]} ) ) ; 


always @(posedge Clk)
begin
    if(Write_Enable)
    {   case(funct3)
        3'b000 : RAM[Address[31:2]] <= {Data_Connector[31:8],Write_Data[7:0]} ;
        3'b001 : RAM[Address[31:2]] <= {Data_Connector[31:16],Write_Data} ;
        3'b010 : RAM[Address[31:2]] <= Write_Data ;
        default :RAM[Address[31:2]] <= Write_Data ;
        endcase
        }
end

endmodule 

