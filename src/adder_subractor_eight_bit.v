`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 19:45:23
// Design Name: 
// Module Name: adder_subractor_eight_bit
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


module adder_subractor_eight_bit(m,sum,cout,a,b,cin);
input m,cin;
input [7:0]a,b;
output [7:0]sum;
output cout;

wire c0,c1,c2,c3,c4,c5,c6;
wire y0,y1,y2,y3,y4,y5,y6,y7;

assign y0=m^b[0];
assign y1=m^b[1];
assign y2=m^b[2];
assign y3=m^b[3];
assign y4=m^b[4];
assign y5=m^b[5];
assign y6=m^b[6];
assign y7=m^b[7];


full_adder f0(.s(sum[0]), .c(c0), .a(a[0]), .b(y0), .cin(cin));
full_adder f1(.s(sum[1]), .c(c1), .a(a[1]), .b(y1), .cin(c0));
full_adder f2(.s(sum[2]), .c(c2), .a(a[2]), .b(y2), .cin(c1));
full_adder f3(.s(sum[3]), .c(c3), .a(a[3]), .b(y3), .cin(c2));
full_adder f4(.s(sum[4]), .c(c4), .a(a[4]), .b(y4), .cin(c3));
full_adder f5(.s(sum[5]), .c(c5), .a(a[5]), .b(y5), .cin(c4));
full_adder f6(.s(sum[6]), .c(c6), .a(a[6]), .b(y6), .cin(c5));
full_adder f7(.s(sum[7]), .c(cout), .a(a[7]), .b(y7), .cin(c6));

endmodule
