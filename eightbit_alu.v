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


module eightbit_alu(res,cout,a,b,cin,opcode,zero,sign,overflow);
input cin;
input [7:0]a,b;
input [2:0]opcode;

output reg cout;
output reg [7:0]res;
output reg zero;
output reg sign;
output reg overflow;

wire [7:0]sumout,subout;
wire sumc,subc;
wire add = 1'b0;
wire sub = 1'b1;
 
adder_subractor_eight_bit m1(.m(add),.sum(sumout),.cout(sumc),.a(a),.b(b),.cin(cin));
adder_subractor_eight_bit m2(.m(sub),.sum(subout),.cout(subc),.a(a),.b(b),.cin(cin));      
always @(*) begin
    case(opcode)
        3'b000:
            begin
                res = sumout;
                cout = sumc;
            end
        3'b001: 
            begin
                res = subout;
                cout = subc;
            end
        3'b010: res=a&b;
        3'b011: res= a|b;
        3'b100: res=a^b;
        3'b101: res= ~a;
        3'b110: res=a+1;
        3'b111: res= a-1;
        default: res=8'b0;
        
    endcase
    
    
    
    zero = (res == 8'b0);
    sign = res[7];

    // Overflow only meaningful for add/sub
    overflow = (opcode == 3'b000) ? ((a[7] & b[7] & ~res[7]) | (~a[7] & ~b[7] & res[7])) :
               (opcode == 3'b001) ? ((a[7] & ~b[7] & ~res[7]) | (~a[7] & b[7] & res[7])) : 1'b0;
               
               
    end
endmodule
