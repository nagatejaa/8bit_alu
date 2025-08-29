`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2025 20:12:12
// Design Name: 
// Module Name: eightbit_alu
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


module eightbit_alu(
    res, cout, a, b, cin, opcode, zero, sign, overflow, shift_amt
);
    input cin;
    input [7:0] a, b;
    input [3:0] opcode;       // 4-bit opcode now
    input [2:0] shift_amt;    // 3-bit shift amount

    output reg cout;
    output reg [7:0] res;
    output reg zero;
    output reg sign;
    output reg overflow;

    wire [7:0] sumout, subout;
    wire sumc, subc;
    wire add = 1'b0;
    wire sub = 1'b1;

    // Add/Sub modules
    adder_subractor_eight_bit m1(.m(add), .sum(sumout), .cout(sumc), .a(a), .b(b), .cin(cin));
    adder_subractor_eight_bit m2(.m(sub), .sum(subout), .cout(subc), .a(a), .b(b), .cin(cin));

    always @(*) begin
        cout = 0; // default
        case(opcode)
            4'b0000: begin      // ADD
                res = sumout;
                cout = sumc;
            end
            4'b0001: begin      // SUB
                res = subout;
                cout = subc;
            end
            4'b0010: res = a & b;
            4'b0011: res = a | b;
            4'b0100: res = a ^ b;
            4'b0101: res = ~a;
            4'b0110: res = a + 1;
            4'b0111: res = a - 1;

            // Shift/Rotate operations
            4'b1000: res = a << shift_amt;                     // logical left shift
            4'b1001: res = a >> shift_amt;                     // logical right shift
            4'b1010: res = (a << shift_amt) | (a >> (8-shift_amt)); // rotate left
            4'b1011: res = (a >> shift_amt) | (a << (8-shift_amt)); // rotate right

            default: res = 8'b0;
        endcase

        // Flags
        zero = (res == 8'b0);
        sign = res[7];

        // Overflow only meaningful for add/sub
        overflow = (opcode == 4'b0000) ? ((a[7] & b[7] & ~res[7]) | (~a[7] & ~b[7] & res[7])) :
                   (opcode == 4'b0001) ? ((a[7] & ~b[7] & ~res[7]) | (~a[7] & b[7] & res[7])) : 1'b0;
    end
endmodule
