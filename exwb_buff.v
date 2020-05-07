`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Santa Clara University
// Engineer: Jonathan Trinh
// 
// Create Date: 02/05/2019 02:49:51 PM
// Design Name: 
// Module Name: exwb_buff
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

// This module takes inputs from the control unit (the IFID buffer), alu, and data memory
module exwb_buff(
    N, Z, regwrt, memtoreg, pctoreg, branch_neg, branch_zero, jump, jumpmem, PC, alu, data, rd, clk,
    N_out, Z_out, regwrt_out, memtoreg_out, pctoreg_out, branch_neg_out, branch_zero_out, jump_out, jumpmem_out, PC_out, alu_out, data_out, rd_out
    );
    
    input N, Z, regwrt, memtoreg, pctoreg, branch_neg, branch_zero, jump, jumpmem, clk;     // inputs from control + clk
    input [31:0] alu, data;     // inputs from alu
    input [31:0] PC;             // the program counter
    input [5:0] rd;             
    
    output reg N_out, Z_out, regwrt_out, memtoreg_out, pctoreg_out, branch_neg_out, branch_zero_out, jump_out, jumpmem_out;
    output reg [31:0] alu_out, data_out;
    output reg [31:0] PC_out;
    output reg [5:0] rd_out;
    
    always @(posedge clk) begin
        N_out = N;                      // take inputs and send them all into the output (except for clk)
        Z_out = Z;
        regwrt_out = regwrt;
        memtoreg_out = memtoreg;
        pctoreg_out = pctoreg;
        branch_neg_out = branch_neg;
        branch_zero_out = branch_zero;
        jump_out = jump;
        jumpmem_out = jumpmem;
        
        alu_out = alu;
        data_out = data;
        PC_out = PC;
        rd_out = rd;
    end
endmodule
