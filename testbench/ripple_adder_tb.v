`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 19:16:35
// Design Name: 
// Module Name: ripple_adder_tb
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

module ripple_adder_tb();
    reg [3:0] a, b;
    reg cin;
    wire [3:0] s;
    wire cout;

    // Instantiate the ripple adder
    ripple_adder dut(.s(s), .cout(cout), .a(a), .b(b), .cin(cin));

    initial begin
        // Test case 1
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        // Test case 2
        a = 4'b0001; b = 4'b0010; cin = 0; #10;
        // Test case 3
        a = 4'b0101; b = 4'b0011; cin = 1; #10;
        // Test case 4
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        // Test case 5
        a = 4'b1010; b = 4'b0101; cin = 1; #10;

         // Stop simulation
    end
endmodule

