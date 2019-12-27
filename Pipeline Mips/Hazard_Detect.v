
module hazard_detection
  (is_imm,
   ST_or_BNE,
   src1_ID,
   src2_ID,
   dest_EXE,
   WB_EN_EXE,
   dest_MEM,
   WB_EN_MEM,
   MEM_R_EN_EXE,
   cuBranchComm,
   hazard_detected);
   
  input [3:0] src1_ID, src2_ID;
  input [3:0] dest_EXE;
  input [3:0] dest_MEM;
  input [1:0] cuBranchComm;
  input WB_EN_EXE;
  input WB_EN_MEM;
  input is_imm;
  input ST_or_BNE;
  input MEM_R_EN_EXE;
  
  output hazard_detected;

  wire src2_is_valid, exe_has_hazard, mem_has_hazard, hazard, instr_cuBranchCommanch;
  
      parameter JUMP = 2'd1;
      parameter BNE = 2'd2;
      parameter BEZ = 2'd3;

  assign src2_is_valid =  (~is_imm) || ST_or_BNE;

  assign exe_has_hazard = WB_EN_EXE && (src1_ID == dest_EXE || (src2_is_valid && src2_ID == dest_EXE));
  assign mem_has_hazard = WB_EN_MEM && (src1_ID == dest_MEM || (src2_is_valid && src2_ID == dest_MEM));

  assign hazard = (exe_has_hazard || mem_has_hazard);
  assign instr_cuBranchCommanch = (cuBranchComm == BEZ || cuBranchComm == BNE);

  assign hazard_detected =  (instr_cuBranchCommanch && hazard) || (MEM_R_EN_EXE && mem_has_hazard);
endmodule 
