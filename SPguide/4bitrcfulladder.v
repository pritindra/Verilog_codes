// 4 bit ripple carry full adder implementation
// using gates only
// diagriams in the book

module FA(sum,cout,a,b,cin);
    output sum, cout;
    input a,b, cin;

    wire s1,c1,c2;

    xor (s1,a,b);
    and (c1,a,b);

    xor (sum, s1,cin);
    and (c2,s1,cin);

    xor (cout,c2,c1);
    
endmodule

module FA4(sum,cout,a,b,cin);
    output [3:0] sum;
    output cout;
    input [3:0] a,b;
    input cin;

    wire c1,c2,c3;

    FA fa0(sum[0],c1,a[0],b[0],cin);
    FA fa1(sum[1],c2,a[1],b[1],c1);
    FA fa2(sum[2],c3,a[2],b[2],c2);
    FA fa3(sum[3],cout,a[3],b[3],c3);

endmodule

module stimulus;
    reg [3:0] A,B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    FA4 fa1_4(Sum, Cout, A, B, Cin);
    initial
    begin
        $monitor($time, " A = %b, B = %b, Cin = %b, --- Cout = %b, SUM = %b\n",A,B,Cin,Cout,Sum);
    end

    initial
    begin
        A = 4'd0; B = 4'd0; Cin = 1'b0;

        #5 A = 4'd3; B = 4'd4;
        #5 A = 4'd2; B = 4'd5;
        #5 A = 4'd9; B = 4'd9;
        #5 A = 4'd10; B = 4'd15;
        #5 A = 4'd10; B = 4'd5; Cin = 1'b1;

    end

endmodule
