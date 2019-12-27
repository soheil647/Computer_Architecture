library verilog;
use verilog.vl_types.all;
entity mux2to1 is
    port(
        sel             : in     vl_logic;
        muxIn0          : in     vl_logic_vector(7 downto 0);
        muxIn1          : in     vl_logic_vector(7 downto 0);
        muxOut          : out    vl_logic_vector(7 downto 0)
    );
end mux2to1;
