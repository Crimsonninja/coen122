`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Santa Clara University
// Engineer: Jonathan Trinh
// 
// Create Date: 01/22/2019 02:17:46 PM
// Design Name: 
// Module Name: instr_mem
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


module instr_mem(
    addr,
    instr,
    clk
    );
    
    input clk;                  // define inputs and outputs
    input [7:0] addr;
    output reg [31:0] instr;
    
    wire [31:0] instructions[255:0];    // an array of 256 instructions each 31 bits wide
    
    assign instructions[0]  = 0;    //NOPS to initialize flags
    assign instructions[1]  = 32'b1111_000001_000000_000000_0011111111;         // LDPC $r1, 0x100 #
    assign instructions[2]  = 0;    // NOPS for delay
    assign instructions[3]  = 0;
    assign instructions[4]  = 32'b0101_000010_000001_000000_0000000000;         // INC $r2, $r1
    assign instructions[5]  = 32'b0110_000011_000001_000000_0000000000;         // NEG $r3, $r1
    assign instructions[6]  = 32'b1111_001010_000000_000000_0000001001;         // LDPC $r10. label 1
    assign instructions[7]  = 0;    // NOPS for delay
    assign instructions[8]  = 0;
    assign instructions[9] = 32'b1011_000000_001010_000000_0000000000;         // BRN $r10
    assign instructions[10] = 0;    // NOPS for flush
    assign instructions[11] = 0;
    assign instructions[12] = 0;
    assign instructions[13] = 0;
    assign instructions[14] = 32'b0101_000010_000010_000000_0000000000;         // INC $r2, $r2  (will not be executed)
    assign instructions[15] = 32'b0011_000001_000001_000000_0000000000;         // label 1: ST $r1, $r1
    assign instructions[16] = 0;    // NOPS for delay
    assign instructions[17] = 0;    
    assign instructions[18] = 32'b1110_000100_000001_000000_0000000000;         // LD $r4, $r1
    assign instructions[19] = 32'b0100_000101_000001_000010_0000000000;         // ADD $r5, $r1, $r2
    assign instructions[20] = 32'b0111_000110_000100_000001_0000000000;         // SUB $r6, $r4, $r1
    assign instructions[21] = 32'b1111_001011_000000_000000_0000100001;         // LDPC $r11, label 2
    assign instructions[24] = 0;    // NOPS for delay
    assign instructions[25] = 0;
    assign instructions[27] = 32'b1001_000000_001011_000000_0000000000;         // BRZ $r11
    assign instructions[28] = 0;    // NOPS for flush
    assign instructions[29] = 0;
    assign instructions[30] = 0;
    assign instructions[31] = 0;
    assign instructions[32] = 32'b0101_000010_000010_000000_0000000000;         // INC $r2, $r2  (will not be executed) 
    assign instructions[33] = 32'b1010_000001_000000_000000_0000000000;         //JM $r1
    assign instructions[34] = 0;    // NOPS for flush
    assign instructions[35] = 0;
    assign instructions[36] = 0;
    assign instructions[37] = 0;
    assign instructions[255] = 32'b1000_000000_000001_000000_0000000000;         // J $r1
    
    
    always@(negedge clk) begin
        instr = instructions[addr];     // we simply read the instruction out
    end
endmodule
