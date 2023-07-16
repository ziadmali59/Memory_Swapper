`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 03:03:56 PM
// Design Name: 
// Module Name: FSM_Controller
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


module FSM_Controller
    (
        input clk,rst,swap,
        output [1:0] sel,
        output w
    );

    reg [1:0] state_reg,state_next;
    localparam s0 =0;
    localparam s1 =1;
    localparam s2 =2;
    localparam s3 =3;

    always @(posedge clk ,negedge rst) 
    begin
        if (~rst) 
        begin
            state_reg<=s0;    
        end
        else
            state_reg<=state_next;    
    end

    always @(*) 
    begin
        if (swap) 
        begin
        case (state_reg)
            s0:state_next=s1;
            s1:state_next=s2;
            s2:state_next=s3;
            s3: state_next=s0;
            default: state_next=state_reg;
        endcase
        end
        else
        state_next=s0;
    end

    assign sel=state_reg;
    assign w=(state_reg!=s0);
endmodule
