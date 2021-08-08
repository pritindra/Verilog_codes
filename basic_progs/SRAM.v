// implementation of sync ram in verilog
// it got 8 bit addr, chipset, clock, read and write operartions

module SRAM(data_i, data_o, addr, cs, rd, we, clk);

    input [7:0] data_i;
    input [7:0] addr;
    input cs, rd, we, clk;

    output [7:0] data_o;
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
