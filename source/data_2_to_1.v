`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/16 15:09:03
// Design Name: 
// Module Name: data_2_to_1
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


module data_2_to_1(input [31:0]data1,data2,input Control, output [31:0]Result

    );
    assign Result = (Control == 1'b0 ? data1 : data2);
endmodule
