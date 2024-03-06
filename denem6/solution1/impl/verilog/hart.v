// ==============================================================
// Generated by Vitis HLS v2023.2.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="hart_hart,hls_ip_2023_2_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu7ev-ffvf1517-3-e,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.060167,HLS_SYN_LAT=3,HLS_SYN_TPT=none,HLS_SYN_MEM=2,HLS_SYN_DSP=0,HLS_SYN_FF=139,HLS_SYN_LUT=1905,HLS_VERSION=2023_2_2}" *)

module hart (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        inst,
        pc,
        ap_return
);

parameter    ap_ST_fsm_state1 = 9'd1;
parameter    ap_ST_fsm_state2 = 9'd2;
parameter    ap_ST_fsm_state3 = 9'd4;
parameter    ap_ST_fsm_state4 = 9'd8;
parameter    ap_ST_fsm_state5 = 9'd16;
parameter    ap_ST_fsm_state6 = 9'd32;
parameter    ap_ST_fsm_state7 = 9'd64;
parameter    ap_ST_fsm_state8 = 9'd128;
parameter    ap_ST_fsm_state9 = 9'd256;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] inst;
input  [31:0] pc;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [8:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [4:0] rf_address0;
reg    rf_ce0;
reg    rf_we0;
reg   [31:0] rf_d0;
wire   [31:0] rf_q0;
reg   [4:0] rf_address1;
reg    rf_ce1;
reg    rf_we1;
reg   [31:0] rf_d1;
wire   [31:0] rf_q1;
wire   [6:0] opcode_fu_320_p1;
reg   [6:0] opcode_reg_667;
wire   [4:0] rd_fu_324_p4;
reg   [4:0] rd_reg_671;
reg   [4:0] rs1_reg_681;
reg   [4:0] rs2_reg_689;
reg   [2:0] func3_reg_695;
reg   [6:0] tmp5_reg_701;
wire  signed [31:0] sext_ln34_fu_384_p1;
reg  signed [31:0] sext_ln34_reg_706;
wire   [12:0] offset_fu_424_p6;
reg   [12:0] offset_reg_712;
wire   [31:0] imm_20_U_fu_448_p3;
reg   [31:0] imm_20_U_reg_722;
wire   [0:0] icmp_ln53_fu_456_p2;
reg   [0:0] icmp_ln53_reg_728;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln80_fu_470_p2;
reg   [0:0] icmp_ln80_reg_737;
wire    ap_CS_fsm_state8;
wire  signed [31:0] sext_ln67_5_fu_552_p1;
wire    ap_CS_fsm_state9;
wire  signed [31:0] sext_ln67_4_fu_563_p1;
wire  signed [31:0] sext_ln67_3_fu_580_p1;
wire  signed [31:0] sext_ln67_2_fu_591_p1;
wire  signed [31:0] sext_ln67_1_fu_608_p1;
wire  signed [31:0] sext_ln67_fu_625_p1;
wire   [31:0] grp_fu_292_p2;
wire   [31:0] next_pc_1_fu_655_p2;
wire    grp_OP_AL_32I_fu_278_ap_ready;
reg   [5:0] grp_OP_AL_32I_fu_278_opcode_val;
reg   [31:0] grp_OP_AL_32I_fu_278_op1_val;
reg   [31:0] grp_OP_AL_32I_fu_278_op2_val;
wire   [31:0] grp_OP_AL_32I_fu_278_ap_return;
reg   [31:0] ap_phi_mux_next_pc_5_phi_fu_250_p24;
reg   [31:0] next_pc_5_reg_245;
wire   [31:0] next_pc_3_fu_491_p4;
wire    ap_CS_fsm_state4;
wire   [31:0] next_pc_4_fu_480_p4;
wire   [0:0] trunc_ln42_1_fu_629_p1;
wire   [0:0] trunc_ln42_fu_642_p1;
wire   [63:0] zext_ln78_fu_462_p1;
wire    ap_CS_fsm_state2;
wire   [63:0] zext_ln79_fu_466_p1;
wire   [63:0] zext_ln73_fu_502_p1;
wire    ap_CS_fsm_state5;
wire   [63:0] zext_ln70_fu_511_p1;
wire    ap_CS_fsm_state6;
wire   [63:0] zext_ln67_fu_515_p1;
wire    ap_CS_fsm_state7;
wire   [63:0] zext_ln62_fu_519_p1;
wire   [63:0] zext_ln62_1_fu_523_p1;
wire   [63:0] zext_ln57_fu_527_p1;
wire   [63:0] zext_ln52_fu_531_p1;
wire   [63:0] zext_ln52_1_fu_535_p1;
wire   [63:0] zext_ln58_fu_638_p1;
wire   [63:0] zext_ln53_fu_651_p1;
wire   [31:0] add_ln70_fu_506_p2;
wire  signed [31:0] sext_ln58_fu_633_p1;
wire  signed [31:0] sext_ln53_fu_646_p1;
wire   [11:0] imm_11_0_fu_374_p4;
wire   [0:0] tmp_1_fu_396_p3;
wire   [0:0] tmp_fu_388_p3;
wire   [5:0] tmp_2_fu_414_p4;
wire   [3:0] tmp_4_fu_404_p4;
wire   [19:0] tmp_5_fu_438_p4;
wire   [31:0] next_pc_fu_475_p2;
wire   [0:0] grp_fu_298_p2;
wire   [0:0] xor_ln74_fu_539_p2;
wire   [12:0] returnval_6_fu_545_p3;
wire   [12:0] returnval_5_fu_556_p3;
wire   [0:0] grp_fu_304_p2;
wire   [0:0] xor_ln72_fu_567_p2;
wire   [12:0] returnval_4_fu_573_p3;
wire   [12:0] returnval_3_fu_584_p3;
wire   [0:0] icmp_ln70_fu_595_p2;
wire   [12:0] returnval_2_fu_601_p3;
wire   [0:0] icmp_ln69_fu_612_p2;
wire   [12:0] returnval_1_fu_618_p3;
wire   [30:0] grp_fu_310_p4;
reg   [8:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 9'd1;
end

hart_rf_RAM_AUTO_1R1W #(
    .DataWidth( 32 ),
    .AddressRange( 32 ),
    .AddressWidth( 5 ))
rf_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(rf_address0),
    .ce0(rf_ce0),
    .we0(rf_we0),
    .d0(rf_d0),
    .q0(rf_q0),
    .address1(rf_address1),
    .ce1(rf_ce1),
    .we1(rf_we1),
    .d1(rf_d1),
    .q1(rf_q1)
);

hart_OP_AL_32I grp_OP_AL_32I_fu_278(
    .ap_ready(grp_OP_AL_32I_fu_278_ap_ready),
    .opcode_val(grp_OP_AL_32I_fu_278_opcode_val),
    .func7_val(tmp5_reg_701),
    .func3_val(func3_reg_695),
    .op1_val(grp_OP_AL_32I_fu_278_op1_val),
    .op2_val(grp_OP_AL_32I_fu_278_op2_val),
    .ap_return(grp_OP_AL_32I_fu_278_ap_return)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state9) & (((opcode_reg_667 == 7'd55) | ((opcode_reg_667 == 7'd19) & (trunc_ln42_1_fu_629_p1 == 1'd0))) | ((opcode_reg_667 == 7'd51) & (trunc_ln42_fu_642_p1 == 1'd0))))) begin
        next_pc_5_reg_245 <= grp_fu_292_p2;
    end else if (((1'b1 == ap_CS_fsm_state9) & ((((opcode_reg_667 == 7'd23) | (~(opcode_reg_667 == 7'd111) & ~(opcode_reg_667 == 7'd55) & ~(opcode_reg_667 == 7'd19) & ~(opcode_reg_667 == 7'd51) & ~(opcode_reg_667 == 7'd103) & ~(opcode_reg_667 == 7'd99))) | ((opcode_reg_667 == 7'd19) & (trunc_ln42_1_fu_629_p1 == 1'd1))) | ((opcode_reg_667 == 7'd51) & (trunc_ln42_fu_642_p1 == 1'd1))))) begin
        next_pc_5_reg_245 <= next_pc_1_fu_655_p2;
    end else if (((icmp_ln80_reg_737 == 1'd0) & (opcode_reg_667 == 7'd103) & (1'b1 == ap_CS_fsm_state4))) begin
        next_pc_5_reg_245 <= next_pc_4_fu_480_p4;
    end else if (((icmp_ln80_reg_737 == 1'd1) & (opcode_reg_667 == 7'd103) & (1'b1 == ap_CS_fsm_state4))) begin
        next_pc_5_reg_245 <= next_pc_3_fu_491_p4;
    end else if (((func3_reg_695 == 3'd0) & (opcode_reg_667 == 7'd99) & (1'b1 == ap_CS_fsm_state9))) begin
        next_pc_5_reg_245 <= sext_ln67_fu_625_p1;
    end else if (((func3_reg_695 == 3'd1) & (opcode_reg_667 == 7'd99) & (1'b1 == ap_CS_fsm_state9))) begin
        next_pc_5_reg_245 <= sext_ln67_1_fu_608_p1;
    end else if (((func3_reg_695 == 3'd4) & (opcode_reg_667 == 7'd99) & (1'b1 == ap_CS_fsm_state9))) begin
        next_pc_5_reg_245 <= sext_ln67_2_fu_591_p1;
    end else if (((func3_reg_695 == 3'd5) & (opcode_reg_667 == 7'd99) & (1'b1 == ap_CS_fsm_state9))) begin
        next_pc_5_reg_245 <= sext_ln67_3_fu_580_p1;
    end else if (((func3_reg_695 == 3'd6) & (opcode_reg_667 == 7'd99) & (1'b1 == ap_CS_fsm_state9))) begin
        next_pc_5_reg_245 <= sext_ln67_4_fu_563_p1;
    end else if (((func3_reg_695 == 3'd7) & (opcode_reg_667 == 7'd99) & (1'b1 == ap_CS_fsm_state9))) begin
        next_pc_5_reg_245 <= sext_ln67_5_fu_552_p1;
    end else if (((1'b1 == ap_CS_fsm_state9) & (((func3_reg_695 == 3'd2) & (opcode_reg_667 == 7'd99)) | ((func3_reg_695 == 3'd3) & (opcode_reg_667 == 7'd99))))) begin
        next_pc_5_reg_245 <= 32'd1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        func3_reg_695 <= {{inst[14:12]}};
        icmp_ln53_reg_728 <= icmp_ln53_fu_456_p2;
        imm_20_U_reg_722[31 : 12] <= imm_20_U_fu_448_p3[31 : 12];
        offset_reg_712[12 : 1] <= offset_fu_424_p6[12 : 1];
        opcode_reg_667 <= opcode_fu_320_p1;
        rd_reg_671 <= {{inst[11:7]}};
        rs1_reg_681 <= {{inst[19:15]}};
        rs2_reg_689 <= {{inst[24:20]}};
        sext_ln34_reg_706 <= sext_ln34_fu_384_p1;
        tmp5_reg_701 <= {{inst[31:25]}};
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        icmp_ln80_reg_737 <= icmp_ln80_fu_470_p2;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((opcode_reg_667 == 7'd103) & (1'b1 == ap_CS_fsm_state4))) begin
        if ((icmp_ln80_reg_737 == 1'd0)) begin
            ap_phi_mux_next_pc_5_phi_fu_250_p24 = next_pc_4_fu_480_p4;
        end else if ((icmp_ln80_reg_737 == 1'd1)) begin
            ap_phi_mux_next_pc_5_phi_fu_250_p24 = next_pc_3_fu_491_p4;
        end else begin
            ap_phi_mux_next_pc_5_phi_fu_250_p24 = next_pc_5_reg_245;
        end
    end else begin
        ap_phi_mux_next_pc_5_phi_fu_250_p24 = next_pc_5_reg_245;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        if ((opcode_reg_667 == 7'd51)) begin
            grp_OP_AL_32I_fu_278_op1_val = rf_q1;
        end else if ((opcode_reg_667 == 7'd19)) begin
            grp_OP_AL_32I_fu_278_op1_val = rf_q0;
        end else begin
            grp_OP_AL_32I_fu_278_op1_val = 'bx;
        end
    end else begin
        grp_OP_AL_32I_fu_278_op1_val = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        if ((opcode_reg_667 == 7'd51)) begin
            grp_OP_AL_32I_fu_278_op2_val = rf_q0;
        end else if ((opcode_reg_667 == 7'd19)) begin
            grp_OP_AL_32I_fu_278_op2_val = sext_ln34_reg_706;
        end else begin
            grp_OP_AL_32I_fu_278_op2_val = 'bx;
        end
    end else begin
        grp_OP_AL_32I_fu_278_op2_val = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        if ((opcode_reg_667 == 7'd51)) begin
            grp_OP_AL_32I_fu_278_opcode_val = 6'd51;
        end else if ((opcode_reg_667 == 7'd19)) begin
            grp_OP_AL_32I_fu_278_opcode_val = 6'd19;
        end else begin
            grp_OP_AL_32I_fu_278_opcode_val = 'bx;
        end
    end else begin
        grp_OP_AL_32I_fu_278_opcode_val = 'bx;
    end
end

always @ (*) begin
    if (((opcode_reg_667 == 7'd51) & (1'b1 == ap_CS_fsm_state8))) begin
        rf_address0 = zext_ln52_1_fu_535_p1;
    end else if (((opcode_reg_667 == 7'd19) & (1'b1 == ap_CS_fsm_state8))) begin
        rf_address0 = zext_ln57_fu_527_p1;
    end else if (((opcode_reg_667 == 7'd99) & (1'b1 == ap_CS_fsm_state8))) begin
        rf_address0 = zext_ln62_1_fu_523_p1;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        rf_address0 = zext_ln67_fu_515_p1;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        rf_address0 = zext_ln70_fu_511_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        rf_address0 = zext_ln73_fu_502_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        rf_address0 = zext_ln79_fu_466_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        rf_address0 = zext_ln78_fu_462_p1;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        rf_address0 = 5'd0;
    end else begin
        rf_address0 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln53_reg_728 == 1'd0) & (opcode_reg_667 == 7'd51) & (1'b1 == ap_CS_fsm_state9))) begin
        rf_address1 = zext_ln53_fu_651_p1;
    end else if (((icmp_ln53_reg_728 == 1'd0) & (opcode_reg_667 == 7'd19) & (1'b1 == ap_CS_fsm_state9))) begin
        rf_address1 = zext_ln58_fu_638_p1;
    end else if (((opcode_reg_667 == 7'd51) & (1'b1 == ap_CS_fsm_state8))) begin
        rf_address1 = zext_ln52_fu_531_p1;
    end else if (((opcode_reg_667 == 7'd99) & (1'b1 == ap_CS_fsm_state8))) begin
        rf_address1 = zext_ln62_fu_519_p1;
    end else begin
        rf_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state2) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((opcode_reg_667 == 7'd19) & (1'b1 == ap_CS_fsm_state8)) | ((opcode_reg_667 == 7'd51) & (1'b1 == ap_CS_fsm_state8)) | ((opcode_reg_667 == 7'd99) & (1'b1 == ap_CS_fsm_state8)))) begin
        rf_ce0 = 1'b1;
    end else begin
        rf_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln53_reg_728 == 1'd0) & (opcode_reg_667 == 7'd19) & (1'b1 == ap_CS_fsm_state9)) | ((icmp_ln53_reg_728 == 1'd0) & (opcode_reg_667 == 7'd51) & (1'b1 == ap_CS_fsm_state9)) | ((opcode_reg_667 == 7'd51) & (1'b1 == ap_CS_fsm_state8)) | ((opcode_reg_667 == 7'd99) & (1'b1 == ap_CS_fsm_state8)))) begin
        rf_ce1 = 1'b1;
    end else begin
        rf_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        rf_d0 = imm_20_U_reg_722;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        rf_d0 = add_ln70_fu_506_p2;
    end else if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state2))) begin
        rf_d0 = grp_fu_292_p2;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        rf_d0 = 32'd0;
    end else begin
        rf_d0 = 'bx;
    end
end

always @ (*) begin
    if (((icmp_ln53_reg_728 == 1'd0) & (1'b1 == ap_CS_fsm_state9))) begin
        if ((opcode_reg_667 == 7'd51)) begin
            rf_d1 = sext_ln53_fu_646_p1;
        end else if ((opcode_reg_667 == 7'd19)) begin
            rf_d1 = sext_ln58_fu_633_p1;
        end else begin
            rf_d1 = 'bx;
        end
    end else begin
        rf_d1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)) | ((icmp_ln53_reg_728 == 1'd0) & (1'b1 == ap_CS_fsm_state7)) | ((icmp_ln53_reg_728 == 1'd0) & (1'b1 == ap_CS_fsm_state6)) | ((icmp_ln53_reg_728 == 1'd0) & (1'b1 == ap_CS_fsm_state5)) | ((icmp_ln53_reg_728 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        rf_we0 = 1'b1;
    end else begin
        rf_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln53_reg_728 == 1'd0) & (opcode_reg_667 == 7'd19) & (1'b1 == ap_CS_fsm_state9)) | ((icmp_ln53_reg_728 == 1'd0) & (opcode_reg_667 == 7'd51) & (1'b1 == ap_CS_fsm_state9)))) begin
        rf_we1 = 1'b1;
    end else begin
        rf_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((opcode_fu_320_p1 == 7'd55) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else if (((opcode_fu_320_p1 == 7'd23) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else if (((opcode_fu_320_p1 == 7'd111) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else if (((opcode_fu_320_p1 == 7'd103) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if ((~(opcode_fu_320_p1 == 7'd103) & ~(opcode_fu_320_p1 == 7'd111) & ~(opcode_fu_320_p1 == 7'd23) & ~(opcode_fu_320_p1 == 7'd55) & ~(opcode_fu_320_p1 == 7'd51) & ~(opcode_fu_320_p1 == 7'd19) & ~(opcode_fu_320_p1 == 7'd99) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1) & ((opcode_fu_320_p1 == 7'd51) | ((opcode_fu_320_p1 == 7'd19) | (opcode_fu_320_p1 == 7'd99))))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln70_fu_506_p2 = (imm_20_U_reg_722 + pc);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign ap_return = ap_phi_mux_next_pc_5_phi_fu_250_p24;

assign grp_fu_292_p2 = (pc + 32'd4);

assign grp_fu_298_p2 = ((rf_q1 < rf_q0) ? 1'b1 : 1'b0);

assign grp_fu_304_p2 = (($signed(rf_q1) < $signed(rf_q0)) ? 1'b1 : 1'b0);

assign grp_fu_310_p4 = {{grp_OP_AL_32I_fu_278_ap_return[31:1]}};

assign icmp_ln53_fu_456_p2 = ((rd_fu_324_p4 == 5'd0) ? 1'b1 : 1'b0);

assign icmp_ln69_fu_612_p2 = ((rf_q1 == rf_q0) ? 1'b1 : 1'b0);

assign icmp_ln70_fu_595_p2 = ((rf_q1 != rf_q0) ? 1'b1 : 1'b0);

assign icmp_ln80_fu_470_p2 = ((func3_reg_695 == 3'd0) ? 1'b1 : 1'b0);

assign imm_11_0_fu_374_p4 = {{inst[31:20]}};

assign imm_20_U_fu_448_p3 = {{tmp_5_fu_438_p4}, {12'd0}};

assign next_pc_1_fu_655_p2 = (pc + 32'd5);

assign next_pc_3_fu_491_p4 = {next_pc_fu_475_p2[32-1:1], |(1'd0)};

assign next_pc_4_fu_480_p4 = {next_pc_fu_475_p2[32-1:1], |(1'd1)};

assign next_pc_fu_475_p2 = ($signed(rf_q0) + $signed(sext_ln34_reg_706));

assign offset_fu_424_p6 = {{{{{tmp_1_fu_396_p3}, {tmp_fu_388_p3}}, {tmp_2_fu_414_p4}}, {tmp_4_fu_404_p4}}, {1'd0}};

assign opcode_fu_320_p1 = inst[6:0];

assign rd_fu_324_p4 = {{inst[11:7]}};

assign returnval_1_fu_618_p3 = ((icmp_ln69_fu_612_p2[0:0] == 1'b1) ? offset_reg_712 : 13'd4);

assign returnval_2_fu_601_p3 = ((icmp_ln70_fu_595_p2[0:0] == 1'b1) ? offset_reg_712 : 13'd4);

assign returnval_3_fu_584_p3 = ((grp_fu_304_p2[0:0] == 1'b1) ? offset_reg_712 : 13'd4);

assign returnval_4_fu_573_p3 = ((xor_ln72_fu_567_p2[0:0] == 1'b1) ? offset_reg_712 : 13'd4);

assign returnval_5_fu_556_p3 = ((grp_fu_298_p2[0:0] == 1'b1) ? offset_reg_712 : 13'd4);

assign returnval_6_fu_545_p3 = ((xor_ln74_fu_539_p2[0:0] == 1'b1) ? offset_reg_712 : 13'd4);

assign sext_ln34_fu_384_p1 = $signed(imm_11_0_fu_374_p4);

assign sext_ln53_fu_646_p1 = $signed(grp_fu_310_p4);

assign sext_ln58_fu_633_p1 = $signed(grp_fu_310_p4);

assign sext_ln67_1_fu_608_p1 = $signed(returnval_2_fu_601_p3);

assign sext_ln67_2_fu_591_p1 = $signed(returnval_3_fu_584_p3);

assign sext_ln67_3_fu_580_p1 = $signed(returnval_4_fu_573_p3);

assign sext_ln67_4_fu_563_p1 = $signed(returnval_5_fu_556_p3);

assign sext_ln67_5_fu_552_p1 = $signed(returnval_6_fu_545_p3);

assign sext_ln67_fu_625_p1 = $signed(returnval_1_fu_618_p3);

assign tmp_1_fu_396_p3 = inst[32'd31];

assign tmp_2_fu_414_p4 = {{inst[30:25]}};

assign tmp_4_fu_404_p4 = {{inst[11:8]}};

assign tmp_5_fu_438_p4 = {{inst[31:12]}};

assign tmp_fu_388_p3 = inst[32'd7];

assign trunc_ln42_1_fu_629_p1 = grp_OP_AL_32I_fu_278_ap_return[0:0];

assign trunc_ln42_fu_642_p1 = grp_OP_AL_32I_fu_278_ap_return[0:0];

assign xor_ln72_fu_567_p2 = (grp_fu_304_p2 ^ 1'd1);

assign xor_ln74_fu_539_p2 = (grp_fu_298_p2 ^ 1'd1);

assign zext_ln52_1_fu_535_p1 = rs2_reg_689;

assign zext_ln52_fu_531_p1 = rs1_reg_681;

assign zext_ln53_fu_651_p1 = rd_reg_671;

assign zext_ln57_fu_527_p1 = rs1_reg_681;

assign zext_ln58_fu_638_p1 = rd_reg_671;

assign zext_ln62_1_fu_523_p1 = rs2_reg_689;

assign zext_ln62_fu_519_p1 = rs1_reg_681;

assign zext_ln67_fu_515_p1 = rd_reg_671;

assign zext_ln70_fu_511_p1 = rd_reg_671;

assign zext_ln73_fu_502_p1 = rd_reg_671;

assign zext_ln78_fu_462_p1 = rd_reg_671;

assign zext_ln79_fu_466_p1 = rs1_reg_681;

always @ (posedge ap_clk) begin
    offset_reg_712[0] <= 1'b0;
    imm_20_U_reg_722[11:0] <= 12'b000000000000;
end

endmodule //hart
