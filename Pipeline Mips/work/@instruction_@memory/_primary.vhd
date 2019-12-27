library verilog;
use verilog.vl_types.all;
entity Instruction_Memory is
    port(
        Address         : in     vl_logic_vector(9 downto 0);
        Rst             : in     vl_logic;
        Instruction     : out    vl_logic_vector(31 downto 0)
    );
end Instruction_Memory;
