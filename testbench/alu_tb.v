`timescale 1ns / 1ps

module alu_tb();

reg [7:0] a, b;
reg [3:0] opcode;       // 4-bit opcode
reg [2:0] shift_amt;    // shift amount
reg cin;
wire [7:0] res;
wire cout;
wire zero, sign, overflow;

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
    .opcode(opcode),
    .shift_amt(shift_amt)
);

initial begin
    cin = 0;
    shift_amt = 3'b000;

    $display("Time\tOpcode\tA\tB\tCin\tShiftAmt\tRes\tCout\tZero\tSign\tOverflow");

    // Addition
    a = 8'd10; b = 8'd5; opcode = 4'b0000; #10;
    $display("%0t\t%04b\t%0d\t%0d\t%b\t%03b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, shift_amt, res, cout, zero, sign, overflow);

    // Subtraction
    a = 8'd15; b = 8'd7; opcode = 4'b0001; #10;
    $display("%0t\t%04b\t%0d\t%0d\t%b\t%03b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, shift_amt, res, cout, zero, sign, overflow);

    // AND
    a = 8'd170; b = 8'd85; opcode = 4'b0010; #10;
    $display("%0t\t%04b\t%0d\t%0d\t%b\t%03b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, shift_amt, res, cout, zero, sign, overflow);

    // OR
    a = 8'd170; b = 8'd85; opcode = 4'b0011; #10;
    $display("%0t\t%04b\t%0d\t%0d\t%b\t%03b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, shift_amt, res, cout, zero, sign, overflow);

    // XOR
    a = 8'd170; b = 8'd85; opcode = 4'b0100; #10;
    $display("%0t\t%04b\t%0d\t%0d\t%b\t%03b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, shift_amt, res, cout, zero, sign, overflow);

    // NOT A
    a = 8'd170; b = 8'd0; opcode = 4'b0101; #10;
    $display("%0t\t%04b\t%0d\t%0d\t%b\t%03b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, shift_amt, res, cout, zero, sign, overflow);

    // Increment A
    a = 8'd100; b = 8'd0; opcode = 4'b0110; #10;
    $display("%0t\t%04b\t%0d\t%0d\t%b\t%03b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, shift_amt, res, cout, zero, sign, overflow);

    // Decrement A
    a = 8'd100; b = 8'd0; opcode = 4'b0111; #10;
    $display("%0t\t%04b\t%0d\t%0d\t%b\t%03b\t%0d\t%b\t%b\t%b\t%b", 
             $time, opcode, a, b, cin, shift_amt, res, cout, zero, sign, overflow);

    // Shift/Rotate tests
    a = 8'b10101010; shift_amt = 3'b001;

    // Logical left shift
    opcode = 4'b1000; #10;
    $display("%0t\t%04b\t%08b\t-\t-\t%03b\t%08b\t-\t%b\t%b\t-", 
             $time, opcode, a, shift_amt, res, zero, sign);

    // Logical right shift
    opcode = 4'b1001; #10;
    $display("%0t\t%04b\t%08b\t-\t-\t%03b\t%08b\t-\t%b\t%b\t-", 
             $time, opcode, a, shift_amt, res, zero, sign);

    // Rotate left
    opcode = 4'b1010; #10;
    $display("%0t\t%04b\t%08b\t-\t-\t%03b\t%08b\t-\t%b\t%b\t-", 
             $time, opcode, a, shift_amt, res, zero, sign);

    // Rotate right
    opcode = 4'b1011; #10;
    $display("%0t\t%04b\t%08b\t-\t-\t%03b\t%08b\t-\t%b\t%b\t-", 
             $time, opcode, a, shift_amt, res, zero, sign);

    $stop;
end

endmodule
