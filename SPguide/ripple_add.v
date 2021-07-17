// A 4 bit ripple carry adder
// module FA and Ripple_Add

module ripple_add(S,Cout,Cin,A,B);
    output [3:0] S;
    output Cout;
    input [3:0] A;
    input [3:0] B;
    wire [2:0] transferC;
    input Cin;

    FA fa0(S[0],transferC[0],Cin,A[0],B[0]);
    FA fa1(S[1],transferC[1],transferC[0],A[1],B[1]);
    FA fa2(S[2],transferC[2],transferC[1],A[2],B[2]);
    FA fa3(S[3],Cout,transferC[2],A[2],B[3]);

endmodule


module FA(S,Cout,Cin,A,B);
    output S;
    output Cout;
    input A,B,Cin;
    wire [2:0] W;
    
    xor G1(W[0],A,B);
    xor G2(S,W[0],Cin);
    and G3(W[1],W[0],Cin);
    and G4(W[2],A,B);
    or G5(Cout,W[1],W[2]);

endmodule
