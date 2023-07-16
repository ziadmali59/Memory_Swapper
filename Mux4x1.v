`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2023 03:20:47 PM
// Design Name: 
// Module Name: Mux4x1
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


module Mux4x1
    (
        input [4:0] A,B,C,D,
        input [1:0] sel,
        output reg [4:0] Out
    );

    always @(*) 
    begin
        case (sel)
            0:Out=A;
            1:Out=B;
            2:Out=C;
            3:Out=D; 
            default:Out='b0; 
        endcase    
    end
endmodule
