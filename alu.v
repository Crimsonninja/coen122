`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Santa Clara University
// Engineer: Jonathan Trinh
// 
// Create Date: 01/15/2019 02:12:29 PM
// Design Name: 
// Module Name: alu
// Project Name: ALU
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


module alu(A, B, op, out, zero_flag, negative_flag);
    input [31:0] A, B;                  // defining inputs and outputs
    input [3:0] op;
    output [31:0] out;
    output zero_flag, negative_flag;
    
    reg [31:0] out;
    reg zero_flag, negative_flag;
    
    always@(A, B, op) begin             // define ALU behavior
        case(op)
            4'b0000: out = A + B;       // if opcode is 0, add operands
            4'b0001: out = A + 1;       // if opcode is 1, add 1 to first operand
            4'b0010: out = ~A + 1;      // if opcode is 2, negate first operand
            4'b0011: out = A + ~B + 1;  // if opcode is 3, subtract first and second operand
            4'b0100: out = A;           // if opcode is 4, pass first operand through
        endcase
    end
    
    always@(op, out) begin
        if(op != 4'b0100) begin         //Only set flags if not passing
            negative_flag = 0;          // default values
            zero_flag = 0;
            if (out[31]==32'd1) begin   // check leading bit of the result; if it is 1, we know it is negative and set flag accordingly
                negative_flag=1;
                zero_flag=0;
            end
            if (out == 32'd0) begin     // check if the result is 0 and if so, set the flag
                negative_flag = 0;
                zero_flag = 1;
            end
        end
    end
endmodule