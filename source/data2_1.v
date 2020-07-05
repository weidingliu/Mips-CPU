`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/17 14:39:26
// Design Name: 
// Module Name: data2_1
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


module data2_1(input [4:0]data1,data2,input Control, output [4:0]Result

    );
    assign Result = (Control == 1'b0 ? data1 : data2);
endmodule
