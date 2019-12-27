library verilog;
use verilog.vl_types.all;
entity Stack is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        push            : in     vl_logic;
        pop             : in     vl_logic;
        tos             : in     vl_logic;
        Din             : in     vl_logic_vector(7 downto 0);
        Dout            : out    vl_logic_vector(7 downto 0)
    );
end Stack;
