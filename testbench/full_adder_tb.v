`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 18:37:05
// Design Name: 
// Module Name: full_adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module full_adder_tb();
reg ta,tb,tcin;
wire ts,tc;

full_adder dut(.a(ta),.b(tb),.cin(tcin),.s(ts),.c(tc));
initial begin
ta=0;tb=0;tcin=0;#10;
ta=0;tb=0;tcin=1;#10;
ta=0;tb=1;tcin=0;#10;
ta=0;tb=1;tcin=1;#10;
ta=1;tb=0;tcin=0;#10;
ta=1;tb=0;tcin=1;#10;
ta=1;tb=1;tcin=0;#10;
ta=1;tb=1;tcin=1;#10;
end
   
endmodule
