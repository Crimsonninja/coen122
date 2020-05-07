`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2019 02:37:52 PM
// Design Name: 
// Module Name: sign_extender
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


module sign_extender(
    in, out, clk
    );
    input clk;
    input [21:0] in;
    output reg [31:0] out;
    
    always @(negedge clk) begin
        if (in[21] == 0) begin
            out = {10'b0000000000, in};
        end
        else begin
            out = {10'b1111111111, in};
        end
    end
endmodule
