`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/28 13:09:07
// Design Name: 
// Module Name: Out_put
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


module Out_put(input [2:0]state,input[5:0] opcode,input[5:0]func, output reg IorD,MemWrite,IRWrite,RegDst,MemtoReg,RegWrite,ALUSrcA,output reg [1:0]ALUSrcB,output reg PCSrc,Branch,PCWrite,
    output reg [2:0]AluOP,output reg j

    );

    parameter [2:0] IF = 3'b000, // IF状态 取指令
                     ID = 3'b001, // ID状态  译码
                     aEXE = 3'b110, // 第一支路的EXE状态
                     bEXE = 3'b101, // 第二支路的EXE状态
                     cEXE = 3'b010, // 第三支路的EXE状态
                     MEM = 3'b011, // MEM状态
                     aWB = 3'b111, // 第一支路的WB状态
                     cWB = 3'b100; // 第三支路的WB状态
   /* parameter R_type = 6'b000000,add = 6'b100000,sub=6'b100010,And = 6'b100100,Or= 6'b100101,slt=6'b101010,
            ori = 6'b001101,lw=6'b100011,sw=6'b101011,beq=6'b000100,
            jump=6'b000010,
            stop=6'b000011;*/
    parameter [5:0] ori = 6'b010010,
                     R_type = 6'b100000,
                     add = 6'b000000,
                     sub = 6'b000001,
                     slt = 6'b100110,
                      Or = 6'b010000,
                     And = 6'b010001,
                     addi=6'b000010,
                     
                     sw = 6'b110000,
                     lw = 6'b110001,
                     beq = 6'b110100,
                     bne=6'b110101,
                    
                     jump=6'b111000,
                     stop = 6'b111111;
  always @ (state or opcode) begin
      if (state==IF) begin  //T1
          IorD=1'b0;
          MemWrite=1'b0;
          IRWrite=1'b1;
          RegWrite=1'b0;
          ALUSrcA=1'b0;
          ALUSrcB=2'b01;
          AluOP=3'b010;
          PCSrc=1'b0;
          Branch=1'b0;
          PCWrite=1'b1;
          j=1'b0;
      end
      /*else if (state==IF && opcode==stop) begin
          PCWrite=1'b0;
      end
      else if (state==IF && opcode!=stop && opcode==jump) begin
          IorD=1'b1;
          MemWrite=1'b0;
          IRWrite=1'b1;
          RegWrite=1'b0;
          ALUSrcA=1'b0;
          ALUSrcB=2'b01;
          AluOP=3'b010;
          PCSrc=1'b0;
          Branch=1'b0;
          PCWrite=1'b0;
          MemtoReg=1'b0;
          RegDst=1'b0;
      end */
      if (state==ID) begin // T2
          if(opcode==jump) begin
              IorD=1'b0;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b0;
              ALUSrcA=1'b0;
              ALUSrcB=2'b10;
              AluOP=3'b010;
              PCSrc=1'b0;
              Branch=1'b0;
              PCWrite=1'b0;
              j=1'b1;
          end
          else if (opcode==stop) begin 
               IorD=1'b0;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b0;
              ALUSrcA=1'b0;
              ALUSrcB=2'b01;
              AluOP=3'b110;
              PCSrc=1'b0;
              Branch=1'b0;
              PCWrite=1'b1;
              j=1'b0;
          end
          else begin 
          IorD=1'b0;
          MemWrite=1'b0;
          IRWrite=1'b0;
          RegWrite=1'b0;
          ALUSrcA=1'b0;
          ALUSrcB=2'b10;
          AluOP=3'b010;
          PCSrc=1'b0;
          Branch=1'b0;
          PCWrite=1'b0;
          j=1'b0;
          end
          /*if (opcode==jump) begin
              
          end*/
      end
      if (state==aEXE) begin //R_type的运算 T3
          if (opcode==ori)  begin 
              IorD=1'b0;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b0;
              ALUSrcA=1'b1;
              ALUSrcB=2'b10;
              AluOP=3'b001;
              PCSrc=1'b0;
              Branch=1'b0;
              PCWrite=1'b0;
              MemtoReg=1'b0;
              RegDst=1'b0;
              j=1'b0;
          end
          else if (opcode==addi) begin 
              IorD=1'b0;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b0;
              ALUSrcA=1'b1;
              ALUSrcB=2'b10;
              AluOP=3'b010;
              PCSrc=1'b1;
              Branch=1'b0;
              PCWrite=1'b0;
              MemtoReg=1'b0;
              RegDst=1'b0;
              j=1'b0;
          end
          else begin
              case (func)
                  add:     AluOP=3'b010;
                  And:     AluOP=3'b000;
                  Or:      AluOP=3'b001;
                  slt:     AluOP=3'b111;
                  sub:     AluOP=3'b110;
              endcase
              IorD=1'b0;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b0;
              ALUSrcA=1'b1;
              ALUSrcB=2'b00;
              PCSrc=1'b0;
              Branch=1'b0;
              PCWrite=1'b0;
              MemtoReg=1'b0;
              RegDst=1'b0;
              j=1'b0;
          end 
          if (opcode==slt) begin 
              IorD=1'b0;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b0;
              ALUSrcA=1'b1;
              ALUSrcB=2'b00;
              AluOP=3'b111;
              PCSrc=1'b0;
              Branch=1'b0;
              PCWrite=1'b0;
              MemtoReg=1'b0;
              RegDst=1'b0;
              j=1'b0;
          end
          
      end
      if(state==bEXE) begin  //beq T3
          if (opcode==beq) begin
              IorD=1'b0;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b0;
              ALUSrcA=1'b1;
              ALUSrcB=2'b00;
              PCSrc=1'b1;
              Branch=1'b1;
              PCWrite=1'b0;
              MemtoReg=1'b0;
              RegDst=1'b0;
              AluOP=3'b100;
              j=1'b0;
          end
          if (opcode==bne)begin 
              IorD=1'b0;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b0;
              ALUSrcA=1'b1;
              ALUSrcB=2'b00;
              PCSrc=1'b1;
              Branch=1'b1;
              PCWrite=1'b0;
              MemtoReg=1'b0;
              RegDst=1'b0;
              AluOP=3'b011;
              j=1'b0;
          end
          
      end
      if (state==cEXE) begin //lw,sw T3
          IorD=1'b1;
          MemWrite=1'b0;
          IRWrite=1'b0;
          RegWrite=1'b0;
          ALUSrcA=1'b1;
          ALUSrcB=2'b10;
          PCSrc=1'b1;
          Branch=1'b0;
          PCWrite=1'b0;
          MemtoReg=1'b1;
          RegDst=1'b0;
          AluOP=3'b010;
          j=1'b0;
      end
      if (state==aWB) begin
          if (opcode== R_type) begin
              IorD=1'b0;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b1;
              ALUSrcA=1'b1;
              ALUSrcB=2'b00;
              PCSrc=1'b1;
              Branch=1'b0;
              PCWrite=1'b0;
              MemtoReg=1'b0;
              RegDst=1'b1;
              j=1'b0;
          end
          else if (opcode==addi) begin
              IorD=1'b0;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b1;
              ALUSrcA=1'b1;
              ALUSrcB=2'b10;
              PCSrc=1'b1;
              Branch=1'b0;
              PCWrite=1'b0;
              MemtoReg=1'b0;
              AluOP=3'b010;
              RegDst=1'b0;
              j=1'b0;
              
               
          end
          else if (opcode==slt)begin 
              IorD=1'b0;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b0;
              ALUSrcA=1'b1;
              ALUSrcB=2'b00;
              AluOP=3'b111;
              PCSrc=1'b0;
              Branch=1'b0;
              PCWrite=1'b0;
              MemtoReg=1'b0;
              RegDst=1'b1;
              j=1'b0;
          end
          else begin 
              IorD=1'b0;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b1;
              ALUSrcA=1'b1;
              ALUSrcB=2'b10;
              PCSrc=1'b1;
              Branch=1'b0;
              PCWrite=1'b0;
              MemtoReg=1'b0;
              AluOP=3'b001;
              RegDst=1'b0;
              j=1'b0;
          end
          
      end 
      if (state==MEM) begin
          if (opcode==sw) begin 
              IorD=1'b1;
              MemWrite=1'b1;
              IRWrite=1'b0;
              RegWrite=1'b0;
              ALUSrcA=1'b1;
              ALUSrcB=2'b10;
              PCSrc=1'b1;
              Branch=1'b0;
              PCWrite=1'b0;
              MemtoReg=1'b0;
              RegDst=1'b1;
              j=1'b0;
          end 
          else begin 
              IorD=1'b1;
              MemWrite=1'b0;
              IRWrite=1'b0;
              RegWrite=1'b0;
              ALUSrcA=1'b1;
              ALUSrcB=2'b10;
              PCSrc=1'b1;
              Branch=1'b0;
              PCWrite=1'b0;
              MemtoReg=1'b1;
              RegDst=1'b0;
              j=1'b0;
          end
          
      end
      if (state==cWB) begin
          IorD=1'b1;
          MemWrite=1'b0;
          IRWrite=1'b0;
          RegWrite=1'b1;
          ALUSrcA=1'b1;
          ALUSrcB=2'b10;
          PCSrc=1'b1;
          Branch=1'b0;
          PCWrite=1'b0;
          MemtoReg=1'b1;
          RegDst=1'b0;
          j=1'b0;
      end
      //$display("output fun state %d",state);
  end


endmodule
