
module Register_File(Read1_Wire,
                     Read2_Wire,
                     Write_Wire,
                     Write_Data,
                     WndSel,
                     Clock,
                     Rst,
                     RegWrite,
                     Read_Data1,
                     Read_Data2);
                     
  parameter Wnd0 = 2'b00;
  parameter Wnd1 = 2'b01;
  parameter Wnd2 = 2'b10;
  parameter Wnd3 = 2'b11;
                     
                     
  reg [2:0] Read_Register1,Read_Register2,Write_Register;
  input[1:0] WndSel;
  input[15:0] Write_Data;
  input RegWrite;
  input Clock,Rst;
  output reg[15:0] Read_Data1,Read_Data2;
  input [1:0] Read1_Wire,Read2_Wire,Write_Wire;

  reg[7:0] Register[0:7];
 
 always@(*) begin
   case(WndSel)
     
     Wnd0: begin
       case(Read1_Wire)
         2'b00 : Read_Register1 = 3'b000;
         2'b01 : Read_Register1 = 3'b001;
         2'b10 : Read_Register1 = 3'b010;
         2'b11 : Read_Register1 = 3'b011;       
       endcase 
       
       case(Read2_Wire)
         2'b00 : Read_Register2 = 3'b000;
         2'b01 : Read_Register2 = 3'b001;
         2'b10 : Read_Register2 = 3'b010;
         2'b11 : Read_Register2 = 3'b011;       
       endcase    
       
       case(Write_Wire)  
         2'b00 : Write_Register = 3'b000;
         2'b01 : Write_Register = 3'b001;
         2'b10 : Write_Register = 3'b010;
         2'b11 : Write_Register = 3'b011;  
       endcase
     end
     

     Wnd1: begin
       case(Read1_Wire)
         2'b00 : Read_Register1 = 3'b010;
         2'b01 : Read_Register1 = 3'b011;
         2'b10 : Read_Register1 = 3'b100;
         2'b11 : Read_Register1 = 3'b101;       
       endcase 
       
       case(Read2_Wire)
         2'b00 : Read_Register2 = 3'b010;
         2'b01 : Read_Register2 = 3'b011;
         2'b10 : Read_Register2 = 3'b100;
         2'b11 : Read_Register2 = 3'b101;       
       endcase 
       
      case(Write_Wire)  
         2'b00 : Write_Register = 3'b010;
         2'b01 : Write_Register = 3'b011;
         2'b10 : Write_Register = 3'b100;
         2'b11 : Write_Register = 3'b101;       
       endcase     
     end
     
     Wnd2: begin
       case(Read1_Wire)
         2'b00 : Read_Register1 = 3'b100;
         2'b01 : Read_Register1 = 3'b101;
         2'b10 : Read_Register1 = 3'b110;
         2'b11 : Read_Register1 = 3'b111;       
       endcase 
       
       case(Read2_Wire)
         2'b00 : Read_Register2 = 3'b100;
         2'b01 : Read_Register2 = 3'b101;
         2'b10 : Read_Register2 = 3'b110;
         2'b11 : Read_Register2 = 3'b111;       
       endcase 
       
       case(Write_Wire)  
         2'b00 : Write_Register = 3'b010;
         2'b01 : Write_Register = 3'b011;
         2'b10 : Write_Register = 3'b100;
         2'b11 : Write_Register = 3'b101;       
       endcase          
     end
     
     Wnd3: begin
       case(Read1_Wire)
         2'b00 : Read_Register1 = 3'b110;
         2'b01 : Read_Register1 = 3'b111;
         2'b10 : Read_Register1 = 3'b000;
         2'b11 : Read_Register1 = 3'b001;       
       endcase      
       
       case(Read1_Wire)
         2'b00 : Read_Register2 = 3'b110;
         2'b01 : Read_Register2 = 3'b111;
         2'b10 : Read_Register2 = 3'b000;
         2'b11 : Read_Register2 = 3'b001;       
       endcase
       
       case(Write_Wire)  
         2'b00 : Write_Register = 3'b010;
         2'b01 : Write_Register = 3'b011;
         2'b10 : Write_Register = 3'b100;
         2'b11 : Write_Register = 3'b101;       
       endcase           
     end   
   endcase                
 end
 
 
  always@(*) begin
    
    if(Rst) begin
      Register[3'b000]=8'b0;
    end
        Read_Data1 = Register[Read_Register1];
        Read_Data2 = Register[Read_Register2];
  end

  
  always@(posedge Clock) begin
       if(RegWrite) begin
            Register[Write_Register] <= Write_Data;
          end
       end     

      

  
  
  
endmodule

      
  

