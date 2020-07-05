`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/16 20:34:49
// Design Name: 
// Module Name: output_reg
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
/////////////////////////////////////////////////////////////////////////////////


module output_reg(input CLK,input [31:0]ALUoutput,output reg [31:0]out
    );
    //reg [31:0]mem;
    always @(negedge CLK ) begin
        out=ALUoutput;
        //$display("aluout %d",out);
        //$display("alumem %d",mem);
    end
    //assign out=mem;
endmodule
