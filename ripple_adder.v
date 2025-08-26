`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 19:00:56
// Design Name: 
// Module Name: ripple_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:input [3:0] a, b;
// 
//////////////////////////////////////////////////////////////////////////////////


module ripple_adder(s,cout,a,b,cin);
output [3:0]s;
output cout;
input [3:0] a, b;
input cin;

wire c0, c1, c2; 

full_adder fa0(.s(s[0]), .c(c0), .a(a[0]), .b(b[0]), .cin(cin));
full_adder fa1(.s(s[1]), .c(c1), .a(a[1]), .b(b[1]), .cin(c0));
full_adder fa2(.s(s[2]), .c(c2), .a(a[2]), .b(b[2]), .cin(c1));
full_adder fa3(.s(s[3]), .c(cout), .a(a[3]), .b(b[3]), .cin(c2));

endmodule
