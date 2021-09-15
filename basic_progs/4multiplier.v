// baisc 4*4 multiplier 

`timescale 1ns/1ps

module MUL4(reset, A, B, Res);
    input reset;
    input [3:0] A,B;
    output [7:0] Res;
    
    wire w0,w1,w2,w4;
    reg [8:0] Acc;

    always @(posedge reset)
    begin
        if (reset) begin
            Acc <= 0;
            Res <= 0;
        end
    end
endmodule
