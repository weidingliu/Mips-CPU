`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/16 16:11:20
// Design Name: 
// Module Name: data_4_to1
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


module data_4_to1(input [31:0]A,B,C,D,input [1:0]Selt,output reg[31:0]Result
    );
    always @(A or B or C or D or Selt) begin
        case(Selt)
            2'b00: Result=A;
            2'b01: Result=B;
            2'b10: Result=C;
            2'b11: Result=D;
        endcase
    end
endmodule
