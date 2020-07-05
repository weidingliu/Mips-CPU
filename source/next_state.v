`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/28 12:37:09
// Design Name: 
// Module Name: next_state
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


module next_state(input Reset,input [2:0]i_state, input [5:0]opcode, output reg [2:0]next_state

    );
    parameter [2:0] IF = 3'b000, // IF状态
                     ID = 3'b001, // ID状态
                     aEXE = 3'b110, // 第一条分支的EXE状态
                     bEXE = 3'b101, // 第二条分支的EXE状态
                     cEXE = 3'b010, // 第三条分支的EXE状态
                     MEM = 3'b011, // MEM状态
                     aWB = 3'b111, // 第一个分支的WB状态
                     cWB = 3'b100; // 第三个分支的WB状态
    always @(i_state or Reset) begin
        case (i_state)
            IF: next_state = ID;
            ID: begin
                case (opcode[5:3])
                    3'b110: begin
                        if (opcode == 6'b110100) next_state = bEXE; // beq指令
                        else if (opcode==6'b110101)  next_state=bEXE; //bne
                        else next_state = cEXE; // sw, lw指令
                    end
                    3'b111: next_state = IF; // j, jal, jr, halt指令
                    default: next_state = aEXE; // add, sub等指令
                endcase
            end
            aEXE: next_state = aWB;
            bEXE: next_state = IF;
            cEXE: next_state = MEM;
            MEM: begin
                if (opcode == 6'b110001) next_state = cWB; // lw指令
                else next_state = IF; // sw指令
            end
            aWB: next_state = IF;
            cWB: next_state = IF;
            default: next_state = IF;
        endcase
        if (Reset) begin
            next_state=IF;
        end
        //$display("i_state %d",i_state);
        //$display("o_state %d",next_state);
    end
endmodule


