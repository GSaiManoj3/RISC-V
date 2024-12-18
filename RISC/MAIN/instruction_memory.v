//This is where we write our code and it is also byte addressable
// We can read in it but can't write in it
module Instruction_Memory (
    input [31:0] Address ,
    output reg [31:0] Read_Data 
);
//This could be considered as ROM because processor cant write in it 
// But we are writing so Technically not a ROM just memory maybe....    
reg [7:0] MEMORY [128:0] ;

initial begin
    {MEMORY[3],MEMORY[2],MEMORY[1],MEMORY[0]} = 32'h00500113;
    {MEMORY[7],MEMORY[6],MEMORY[5],MEMORY[4]} = 32'h00C00193;
    {MEMORY[11],MEMORY[10],MEMORY[9],MEMORY[8]} = 32'hFF718393;
    {MEMORY[15],MEMORY[14],MEMORY[13],MEMORY[12]} = 32'h0023E233;
    {MEMORY[19],MEMORY[18],MEMORY[17],MEMORY[16]} = 32'h0041C2B3;
    {MEMORY[23],MEMORY[22],MEMORY[21],MEMORY[20]} = 32'h004283B3;
    {MEMORY[27],MEMORY[26],MEMORY[25],MEMORY[24]} = 32'h02728863;
    {MEMORY[31],MEMORY[30],MEMORY[29],MEMORY[28]} = 32'h0041A233;
    {MEMORY[35],MEMORY[34],MEMORY[33],MEMORY[32]} = 32'h00020463;
    {MEMORY[39],MEMORY[38],MEMORY[37],MEMORY[36]} = 32'h00000293;
    {MEMORY[43],MEMORY[42],MEMORY[41],MEMORY[40]} = 32'h0023A233;
    {MEMORY[47],MEMORY[46],MEMORY[45],MEMORY[44]} = 32'h005203B3;
    {MEMORY[51],MEMORY[50],MEMORY[49],MEMORY[48]} = 32'h402383B3;
    {MEMORY[55],MEMORY[54],MEMORY[53],MEMORY[52]} = 32'h0471AA23;
    {MEMORY[59],MEMORY[58],MEMORY[57],MEMORY[56]} = 32'h06002103;
    {MEMORY[63],MEMORY[62],MEMORY[61],MEMORY[60]} = 32'h005104B3;
    {MEMORY[67],MEMORY[66],MEMORY[65],MEMORY[64]} = 32'h008001EF;
    {MEMORY[71],MEMORY[70],MEMORY[69],MEMORY[68]} = 32'h00100113;
    {MEMORY[75],MEMORY[74],MEMORY[73],MEMORY[72]} = 32'h00910133;
    {MEMORY[79],MEMORY[78],MEMORY[77],MEMORY[76]} = 32'h00100213;
    {MEMORY[83],MEMORY[82],MEMORY[81],MEMORY[80]} = 32'h800002B7;
    {MEMORY[87],MEMORY[86],MEMORY[85],MEMORY[84]} = 32'h0042A333;
    {MEMORY[91],MEMORY[90],MEMORY[89],MEMORY[88]} = 32'h00030063;
    {MEMORY[95],MEMORY[94],MEMORY[93],MEMORY[92]} = 32'hABCDE4B7;
    {MEMORY[99],MEMORY[98],MEMORY[97],MEMORY[96]} = 32'h00910133;
    {MEMORY[103],MEMORY[102],MEMORY[101],MEMORY[100]} = 32'h0421A023;
    {MEMORY[107],MEMORY[106],MEMORY[105],MEMORY[104]} = 32'h00210063;
end
// Introduction using hex file 
always @(*) begin
    Read_Data = {MEMORY[Address+3],MEMORY[Address+2],MEMORY[Address+1],MEMORY[Address]};
    //Considering as a Little Endian Processor.....
end

endmodule
