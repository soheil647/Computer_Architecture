module conditionChecker (reg1,
                         reg2,
                         cuBranchComm,
                         brCond);
  
  input [15:0] reg1, reg2;
  input [1:0] cuBranchComm;
  output reg brCond;
  
      parameter JUMP = 2'd1;
      parameter BNE = 2'd2;
      parameter BEZ = 2'd3;

  always @ ( * ) begin
    case (cuBranchComm)
      JUMP: brCond <= 1;
      BEZ : brCond <= (reg1 == 0) ? 1 : 0;
      BNE : brCond <= (reg1 != reg2) ? 1 : 0;
      default: brCond <= 0;
    endcase
  end
endmodule