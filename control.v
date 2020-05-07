`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2019 02:46:52 PM
// Design Name: 
// Module Name: control
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


module control(
    opcode, regwrt, memtoreg, pctoreg, branch_neg, branch_zero, jump, jumpmem, memread, memwrt, aluop, clk
    );
    input [3:0] opcode;
    input clk;
    output reg regwrt, memtoreg, pctoreg, branch_neg, branch_zero, jump, jumpmem, memread, memwrt;  //inputs from control unit
    output reg [3:0] aluop;      // the alu opcode
    
    always @(negedge clk) begin
        aluop = 4'b0100;
        regwrt = 0;
        memtoreg = 0;
        pctoreg = 0;
        branch_neg = 0;
        branch_zero = 0;
        jump = 0;
        jumpmem = 0;
        memread = 0;
        memwrt = 0;
        case(opcode)
            4'b0000: begin// NOP
                // do nothing
            end
            4'b1111: begin// Load PC $rd <- PC + X
                regwrt = 1;
                pctoreg = 1;
                // everything else is 0
            end
            4'b1110: begin// Load $rd <- M[$rs]
                regwrt = 1;
                memtoreg = 1;
                memread = 1;
                // everything else is 0
            end
            4'b0011: begin // Store
                memwrt = 1;
                // everything else is 0
            end
            4'b0100: begin // Add
                aluop = 4'b0000;
                regwrt = 1;
            end
            4'b0101: begin // Increment
                aluop = 4'b0001;
                regwrt = 1;
            end
            4'b0110: begin // Negate
                aluop = 4'b0010;
                regwrt = 1;
            end
            4'b0111: begin // Subtract
                aluop = 4'b0011;
                regwrt = 1;
            end
            4'b1000: begin //Jump
                jump = 1;
            end
            4'b1001: begin //Branch if zero
                branch_zero = 1;
            end
            4'b1010: begin // Jump memory
                jumpmem = 1;
            end
            4'b1011: begin // Branch if negative
                branch_neg = 1;
            end
        endcase
    end
endmodule
