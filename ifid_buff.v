
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Santa Clara University
// Engineer: Jonathan Trinh
// 
// Create Date: 02/05/2019 02:21:44 PM
// Design Name: 
// Module Name: ifid_buff
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


module ifid_buff(
    instr, PC, PC_out, out, clk
    );
    input [31:0] instr;             // instruction input
    input [7:0] PC;                 // Program Counter (PC) input
    input clk;
    output reg [31:0] out;
    output reg [7:0] PC_out;
    
    always @(posedge clk) begin
        PC_out = PC;                // take the program counter and send it straight to output
        out = instr;                // take the instruction and send it straight to output
    end
endmodule