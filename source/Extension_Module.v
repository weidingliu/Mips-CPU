`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/16 15:35:29
// Design Name: 
// Module Name: Extension_Module
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


module Extension_Module(
    input [15:0]i_data,
    input Extop, 
    output [31:0]Out

    );
    assign Out[31:0]=(Extop)?{{16{i_data[15]}},i_data[15:0]}:{{16{1'b0}},i_data[15:0]};
endmodule
