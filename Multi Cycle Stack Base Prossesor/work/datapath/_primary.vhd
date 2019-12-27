library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IorD            : in     vl_logic;
        MtoS            : in     vl_logic;
        srcA            : in     vl_logic;
        srcB            : in     vl_logic;
        PCwrite         : in     vl_logic;
        PCwritecond     : in     vl_logic;
        PCsrc           : in     vl_logic;
        IRwrite         : in     vl_logic;
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        ldA             : in     vl_logic;
        ldB             : in     vl_logic;
        push            : in     vl_logic;
        pop             : in     vl_logic;
        tos             : in     vl_logic;
        ALUOperation    : in     vl_logic_vector(1 downto 0);
        Opcode          : out    vl_logic_vector(2 downto 0)
    );
end datapath;
