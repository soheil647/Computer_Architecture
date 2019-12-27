library verilog;
use verilog.vl_types.all;
entity CPU_Data is
    port(
        Branch          : in     vl_logic;
        JumpControl     : in     vl_logic;
        MemRead         : in     vl_logic;
        MemWrite        : in     vl_logic;
        WriteControl    : in     vl_logic_vector(1 downto 0);
        ALUOperation    : in     vl_logic_vector(1 downto 0);
        ALUSrc          : in     vl_logic;
        RegWrite        : in     vl_logic;
        WndSelect       : in     vl_logic_vector(1 downto 0);
        Instr2ctrl      : out    vl_logic_vector(15 downto 0);
        Clk             : in     vl_logic;
        Rst             : in     vl_logic
    );
end CPU_Data;
