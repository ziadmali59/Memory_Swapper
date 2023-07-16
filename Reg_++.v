`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 03:00:45 PM
// Design Name: 
// Module Name: Reg_++
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


module Reg_
    (
        input [4:0] A1,A2,A3,
        input clk,rst,WE,

        input [31:0] WD3,

        output [31:0] RD1,RD2,

        input [4:0] Addr_A,Addr_B,

        input swap
    );

    wire  [1:0] tsel;
    wire tw;
    wire [4:0] tA,tB;

    wire twe;
    wire [31:0] Twd;

    Mux4x1 P3
    (.A(A1),.B(Addr_A),.C(Addr_B),.D(4'b0000),.sel(tsel),.Out(tA));

    Mux4x1 P4
    (.A(A3),.B(4'b0000),.C(Addr_A),.D(Addr_B),.sel(tsel),.Out(tB));

    Mux2x1 #(.n(1)) P5
    (.A(WE),.B(1),.sel(tw),.Out(twe));

    Mux2x1 #(.n(32)) P6
    (.A(WD3),.B(RD1),.sel(tw),.Out(Twd));

    Reg_File P1
    (.A1(tA),.A2(A2),.A3(tB),.clk(clk),.rst(rst),.WE(twe),.WD3(Twd),.RD1(RD1),.RD2(RD2));

    FSM_Controller P2
    (.clk(clk),.rst(rst),.swap(swap),.sel(tsel),.w(tw));
endmodule
