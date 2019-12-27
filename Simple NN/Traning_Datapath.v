`timescale 1ns/1ns
module Training_Datapath( x1,
                          x2,
                          t,                          
                          Select,
                          Dselect,
                          Rst,
                          Clk,
                          enx1,
                          enx2,
                          enw1,
                          enw2,
                          ent,
                          eny,
                          enb,
                          Finish_Flag,
                          TtoY_Flag,
                          Y,
                          W1out,
                          W2out,
                          bout,
                          Count);
              
  input[6:0] 
            x1,
            x2;
  input[1:0]
            t,
            Select,
            Dselect;
  input 
            Rst,
            Clk,
            enx1,
            enx2,
            enw1,
            enw2,
            ent,
            enb,
            eny;        

  
  input Finish_Flag;
  output  TtoY_Flag;
  output reg[7:0] Count;
  output[1:0]
            Y;
  output reg [13:0]
             W1out,
             W2out,
             bout;
  
  wire[3:0]
            tEX;
            
            
  wire [13:0]
			 	bold,
        w1old,
        w2old,
	      bnew,
		   	w1new,
		   	w2new;
			
    wire[13:0]            
            Yin,
            old;
            
  wire[6:0] 
            x1_Reg,
            x2_Reg,
            x1orx2or1,
            AlphaT;
            
  wire[13:0]
            x1_RegSX,
            x2_RegSX,
            x1w1SD,
            x2w2SD,
			      AlphaTX,
			     	newvalue;
            
  wire[27:0]
            x1w1,
            x2w2;
  
  wire[1:0] 
            t_Reg;
            
     //Generate inPut REgisters
            
    Reg7 Rx1(
          .a(x1),
          .o(x1_Reg),
          .Clk(Clk),
          .Rst(Rst),
          .enable(enx1));
          
    Reg7 Rx2(
          .a(x2),
          .o(x2_Reg),
          .Clk(Clk),
          .Rst(Rst),
          .enable(enx2));
          
    Reg14 Rw1(
          .a(w1new),
          .o(w1old),
          .Clk(Clk),
          .Rst(Rst),
          .enable(enw1));
          
    Reg14 Rw2(
          .a(w2new),
          .o(w2old),
          .Clk(Clk),
          .Rst(Rst),
          .enable(enw2));
          
    Reg2 Rt(
          .a(t),
          .o(t_Reg),
          .Clk(Clk),
          .Rst(Rst),
          .enable(ent)); 
          
    Reg14B Rb(
          .a(bnew),
          .o(bold),
          .Clk(Clk),
          .Rst(Rst),
          .enable(enb));
          
          
  
          
      //Finding Y to Compare
      assign x1_RegSX= {{7{x1_Reg[6]}},x1_Reg};
	    assign x2_RegSX= {{7{x2_Reg[6]}},x2_Reg};
 
      assign x1w1 = x1_RegSX * w1old;
      assign x2w2 = x2_RegSX * w2old;
      
      assign x1w1SD = {x1w1[17:4]};
      assign x2w2SD = {x2w2[17:4]};
                  
      assign Yin = x1w1SD + x2w2SD + bold; 
         
      Sign S1 (.a(Yin),
               .o(Y));

               
      //Finding new values: //alpha is 7'b0000011
      
      assign tEX = {t_Reg,2'b0};
      assign AlphaT = tEX * 3'b011; //alpha
      
      MUX4to1ForX Mux1 (.a1(x1),
                        .a2(x2),
                        .s(Select),
                        .o(x1orx2or1));
                
      
                        
      assign AlphaTX = AlphaT * x1orx2or1;
      
    
      MUX4to1ForOld Mux2 (.a1(w1old),
                          .a2(w2old),
                          .a3(bold),
                          .s(Select),
                          .o(old));
                          
			Cmp C1(.a({{12'b0},Y}),
			       .b({{12'b0},t}),
			       .Cmp(TtoY_Flag));                          
                          
      
      assign newvalue = AlphaTX + old; 

      

      Decoder Dec1 (
        .Dselect(Dselect),
        .In(newvalue),
        .O0(w1new),
        .O1(w2new),
        .O2(bnew)
       );
       
        always@(posedge Clk) begin
          
          if(Rst || Count == 8'b11001001)
          Count<=8'b0;

          else begin
          if(x1!=x1_Reg || x2!=x2_Reg)
            Count <= Count+1;
          end
      end
        
        
                
        always@(posedge Clk) begin
          if(Finish_Flag) begin
          W1out <= w1old;
          W2out <= w2old;
          bout <= bold;
          end
        else begin 
          W1out<=0;
          W2out<=0;
          bout<=0;
        end
    end
    
endmodule          
          
              
  

