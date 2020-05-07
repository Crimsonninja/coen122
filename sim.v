`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2019 02:23:01 PM
// Design Name: 
// Module Name: sim
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


module sim(

    );
    reg clk;
    wire [5:0] rd_exwb_out;
    wire regwrt, memtoreg, pctoreg, branch_neg, branch_zero, jump, jumpmem, memread, memwrt;  //inputs from control unit
    wire [3:0] aluop;
    wire regwrt_idex_out, memtoreg_idex_out, pctoreg_idex_out, branch_neg_idex_out, branch_zero_idex_out, jump_idex_out,
            jumpmem_idex_out, memread_idex_out, memwrt_idex_out;
    wire [31:0] rs_idex_out, rt_idex_out;
    wire [5:0] rd_idex_out;
    wire [3:0] aluop_idex_out;
    wire N_exwb_out, Z_exwb_out, regwrt_exwb_out, memtoreg_exwb_out, pctoreg_exwb_out, branch_neg_exwb_out, branch_zero_exwb_out, 
        jump_exwb_out, jumpmem_exwb_out;
    wire [31:0] data;
    wire [7:0] pc_out, pc_ifid_out;
    wire [31:0] instr_out, pc_in, pc_exwb_out;
    wire [31:0] pc_adder_out, pc_idex_out;
    wire [31:0] sign_extend_out;
    wire [31:0] sign_adder_out;
    wire [31:0] ifid_out;
    wire [31:0] rsOut, rtOut;
    wire [31:0] data_mem_out, data_exwb_out;
    wire pc_adder_z, pc_adder_n, sign_adder_z, sign_adder_n, actual_alu_z, actual_alu_n;
    wire [31:0] actual_alu_out, alu_exwb_out;
    PC program_counter(pc_in[7:0], pc_out, clk);
    instr_mem instruction_mem(pc_out, instr_out, clk);
    alu pc_adder({24'b0000_0000_0000_0000_0000_0000,pc_out},32'b0000_0000_0000_0000_0000_0000_0000_0001,4'b0001,pc_adder_out,pc_adder_z,pc_adder_n);
    alu sign_adder(sign_extend_out, {24'b0,pc_ifid_out}, 4'b0000, sign_adder_out, sign_adder_z, sign_adder_n);
    alu actual_alu(rs_idex_out, rt_idex_out, aluop_idex_out, actual_alu_out, actual_alu_z, actual_alu_n);
    control control_unit(ifid_out[31:28],regwrt, memtoreg, pctoreg, branch_neg, branch_zero, jump, jumpmem, memread, memwrt, aluop, clk);
    data_mem data_memory(rs_idex_out, rt_idex_out,memread_idex_out, memwrt_idex_out, data_mem_out, clk);
    reg_file register_file(regwrt_exwb_out, ifid_out[21:16], ifid_out[15:10], rd_exwb_out, data, rsOut, rtOut, clk);
    sign_extender sign_extend(ifid_out[21:0],sign_extend_out, clk);
    ifid_buff ifid(instr_out, pc_out, pc_ifid_out, ifid_out, clk);
    idex_buff idex(regwrt, memtoreg, pctoreg, branch_neg, branch_zero, jump, jumpmem,aluop, memread, memwrt, clk, rsOut, rtOut, ifid_out[27:22],
        sign_adder_out,regwrt_idex_out, memtoreg_idex_out, pctoreg_idex_out, branch_neg_idex_out, branch_zero_idex_out, jump_idex_out,
        jumpmem_idex_out, aluop_idex_out, memread_idex_out, memwrt_idex_out, rs_idex_out, rt_idex_out, rd_idex_out, pc_idex_out);
    exwb_buff exwb(actual_alu_n, actual_alu_z, regwrt_idex_out, memtoreg_idex_out, pctoreg_idex_out, branch_neg_idex_out, branch_zero_idex_out, 
        jump_idex_out, jumpmem_idex_out, pc_idex_out, actual_alu_out, data_mem_out, rd_idex_out, clk, N_exwb_out, Z_exwb_out, regwrt_exwb_out, 
        memtoreg_exwb_out, pctoreg_exwb_out, branch_neg_exwb_out, branch_zero_exwb_out, jump_exwb_out, jumpmem_exwb_out, pc_exwb_out, alu_exwb_out, 
        data_exwb_out, rd_exwb_out);
    mux pc_mux({24'b0,pc_adder_out},alu_exwb_out, data_exwb_out,32'b0,{jumpmem_exwb_out,((N_exwb_out && branch_neg_exwb_out)||(Z_exwb_out && branch_zero_exwb_out) || jump_exwb_out)}, pc_in);
    mux exwb_mux(alu_exwb_out, data_exwb_out, pc_exwb_out, 32'b0, {pctoreg_exwb_out,memtoreg_exwb_out}, data);
    
    initial begin	// inital block for clock
        clk = 1;
        forever #5 clk = ~clk;
    end
    
endmodule
