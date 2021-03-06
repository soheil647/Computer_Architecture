module Decoder (
Dselect,
In,
O0,
O1,
O2
);
input [1:0]Dselect;
input [13:0] In;
output reg [13:0] O0,      
						O1,
						O2;

always @(*) begin
case(Dselect)
        2'b00 : O0 <= In; 
        2'b01 : O1 <= In;
        2'b10 : O2 <= In;
		    2'b11 : {O0,O1,O2} <= 3'bxxx;
endcase

end

endmodule