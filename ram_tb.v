`timescale 1ns/100ps

module ram_tb();
reg [7:0] in;
reg [9:0] addr;
reg clk,rw;
wire [7:0] out;

ram r(.in(in),.out(out),.addr(addr),.clk(clk),.rw(rw));

initial
begin

#10 rw = 1'b1;
 addr = 10'h0;
 in = 8'b11;
 
#15
 addr = 10'h1;
 in = 8'b01;
 
#25
 addr = 10'h2;
 in = 8'b00;
 
#35 rw = 1'b0;
 addr = 10'h0;
 
#45 addr = 10'h1;

#55 addr = 10'h2;

end

initial
begin
clk = 0;
repeat(200)
 #5 clk = ~clk;
 end

endmodule

