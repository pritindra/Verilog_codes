// RS latch with gate delay

module RSlatch(reset, set, q , q_bar);
    input reset, set;
    output q, q_bar;
    
    wire w1,w2;

    nor #(1) n1(q ,reset, w2);
    nor #(1) n2(q_bar ,set, w1);

endmodule


module stimulus;
    reg R, S;
    wire Q, Q_bar;

    RSlatch RS1(R, S, Q, Q_bar);

    initial
    begin
        A= 1'b0; B= 1'b0;    
        #1 $display("A= %b, B= %b, Q= %b, Q_bar= %b\n",A,B,Q,Q_bar);
        A= 1'b0; B= 1'b1;    
        #1 $display("A= %b, B= %b, Q= %b, Q_bar= %b\n",A,B,Q,Q_bar);
        A= 1'b1; B= 1'b0;    
        #1 $display("A= %b, B= %b, Q= %b, Q_bar= %b\n",A,B,Q,Q_bar);
        A= 1'b1; B= 1'b1;
        #1 $display("A= %b, B= %b, Q= %b, Q_bar= %b\n",A,B,Q,Q_bar);
    end
endmodule
