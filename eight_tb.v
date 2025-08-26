`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 26.08.2025 19:57:40
//// Design Name: 
//// Module Name: eight_tb
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


//module eight_tb();

//reg m,cin;
//reg [7:0]a,b;
//wire [7:0]sum;
//wire cout;


//adder_subractor_eight_bit dut(.m(m),.sum(sum),.cout(cout),.a(a),.b(b),.cin(cin));




//initial begin
//    // Test case 1
//    a=8'd0; b=8'd0; m=0; cin=0; #10;
//    // Test case 2
//    a=8'd5; b=8'd10; m=0; cin=0; #10;
//    // Test case 3
//    a=8'd15; b=8'd15; m=0; cin=0; #10;
//    // Test case 4
//    a=8'd100; b=8'd50; m=0; cin=0; #10;
//    // Test case 5
//    a=8'd255; b=8'd1; m=0; cin=0; #10;

//    // Test case 6
//    a=8'd0; b=8'd0; m=1; cin=0; #10;
//    // Test case 7
//    a=8'd10; b=8'd5; m=1; cin=0; #10;
//    // Test case 8
//    a=8'd50; b=8'd25; m=1; cin=0; #10;
//    // Test case 9
//    a=8'd200; b=8'd100; m=1; cin=0; #10;
//    // Test case 10
//    a=8'd255; b=8'd1; m=1; cin=0; #10;

//    // Test case 11
//    a=8'd7; b=8'd3; m=0; cin=1; #10;
//    // Test case 12
//    a=8'd15; b=8'd20; m=0; cin=1; #10;
//    // Test case 13
//    a=8'd100; b=8'd50; m=1; cin=1; #10;
//    // Test case 14
//    a=8'd0; b=8'd255; m=1; cin=1; #10;
//    // Test case 15
//    a=8'd128; b=8'd127; m=0; cin=1; #10;

//    // Test case 16
//    a=8'd60; b=8'd30; m=0; cin=0; #10;
//    // Test case 17
//    a=8'd45; b=8'd15; m=1; cin=0; #10;
//    // Test case 18
//    a=8'd85; b=8'd170; m=0; cin=0; #10;
//    // Test case 19
//    a=8'd200; b=8'd55; m=1; cin=0; #10;
//    // Test case 20
//    a=8'd255; b=8'd255; m=0; cin=0; #10;

//    $stop;
//end
//endmodule


module eight_tb();

reg m, cin;
reg [7:0] a, b;
wire [7:0] sum;
wire cout;

// Instantiate the 8-bit adder/subtractor
adder_subractor_eight_bit dut(.m(m), .sum(sum), .cout(cout), .a(a), .b(b), .cin(cin));

initial begin
    // Print header
    $display("Time\tm\tcin\ta\tb\tsum\tcout");
    $monitor("%0t\t%b\t%b\t%0d\t%0d\t%0d\t%b", $time, m, cin, a, b, sum, cout);

    // Test cases
    a=8'd0; b=8'd0; m=0; cin=0; #10;
    a=8'd5; b=8'd10; m=0; cin=0; #10;
    a=8'd15; b=8'd15; m=0; cin=0; #10;
    a=8'd10; b=8'd5; m=1; cin=0; #10;
    a=8'd255; b=8'd1; m=1; cin=0; #10;

    $stop;
end

endmodule
