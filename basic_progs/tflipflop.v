//T flip flop implementation
//using D flip flop and behavioral

module TFF(T,clk,reset,q);
    input T,clk,reset;
    output q;
    wire w;
    assign w = T^q;
    DFF df(w,clk,reset,q);
endmodule

module DFF(din,clk,reset,q);
    input din,clk,reset;
    output reg q;
    always@(posedge clk)
    begin
        if(reset)
            q = 1'b0;
        else
            q = din;
    end
endmodule

module TFF_b(clk, reset, t, q);
    input clk, reset, t;
    output reg q;
    always@(posedge clk) 
    begin
        if (!reset)
            q <= 0;
        else
            q <= q;
    end
endmodule
