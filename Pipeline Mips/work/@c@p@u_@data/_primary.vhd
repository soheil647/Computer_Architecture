library verilog;
use verilog.vl_types.all;
entity CPU_Data is
    port(
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        ALUOperation    : in     vl_logic_vector(2 downto 0);
        ALUSrc          : in     vl_logic;
        RegWrite        : in     vl_logic;
        Clk             : in     vl_logic;
        Rst             : in     vl_logic;
        StoreOrBNE      : in     vl_logic;
        Is_imm          : in     vl_logic;
        Is_Br           : in     vl_logic;
        cuBranchComm    : in     vl_logic_vector(1 downto 0);
        Opcode          : out    vl_logic_vector(5 downto 0);
        \Function\      : out    vl_logic_vector(5 downto 0)
    );
end CPU_Data;
