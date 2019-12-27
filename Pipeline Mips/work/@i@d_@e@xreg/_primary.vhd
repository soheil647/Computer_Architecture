library verilog;
use verilog.vl_types.all;
entity ID_EXreg is
    port(
        rst             : in     vl_logic;
        WB_Enable       : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemRead         : in     vl_logic;
        ALUOperation    : in     vl_logic_vector(2 downto 0);
        Br_Taken        : in     vl_logic;
        PC              : in     vl_logic_vector(9 downto 0);
        Reg1            : in     vl_logic_vector(15 downto 0);
        Reg2            : in     vl_logic_vector(15 downto 0);
        RegOrExtend     : in     vl_logic_vector(15 downto 0);
        SrcReg1         : in     vl_logic_vector(3 downto 0);
        SrcReg2Or0      : in     vl_logic_vector(3 downto 0);
        DstReg          : in     vl_logic_vector(3 downto 0);
        Clk             : in     vl_logic;
        WBEnable        : out    vl_logic;
        MemReadOut      : out    vl_logic;
        MemWriteOut     : out    vl_logic;
        ALUOperationOut : out    vl_logic_vector(2 downto 0);
        Br_TakenOut     : out    vl_logic;
        PCOut           : out    vl_logic_vector(9 downto 0);
        Val1            : out    vl_logic_vector(15 downto 0);
        Val2            : out    vl_logic_vector(15 downto 0);
        Reg2Out         : out    vl_logic_vector(15 downto 0);
        Src1Out         : out    vl_logic_vector(3 downto 0);
        Src2Out         : out    vl_logic_vector(3 downto 0);
        DstRegOut       : out    vl_logic_vector(3 downto 0)
    );
end ID_EXreg;
