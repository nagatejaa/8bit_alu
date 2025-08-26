`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 20:45:49
// Design Name: 
// Module Name: alu_tb
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

module alu_tb();

reg [7:0] a, b;
reg [2:0] opcode;
reg cin;
wire [7:0] res;
wire cout;
wire zero, sign, overflow; // new flags

// Instantiate ALU
eightbit_alu dut(
    .res(res),
    .cout(cout),
    .zero(zero),
    .sign(sign),
    .overflow(overflow),
    .a(a),
    .b(b),
    .cin(cin),
    .opcode(opcode)
);

initial begin
    cin = 0;

    $display("Time\tOpcode\tA\tB\tCin\tRes\tCout\tZero\tSign\tOverflow");

    // Addition
    a = 8'd10; b = 8'd5; opcode = 3'b000; #10;
    $display("%0t\t%03b\t%0d\t%0d\t%b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, res, cout, zero, sign, overflow);

    // Subtraction
    a = 8'd15; b = 8'd7; opcode = 3'b001; #10;
    $display("%0t\t%03b\t%0d\t%0d\t%b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, res, cout, zero, sign, overflow);

    // AND
    a = 8'd170; b = 8'd85; opcode = 3'b010; #10;
    $display("%0t\t%03b\t%0d\t%0d\t%b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, res, cout, zero, sign, overflow);

    // OR
    a = 8'd170; b = 8'd85; opcode = 3'b011; #10;
    $display("%0t\t%03b\t%0d\t%0d\t%b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, res, cout, zero, sign, overflow);

    // XOR
    a = 8'd170; b = 8'd85; opcode = 3'b100; #10;
    $display("%0t\t%03b\t%0d\t%0d\t%b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, res, cout, zero, sign, overflow);

    // NOT A
    a = 8'd170; b = 8'd0; opcode = 3'b101; #10;
    $display("%0t\t%03b\t%0d\t%0d\t%b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, res, cout, zero, sign, overflow);

    // Increment A
    a = 8'd100; b = 8'd0; opcode = 3'b110; #10;
    $display("%0t\t%03b\t%0d\t%0d\t%b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, res, cout, zero, sign, overflow);

    // Decrement A
    a = 8'd100; b = 8'd0; opcode = 3'b111; #10;
    $display("%0t\t%03b\t%0d\t%0d\t%b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, res, cout, zero, sign, overflow);

    $stop;
end

endmodule
