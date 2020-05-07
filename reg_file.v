`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Santa Clara University
// Engineer: Jonathan Trinh
// 
// Create Date: 01/22/2019 02:18:11 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    wr, rs, rt, rd, data, rsOut, rtOut, clk
    );
    input wr, clk;                  // define inputs and outputs
    input [5:0] rs, rt, rd;
    input [31:0] data;
    output reg [31:0] rsOut, rtOut;
    
    reg [31:0] registers[63:0];     // an array of 64 registers each 32 bits wide

    always@(negedge clk) begin
    rsOut = registers[rs];          // we are always reading rs to rsOut
    rtOut = registers[rt];          // same with rtOut
        if (wr) begin               // if write signal is 1
            registers[rd] = data;   // we write the data to the appropriate register specified by the address (rd)
        end
    end
endmodule
