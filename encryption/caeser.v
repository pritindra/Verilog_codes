// simple caeser encryption in a string

module caeser (clk, reset_n, data_e, valid_e, key, data_d, valid_d);

//    parameter NO_OF_CHAR = 10;
    parameter D_WIDTH = 8;
    parameter KEY_WIDTH = 16;

    input clk, reset_n, valid_e;
    input [D_WIDTH - 1:0] data_e;
    input [KEY_WIDTH - 1:0] key;

    output reg [D_WIDTH - 1:0] data_d;
    output reg valid_d;

    always @(posedge clk)
    begin
        if (reset_n)
        begin
            valid_d <= valid_e;
            data_d <= (valid_e) ? data_e - key : 0;
        end
        if (!reset_n)
        begin
            valid_d <= 0;
            valid_d <= 0;
        end

    end

endmodule

module stimulus;
    reg clk, rst_n, val_e;
    reg [7:0] data_i;
    reg [15:0] key;

    wire val_o;
    wire [7:0] data_o;

    caeser c1(clk, rst_n, data_i, val_e, key, data_o, val_o);
    
    initial
        clk = 1'b0;
    always
        #5 clk = ~clk;

    initial
    begin
        rst_n = 1'b1;
        val_e = 1'b1;
        data_i = 8'd5;
        key = 8'd3;
        
        #10 $display("data ouput= %h", data_o);
    end
    initial #30 $finish;
endmodule
