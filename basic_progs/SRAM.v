// implementation of sync ram in verilog
// it got 8 bit addr, chipset, clock, read and write operartions
`timescale 1ns/1ps

module SRAM(data_i, data_o, addr, cs, rd, we, clk);

    input [7:0] data_i;
    input [7:0] addr;
    input cs, rd, we, clk;

    output reg [7:0] data_o;
    reg [7:0] sram [7:0];

    always @(posedge clk)
    begin
        if (cs == 1'b1)
        begin
            if (we == 1'b1 && rd == 1'b0)
            begin
                sram[addr] = data_i;
            end
            else if (we == 1'b0 && rd == 1'b1)
            begin
                data_o = sram[addr];
            end
            else;
        end
        else;
    end
endmodule


module stimulus;
    reg [7:0] dataIn;
    reg [7:0] Addr;
    reg CS,WE,RD,Clk;

    wire [7:0] dataOut;
    
    SRAM sram(.data_i(dataIn), .data_o(dataOut), .clk(Clk), .addr(Addr), .cs(CS), .rd(RD), .we(WE));
    
    initial begin
        dataIn = 8'h0;
        Addr = 8'h0;
        CS = 1'b0;
        WE = 1'b0;
        RD= 1'b0;
        Clk = 1'b0;

        #100;

        dataIn = 8'h0;
        Addr = 8'h0;
        CS = 1'b1;
        WE = 1'b1;
        RD= 1'b0;

        #20;
        dataIn = 8'h0;
        Addr = 8'h0;

        #20;

        dataIn = 8'h1;
        Addr = 8'h1;

        #20;
        dataIn = 8'h10;
        Addr = 8'h2;

        #20;
        dataIn = 8'h6;
        Addr = 8'h3;

        #20;

        dataIn = 8'h12;
        Addr = 8'h4;

        #40;
        Addr = 8'h0;
        WE = 1'b0;
        RD = 1'b1;

        #20;
        Addr = 8'h1;
    
        #20;
        Addr = 8'h2;
        #20;
        Addr = 8'h3;
        #20;
        Addr = 8'h4;

    end

    always #10 Clk = ~Clk;

endmodule
