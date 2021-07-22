// A 8-bit D flip flop implementation

module DFF_8bit(din,clk,clear,enable,q);
    input [7:0] din;
    input clk,clear,enable;
    output reg [7:0] q;

    always@(posedge clk)
        if(enable)
        begin
            if (clear)
                q <= 0;
            else
                q <= din;
        end

endmodule


