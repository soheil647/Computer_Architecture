
module Register_File(Src1,
                     Src2,
                     Dst,
                     Write_Data,
                     Clock,
                     Rst,
                     RegWrite,
                     Read_Data1,
                     Read_Data2);
                     
                     
  input[15:0] Write_Data;
  input RegWrite;
  input Clock,Rst;
  output reg[15:0] Read_Data1,Read_Data2;
  input [3:0] Src1,Src2,Dst;

  reg[15:0] Register[0:15];
 
  always@(*) begin
   
    if(Rst) begin
      Register[4'd0]=8'd0;
      Register[4'd1]=8'd0;
      Register[4'd2]=8'd0;
      Register[4'd3]=8'd0;
      Register[4'd4]=8'd0;
      Register[4'd5]=8'd0;
      Register[4'd6]=8'd0;
      Register[4'd7]=8'd0;
      Register[4'd8]=8'd0;
      Register[4'd9]=8'd0;
      Register[4'd10]=8'd0;
      Register[4'd11]=8'd0;
      Register[4'd12]=8'd0;
      Register[4'd13]=8'd0;
      Register[4'd14]=8'd0;
      Register[4'd15]=8'd0;
    end
        Read_Data1 = Register[Src1];
        Read_Data2 = Register[Src2];
  end

  
  always@(negedge Clock) begin
       if(RegWrite) begin
            Register[Dst] <= Write_Data;
          end
       end     


  
endmodule

      
  

