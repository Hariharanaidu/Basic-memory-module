module ram(in,out,addr,rw,clk);

input [7:0] in;
input [9:0] addr;
input rw,clk;
output [7:0] out;

reg [7:0] data[1023:0];
reg [9:0] addr_reg;

always@(negedge clk)
begin
if(rw)
data[addr] <= in;
else if(!rw)
addr_reg <= addr;
end

assign out = data[addr_reg];

endmodule