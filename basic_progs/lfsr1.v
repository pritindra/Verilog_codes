// LFSR (register and feedback logic)
`timescale 1ns/1ps

module LFSR1(out, clk, reset);
    
    output reg [3:0] out;
    input clk, reset;
    wire fd;

    assign fd = ~(out[3] ^ out[2]);

    always @(posedge clk, reset)
    begin
        if (reset)
            out = 4'b0;
        else
            out = {out[2], fd};
    end

endmodule

module stimulus;
    reg clock, rst;
    wire [3:0] Out;

    initial
    begin
        clock = 0;
        rst = 1;
        #15;

        rst = 0;
    end

    always
    begin
        #10;
        clock = ~clock;
    end

    LFSR1 lfsr(Out, clock, rst);
    initial
    begin
        $dumpfile("lfsr_wf.vcd");
        $dumpvars(0,stimulus);
    end
endmodule
