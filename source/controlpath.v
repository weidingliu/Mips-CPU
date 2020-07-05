`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/20 12:49:24
// Design Name: 
// Module Name: controlpath
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


module controlpath(input CLK,reset,input [5:0]OP,input [5:0]Func,
    output IorD,MemWrite,IRWrite,RegDst,MemtoReg,RegWrite,ALUSrcA,output [1:0]ALUSrcB,output PCSrc,Branch,PCWrite,
    output [2:0]AluOP,output jump
    );
    wire [2:0]i_state;
    wire [2:0]o_state;
    
    next_state NEXT (reset,i_state,OP,o_state);

    state_reg U (CLK,o_state,i_state);
    Out_put Out (i_state,OP,Func,IorD,MemWrite,IRWrite,RegDst,MemtoReg,RegWrite,ALUSrcA, ALUSrcB, PCSrc,Branch,PCWrite,
     AluOP,jump);
endmodule
