`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2025 06:20:41
// Design Name: 
// Module Name: mux_8x1
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


module mux_8x1(y,s,i);
    input [2:0]s;
    input [7:0]i;
    output reg y;
    
    always @(*) begin
        case(s)
            3'b000:y=i[0];
            3'b001:y=i[1];
            3'b010:y=i[2];
            3'b011:y=i[3];
            3'b100:y=i[4];
            3'b101:y=i[5];
            3'b110:y=i[6];
            3'b111:y=i[7];
        endcase
    end
    
    
    //can replace entire block of code with single line 
    //assign y = i[s]; 
    //this will directly assign the select lines to input 
  
    
    
endmodule
