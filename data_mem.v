`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Santa Clara University
// Engineer: Jonathan Trinh
// 
// Create Date: 01/22/2019 02:16:35 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    addr,
    in,
    r,
    w,
    out,
    clk
    );
    input [31:0] addr, in;              // define inputs and outputs
    input r, w, clk;
    output reg [31:0] out;
    
    reg [31:0] data[65535:0];           // an array of 65536 registers each 32 bits wide
    
    always@(negedge clk) begin
        if (r == 1)                     // if write signal is 1, then we read from memory (with the first half of address)
            out = data[addr[15:0]];
        else if (w == 1)                // read and write are mutually exclusive so if write is 1, we write whatever the data (in) is
            data[addr[15:0]] = in;
    end
endmodule
