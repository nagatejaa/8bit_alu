`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2025 07:17:27
// Design Name: 
// Module Name: barrel_shifter_tb
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


module barrel_shifter_tb();
   reg [7:0]i;
   reg [2:0]s;
   wire [7:0]y;
   
   barrel_shifter dut(.y(y),.s(s),.i(i));
   initial begin
   i = 8'b01100010;
   s = 3'b000;#10; 
   s = 3'b001;#10;
   s = 3'b010;#10;
   s = 3'b011;#10;
   s = 3'b100;#10; 
   s = 3'b101;#10;
   s = 3'b110;#10;
   s = 3'b111;#10;
   end  
endmodule
