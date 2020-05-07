`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Santa Clara University
// Engineer: Jonathan Trinh
// 
// Create Date: 01/08/2019 02:21:28 PM
// Design Name: 
// Module Name: mux
// Project Name: COEN122_project_1
// Target Devices: 
// Tool Versions: 
// Description: This module defines a 4:1 mux select
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux(
    A, B, C, D, sel, out
    );
    input [31:0] A, B, C, D;   // define inputs
    input [1:0] sel;
    output reg [31:0] out;     // define output
    
    always @(*)         // define combinational logic
    begin
        case(sel)       // depending on what select is, we change the output so we use case statement
            2'b00: out = A;
            2'b01: out = B;
            2'b10: out = C;
            2'b11: out = D;
        endcase
    end
endmodule
