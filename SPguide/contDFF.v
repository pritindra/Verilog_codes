// negedge triggered D flip flop 

module cont_DFF(q, qbar, d, clk, reset);

    output q, qbar;
    input d, clk, reset;
    reg q, qbar;

    always @(negedge clk)
    begin
        q = d;
        qbar = ~d;
    end

    always @(reset)
    if (reset)
    begin
        assign q = 1'b0;
        assign qbar = 1'b1;
    end
    else
    begin
        deassign q;
        deassign qbar;
    end
endmodule

module stimulus;
    wire Q, Qbar;
    reg D, clock, Reset;

    cont_DFF dff(Q, Qbar, D, clock, Reset);
    
    initial
    begin
        #50 force dff.q = 1'b1;
        $display("Q = ", Q);
        #50 release dff.q;
    end

endmodule
