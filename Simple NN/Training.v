`timescale 1ns/1ns
module Training(x1,x2,t,Rst,Clk,Start,ready);
  
  input[6:0]
            x1,
            x2;
  wire[13:0]
            b;
  input[1:0]
            t;
  input
            Clk,
            Rst,
            Start;
            
  output    ready;
  
  wire  
        Cmp_Flag,
        enx1,
        enx2,
        enw1,
        enw2,
        enb,
        ent;
  
  wire[1:0] Select;
        



Training_controller U1    (.Clk(Clk),
                           .Rst(Rst),
                           .Cmp_Flag(Cmp_Flag),
                           .start(Start),
                           .enx1(enx1),
                           .enx2(enx2),
                           .enw1(enw1),
                           .enw2(enw2),
                           .enb(enb),
                           .ent(ent),
                           .Select(Select),
                           .ready(ready));
                           
                           
Training_Datapath U2     (.x1(x1),
                          .x2(x2),
                          .t(t),
                          .Select(Select),
                          .Rst(Rst),
                          .Clk(Clk),
                          .enx1(enx1),
                          .enx2(enx2),
                          .enw1(enw1),
                          .enw2(enw2),
                          .ent(ent),
                          .enb(enb),
                          .Cmp_Flag(Cmp_Flag));
                          
endmodule