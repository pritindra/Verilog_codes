// implementation of vigenere cipher in verilog hdl
// 16 bit values to 4 bit arrays

module KeyGen(clk, reset, key, data, key_o);
    input clk, reset;
    input [15:0] key [3:0];
    input [15:0] data [3:0];

    output [15:0] key_o [3:0];


endmodule

module vignere (clk, reset, key, data, data_o);

    input clk, reset;
    input [15:0] key, data [3:0];
    integer i, x;
    output reg [16:0] data_o [3:0];
    
    always @(posedge clk)
    for (i=0; i<16; i=i+1) begin
        x = (data[i] + key[i]) % 26;
        data_o[i] = x;
    end
    end

endmodule

module decipher(clk, reset, key, data, data_o);

    input clk, reset;
    input [15:0] key, data_o [3:0];
    integer i, x;
    output reg [16:0] data [3:0];
    
    always @(posedge clk)
    for (i=0; i<16; i=i+1) begin
        x = (data_o[i] - key[i]) % 26;
        data[i] = x;
    end

endmodule
