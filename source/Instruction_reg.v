`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/16 16:16:29
// Design Name: 
// Module Name: Instruction_reg
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


module Instruction_reg(input [31:0]instruction, input IRWr,CLK,output reg [31:0]Out

    );

    always @(/*IRWr or instruction or negedge CLK*/ posedge CLK ) begin
            if(IRWr) begin
                Out<=instruction;
            end
            //$display(" now inst %d",Out);
    end

endmodule
