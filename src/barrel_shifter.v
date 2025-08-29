`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2025 07:01:08
// Design Name: 
// Module Name: barrel_shifter
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


module barrel_shifter(y,i,s);

    input [7:0]i;
    input [2:0]s;
    output [7:0]y;
 
    
    mux_8x1 u0(y[0],s,i);
    mux_8x1 u1(y[1], s, {i[0], i[7:1]});
    mux_8x1 u2(y[2], s, {i[1:0], i[7:2]});
    mux_8x1 u3(y[3], s, {i[2:0], i[7:3]});
    mux_8x1 u4(y[4], s, {i[3:0], i[7:4]});
    mux_8x1 u5(y[5], s, {i[4:0], i[7:5]});
    mux_8x1 u6(y[6], s, {i[5:0], i[7:6]});
    mux_8x1 u7(y[7], s, {i[6:0], i[7]});
    
    
    
endmodule
