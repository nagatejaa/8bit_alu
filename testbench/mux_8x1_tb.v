`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2025 06:30:43
// Design Name: 
// Module Name: mux_8x1_tb
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


module mux_8x1_tb();

reg [2:0]s;
reg [7:0]i;
wire y;
mux_8x1 dut(.y(y),.s(s),.i(i));
initial begin
i = 8'b10101010;
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
