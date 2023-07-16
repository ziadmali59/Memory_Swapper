`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 03:33:03 PM
// Design Name: 
// Module Name: Mux2x1
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


module Mux2x1
    #(parameter n =1 )
    (
        input [n-1:0] A,B,
        input sel,
        output reg[n-1:0] Out
    );

    always @(*) 
    begin
        case (sel)
            0:Out=A;
            1:Out=B; 
            default:Out='b0; 
        endcase    
    end
endmodule
