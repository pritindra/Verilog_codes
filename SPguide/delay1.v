// praccticing delays on gates

module D (out,a,b,c);
    output out;
    input a,b,c;
    wire e;

    and #(5) a1(e,a,b); //delay 5
    or #(4) o1(out,e,c); //delay 4

endmodule

module stimulus;
    reg A, B, C;
    wire Out;

    D d1(Out, A, B, C);
    initial
    begin
        A=1'b0; B=1'b0; C=1'b0;
        #10 A= 1'b1; B= 1'b1; C= 1'b1;
        #10 A= 1'b1; B= 1'b0; C= 1'b0;
        #20 $finish;
    end
endmodule

