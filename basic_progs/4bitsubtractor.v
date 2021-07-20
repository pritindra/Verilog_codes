// 4-bit subtractor

`timescale 1ns/1ps

module 4bitSub(A,B,Cin,diff,Cout);
    input [3:0] A,B;
    input Cin;
    output [3:0] diff;
    output Cout;
    
    assign {Cout,diff} = A-B-Cin;

endmodule

module Top;
reg [3:0] a;
reg [3:0] b;
reg cin;

wire [3:0] diff;
wire cout;

4bitSub su0(.A(a),.B(b),.Cin(cin),.diff(diff),.Cout(cout));

initial
    begin
    a = 0;
    b = 0;
    cin = 0;
    #100;
    a = 6;
    b = 2;
    cin = 1;
    #100;    
end
endmodule


