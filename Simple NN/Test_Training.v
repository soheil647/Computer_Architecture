 `timescale 1ns/1ns

 module TestT();
  
 reg [6:0]
       x1,x2;
	   
wire enx1,enx2,enw1,enw2,enb,ent,eny,TtoY_Flag;
wire [1:0] Y;

wire [1:0] Select,Dselect;	
wire[13:0] w1out,w2out,bout; 
wire[7:0] Count; 
reg[1:0]  t;
reg Clk=0;
reg Rst;
 
 reg ready;
 
integer Data_Set;
integer Flag=0;
 
Training_controller U1   (.Clk(Clk),
                           .Rst(Rst),
                           .Finish_Flag(Finish_Flag),
                           .TtoY_Flag(TtoY_Flag),
                           .Count(Count),
                           .enx1(enx1),
                           .enx2(enx2),
                           .enw1(enw1),
                           .enw2(enw2),
                           .enb(enb),
                           .ent(ent),
                           .eny(eny),
                           .Select(Select),
                           .Dselect(Dselect),
                           .ready(ready));
                           
                           
Training_Datapath U2     (.x1(x1),
                          .x2(x2),
                          .t(t),
                          .Select(Select),
                          .Dselect(Dselect),
                          .Rst(Rst),
                          .Clk(Clk),
                          .enx1(enx1),
                          .enx2(enx2),
                          .enw1(enw1),
                          .enw2(enw2),
                          .ent(ent),
                          .eny(eny),
                          .enb(enb),
                          .Finish_Flag(Finish_Flag),
                          .Y(Y),
                          .TtoY_Flag(TtoY_Flag),
                          .W1out(w1out),
                          .W2out(w2out),
                          .bout(bout),
                          .Count(Count));
    
    
    initial repeat (200000) #20 Clk=~Clk;
    
     initial begin
     
     Rst = 1;      
     #80     
     Rst = 0;
     ready = 1;
     
     

  while(Flag<100)begin
   Data_Set = $fopen("data_set.txt" , "r");
     while (!$feof(Data_Set)) begin 
           $fscanf(Data_Set,"%b %b %b\n",x1,x2,t); 
           #1000; 
      end 
      #20000
    $fclose(Data_Set);
    Flag = Flag+1;
      
   end
      
     
       


     
  end
endmodule

      
    