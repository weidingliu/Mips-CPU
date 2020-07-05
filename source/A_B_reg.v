`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/17 14:47:59
// Design Name: 
// Module Name: A_B_reg
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


module A_B_reg(input CLK,input [31:0]A,B,output reg [31:0]ResultA,ResultB

    );
    //reg [31:0]mem[1:0];
    always @ (posedge CLK) begin
        ResultA=A;
        ResultB=B;
    end
   /* assign ResultA=mem[0];
    assign ResultB=mem[1];*/
endmodule
