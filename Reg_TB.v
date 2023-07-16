`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 03:49:13 PM
// Design Name: 
// Module Name: Reg_TB
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


module Reg_TB();

reg [4:0] A1,A2,A3,Addr_A,Addr_B;
reg clk,rst,WE,swap;
reg [31:0] WD3;

wire [31:0] RD1,RD2;

Reg_ UT(.A1(A1),.A2(A2),.A3(A3),.Addr_A(Addr_A),.Addr_B(Addr_B),.clk(clk),.rst(rst),.WE(WE),.swap(swap),.WD3(WD3),.RD1(RD2),.RD2(RD2));

initial 
begin
    #400 $stop;    
end
localparam T =10;

always 
begin
    clk=1'b0;
    #(T/2);
    clk=1'b1;
    #(T/2);    
end
integer i;
initial 
begin
    rst=1'b0;
    #2
    rst=1'b1;
    swap=1'b0;

    for (i =0 ;i<31 ;i=i+1 ) 
    begin
        @(negedge clk);
        A1=i;
        A2=i;
        A3=i;
        WD3=$random;
        WE=1'b1;
        #10;
    end    

    WE=1'b0;
    Addr_A=4'b0000;
    Addr_B=4'b0001;
    swap=1'b1;
    repeat(3) @(negedge clk);
    swap=1'b0;
end


endmodule
