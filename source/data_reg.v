`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/16 19:32:05
// Design Name: 
// Module Name: data_reg
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


module data_reg(input CLK,input [31:0]i_data,output reg [31:0]o_data

    );
    //reg [31:0]mem;
    always @(posedge CLK) begin
        o_data<=i_data;
    end
    //assign o_data=mem;
endmodule
