`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Santa Clara University
// Engineer: Jonathan Trinh
// 
// Create Date: 02/05/2019 02:30:34 PM
// Design Name: 
// Module Name: idex_buff
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

// This module takes inputs from the control unit (the IFID buffer), register file, and sign extension
module idex_buff(
    regwrt, memtoreg, pctoreg, branch_neg, branch_zero, jump, jumpmem,aluop, memread, memwrt, clk,
    rs, rt, rd, PC,
    regwrt_out, memtoreg_out, pctoreg_out, branch_neg_out, branch_zero_out, jump_out, jumpmem_out, aluop_out, memread_out, memwrt_out,
    rs_out, rt_out, rd_out, PC_out
    );
    
    input regwrt, memtoreg, pctoreg, branch_neg, branch_zero, jump, jumpmem, memread, memwrt, clk;  //inputs from control unit
    input [3:0] aluop;      // the alu opcode
    input [31:0] rs, rt;
    input [5:0] rd;
    input [31:0] PC;
    
    output reg regwrt_out, memtoreg_out, pctoreg_out, branch_neg_out, branch_zero_out, jump_out, jumpmem_out, memread_out, memwrt_out;
    output reg [3:0] aluop_out;
    output reg [31:0] rs_out, rt_out;
    output reg [5:0] rd_out;
    output reg [31:0] PC_out;
    
    always@(posedge clk) begin
        regwrt_out = regwrt;            // take inputs and send them all into the output (except for clk)
        memtoreg_out = memtoreg;
        pctoreg_out = pctoreg;
        branch_neg_out = branch_neg;
        branch_zero_out = branch_zero;
        jump_out =  jump;
        jumpmem_out = jumpmem;
        memread_out = memread;
        memwrt_out = memwrt;
        
        aluop_out = aluop;
        rs_out = rs;
        rt_out = rt;
        rd_out = rd;
        PC_out = PC;
    end
    
endmodule
