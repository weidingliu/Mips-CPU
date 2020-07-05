`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/17 14:10:02
// Design Name: 
// Module Name: datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath(input CLK,reset,IorD,MemWrite,IRWrite,RegDst,MemtoReg,RegWrite,ALUSrcA,input [1:0]ALUSrcB,input PCSrc,Branch,PCWrite,
    input [2:0]AluOP,output [5:0]Func,output [5:0]OP,input jump
    
    );
    wire [31:0]ALUoutAddr,PC_out,aluout,addr_out,WD,memory_out,IROut,W_Dout,R1,R2,A,srcA,siglmm,four_in,srcB,alu_out;
    wire [31:0]dataReg;
    wire alu_zero;
    wire [4:0]w;
    
    Next_PC PC (CLK,reset,alu_zero,Branch,PCWrite,ALUoutAddr,siglmm,PC_out,jump);
    data_2_to_1 Addr (PC_out,aluout,IorD,addr_out);
    Ideal_Memory Memory (CLK,addr_out,WD,MemWrite,memory_out,IRWrite);
    data_reg DR (CLK,memory_out,dataReg);
    Instruction_reg IR (memory_out,IRWrite,CLK,IROut);
    data2_1 W (IROut[20:16],IROut[15:11],RegDst,w);
    data_2_to_1 W_D (aluout,dataReg,MemtoReg,W_Dout);
    Register_Files REF(CLK,reset,RegWrite,W_Dout,IROut[25:21],IROut[20:16],w,R1,R2);
    A_B_reg AB (CLK,R1,R2,A,WD);
    data_2_to_1 SA (PC_out,A,ALUSrcA,srcA);
    Extension_Module Sign_exten (IROut[15:0],1'b1,siglmm);
    
    assign four_in=siglmm<<2;
    
    data_4_to1 four (WD,32'b0000_0000_0000_0000_0000_0000_0000_0001,siglmm,four_in,ALUSrcB,srcB);
    ALU alu (srcA,srcB,AluOP,alu_out,alu_zero);
    output_reg AO (CLK,alu_out,aluout);
    data_2_to_1 AL (alu_out,aluout,PCSrc,ALUoutAddr);
    
    assign OP=IROut[31:26];
    assign Func=IROut[5:0];
endmodule
