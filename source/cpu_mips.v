`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/01 12:35:39
// Design Name: 
// Module Name: cpu_mips
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


module cpu_mips(input CLK,Reset

    );
    wire IorD,MemWrite,IRWrite,RegDst,MemtoReg,RegWrite,ALUSrcA,jump;
    wire [1:0]ALUSrcB;
    wire PCSrc,Branch,PCWrite;
    wire [2:0]AluOP;
    wire [5:0]Func,OP;
    reg clk;
    reg reset;
    initial
    begin
    clk=0;
    reset=1;
    end
    always #10
    clk=~clk;
    always #20000
    reset=~reset;
    assign CLK=clk;
    assign Reset = reset;
    
    datapath Datapath (CLK,Reset,IorD,MemWrite,IRWrite,RegDst,MemtoReg,RegWrite,ALUSrcA,ALUSrcB, PCSrc,Branch,PCWrite,
    AluOP,Func,OP,jump);
    controlpath Control (CLK,Reset,OP,Func,
    IorD,MemWrite,IRWrite,RegDst,MemtoReg,RegWrite,ALUSrcA,ALUSrcB,PCSrc,Branch,PCWrite,
    AluOP,jump);
endmodule
