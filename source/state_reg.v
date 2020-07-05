`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/06 16:55:43
// Design Name: 
// Module Name: state_reg
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


module state_reg(input CLK,input [2:0]ALUoutput,output  reg [2:0]out
    );
    initial begin 
        out<=3'b000;
    end
    always @(negedge CLK) begin
        out=ALUoutput;
        //$display("now state %d",out);
    end
endmodule
