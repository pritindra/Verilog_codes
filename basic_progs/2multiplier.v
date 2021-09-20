// 2 bit multiplier

module multiplier(M,A,B);
    output [3:0] M;
    input [2:0] A, B;

    wire [3:0] W;

    and A0(W[0],A[0],B[1]);
    and A1(M[0],A[0],B[0]);
    and A2(W[1],A[1],B[0]);
    and A3(W[2],A[1],B[1]);

    xor X0(M[1],W[0],W[2]);
    and A4(W[3],W[0],W[2]);

    xor X1(M[2],W[3],W[2]);
    and A5(M[3],W[3],W[2]);

endmodule

module stimulus;

endmodule
