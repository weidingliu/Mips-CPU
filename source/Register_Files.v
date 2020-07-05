`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/16 15:14:34
// Design Name: 
// Module Name: Register_Files
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


//Reset是复位信号 R_a R_b  是读操作的时候输出A  B的值的寄存器号，R_w 是写操作的时候的值
//定义了

module Register_Files(    
    input CLK,
    input Reset,
    input RegWrite,
    input [31:0] W,
    input [4:0] R_a,
    input [4:0] R_b,
    input [4:0] R_W,
    output reg [31:0] A,
    output reg [31:0] B
    );
    reg [31:0]RF[31:0];  //32个32位的寄存器
    integer i;
    
    initial begin 
        RF[9]<=0;
    end
    always @(posedge CLK)
    begin
       if(Reset)
       begin
              for(i=0;i<32;i=i+1)
                 RF[i]<=0;
       end
       else
        begin  
             if(RegWrite)  RF[R_W]<=W;
         end
         
      //$display("W ",W);
      //$display("RF ", RF[R_W]);
      //$display("regwirte ",RegWrite);
     /*$display("RF0 is %b",RF[0]);
     $display("RF1 is %b",RF[1]);
     $display("RF2 is %b",RF[2]);
     $display("RF3 is %b",RF[3]);
     $display("RF4 is %b",RF[4]);
     $display("RF5 is %b",RF[5]);
     $display("RF6 is %b",RF[6]);
     $display("RF7 is %b",RF[7]);*/
     $display("RF0       RF1      RF2       RF3      RF4       RF5       RF6      RF7       RF8");
     $display("%h %h %h %h %h %h %h %h %h",RF[0],RF[1],RF[2],RF[3],RF[4],RF[5],RF[6],RF[7],RF[8]);
    end
    always @ (*) begin 
         A=RF[R_a];
         B=RF[R_b];
    end
endmodule
