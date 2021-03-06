   
module CPU_Controller(Opcode,
                      Function,
                      Branch,
                      JumpControl,
                      MemRead,
                      MemWrite,
                      WriteControl,
                      ALUSrc,
                      RegWrite,
                      WndSelect,
                      ALUOprand,
                      Rst
                      );
  
  input Rst;                    
  input[3:0] Opcode;
  input[7:0] Function;
  output reg Branch,JumpControl,MemRead,RegWrite,MemWrite,ALUSrc;
  output reg[1:0] WndSelect;
  output reg[1:0] ALUOprand,WriteControl;
  reg noperation;
    //Define Opcodes
  
      parameter Load = 4'b0000;
      parameter Store = 4'b0001;
      parameter Jump = 4'b0010;
      parameter BranchZ = 4'b0100;
      parameter RType = 4'b1000;
      parameter Addi = 4'b1100;
      parameter Subi = 4'b1101;
      parameter Andi = 4'b1110;
      parameter Ori = 4'b1111;
      
    //Define Functions
      
      parameter Move = 8'b00000001;
      parameter Add  = 8'b00000010;
      parameter Sub  = 8'b00000100;
      parameter And  = 8'b00001000;
      parameter Or   = 8'b00010000;
      parameter Not  = 8'b00100000;
      parameter Nop  = 8'b01000000;
      parameter Wnd0 = 8'b10000000;
      parameter Wnd1 = 8'b00000001;
      parameter Wnd2 = 8'b00000010;
      parameter Wnd3 = 8'b00000011;
      
   
     always @(Opcode, Function ,Rst)begin
       Branch=1'bx;JumpControl=1'bx;MemRead=1'bx;RegWrite=1'bx;MemWrite=1'bx;ALUSrc=1'bx;
       ALUOprand=2'bxx;WriteControl=2'bxx;
       
       if(Rst)begin
         WndSelect=2'b00;
		 Branch=1'bx;JumpControl=1'bx;MemRead=1'bx;RegWrite=1'bx;MemWrite=1'bx;ALUSrc=1'bx;
       ALUOprand=2'bxx;WriteControl=2'bxx;
       end   
        case(Opcode) 
          
         Load: begin
           MemRead=1'b1;
           RegWrite=1'b1;
           WriteControl=2'b00;
         end 
         
         Store: begin
           MemWrite=1'b1;
         end
         
         Jump: begin
           JumpControl=1'b1;
         end
         
         BranchZ:begin
           Branch=1'b1;
         end
         
         RType:begin
           case(Function)
             Move:begin
               WriteControl=2'b10;
               RegWrite=1'b1;       
             end
             
             Add:begin
				ALUSrc=1'b0;
               WriteControl=2'b01;
               ALUOprand=2'b10;
               RegWrite=1'b1;
             end
             
             Sub:begin
				ALUSrc=1'b0;
               WriteControl=2'b01;
               ALUOprand=2'b11;
               RegWrite=1'b1; 
             end
             
             And:begin
				ALUSrc=1'b0;
               WriteControl=2'b01;
               ALUOprand=2'b00;
               RegWrite=1'b1;  
             end
             
             Or:begin
				ALUSrc=1'b0;
               WriteControl=2'b01;
               ALUOprand=2'b01;
               RegWrite=1'b1;
             end
             
             Not:begin
               WriteControl=2'b11;
               RegWrite=1'b1;
             end
             
             Nop:begin
				noperation=0;
             end
             
             Wnd0:begin
               WndSelect=2'b00;
             end
             
             Wnd1:begin
               WndSelect=2'b01;
             end
             
             Wnd2:begin
               WndSelect=2'b10;
             end
             
             Wnd3:begin
               WndSelect=2'b11;
             end
           endcase
         end
         
         Addi:begin
           WriteControl=2'b01;
           ALUSrc=1'b1;
           RegWrite=1'b1;
           ALUOprand=2'b10;
         end
         
         Subi:begin
           WriteControl=2'b01;
           ALUSrc=1'b1;
           RegWrite=1'b1;
           ALUOprand=2'b11;
         end
         
         Andi:begin
           WriteControl=2'b01;
           ALUSrc=1'b1;
           RegWrite=1'b1;
           ALUOprand=2'b00;
         end
         
         Ori:begin
           WriteControl=2'b01;
           ALUSrc=1'b1;
           RegWrite=1'b1;
           ALUOprand=2'b01;
         end
          
        endcase 
	 end     
endmodule      
     
          