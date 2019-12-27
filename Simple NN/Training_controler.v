`timescale 1ns/1ns
module Training_controller(Clk,
                           Rst,
                           TtoY_Flag,
                           Finish_Flag,
                           Count,
                           enx1,
                           enx2,
                           enw1,
                           enw2,
                           enb,
                           ent,
                           eny,
                           Select,
                           Dselect,
                           ready);
                           
      input 
            Rst,
            TtoY_Flag,
            Clk,
            ready;
            
      output reg
            enx1,
            enx2,
            enw1,
            enw2,
            enb,
            ent,
            eny,          
            Finish_Flag;
                                       
      output reg[1:0]
            Dselect,
            Select;
            
      reg [7:0]
              temp;
      input [7:0]
              Count;
            
      reg[2:0]
              ps,
              ns;
               
            
      parameter ideal = 3'b000,
                getInput = 3'b001,
                newW1 = 3'b011,
                newW2 = 3'b100,
                newB = 3'b101;
              
              
      always@(posedge Clk) begin
        
        if(Rst || Count == 8'b11001001)
          ps <= 3'b0;
        else
          ps <= ns;
      	end
      
      always@(ps,ready,TtoY_Flag) begin
		{enx1,enx2,enw1,enw2,enb,ent,eny}=7'b0;
		Select = 2'b11;
		Dselect = 2'b11;
		
      
        case(ps)
        
              ideal: begin
                if(Finish_Flag || !ready)  ns<=ideal;


              else begin   
                  ns <= getInput;
                  temp <= 8'b0;
                end
                
                
                      end
					  
              getInput : begin
                  
                  if(Count == 8'b11001001) begin
                     if(temp!=8'b0) 
                         ns <= ideal;

                       
                     else if(temp) begin
                             Finish_Flag<=1;
				                     ns <= ideal;
				                     end
				          end
				              
				          else begin
                   if(!TtoY_Flag) begin
                     temp = temp+1;
					           ns <= newW1;
					          end
					         else if(TtoY_Flag)               
					         ns<=getInput;
					          
                  {enx1,enx2,ent} = 3'b111;
                      end
                    end
                    
              newW1 : begin
				     	    ns <= newW2;
                  enw1 = 1'b1;
                  Select = 2'b00;
                  Dselect = 2'b00;
                       end
              newW2 : begin
				       ns <= newB;
                  enw2 = 1'b1;
                  Select = 2'b01;
                  Dselect = 2'b01;
                      end
              newB : begin               
				              
				              ns <= getInput;				              
                      enb = 1'b1;
                      Select = 2'b10;
                      Dselect = 2'b10;
                  
                       end
                       


           endcase
    	   end
  endmodule   
