
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/17 13:26:38
// Design Name: 
// Module Name: Next_PC
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


module Next_PC(input CLK,reset,Zero,Banch,PCWrite,input [31:0]Aluaddr,input [31:0]j_addr,output reg[31:0]PC,input jump

    );
    initial begin 
        PC<=32'b0000_0000_0000_0000_0000_0000_0000_0000;
    end 
    always @(posedge CLK or posedge reset ) begin
        if (reset==1'b1) begin
            PC<=32'b0000_0000_0000_0000_0000_0000_0000_0000;
        end
        else if (jump==1'b1) begin 
            PC<={PC[31:28],j_addr[27:0]};
        end
        else begin
            if(((Zero && Banch)||(PCWrite))==1) begin
                PC<=Aluaddr;
            end
            else PC<=PC;
        end
        $display(" now real pc %d",PC);
    end
    
endmodule
