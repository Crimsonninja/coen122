`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2019 02:38:30 PM
// Design Name: 
// Module Name: PC
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


module PC(
    pc_in, pc_out, clk
    );
    input clk;
    input [7:0] pc_in;
    output reg [7:0] pc_out;
    
    initial begin
        #21 pc_out = 0;
    end
    
    always@(posedge clk) begin
        pc_out = pc_in;
    end
endmodule
