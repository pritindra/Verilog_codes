// synchronizing mechanism for displaying data

module M;
    
    integer a,b,c,d;
    wire clk;

    initial
        b = 0;
        d = 1;

    always @(posedge clk)
    begin
        a = b;
        c = d;
    end

    always @(posedge clk)
        $strobe("displaying a = %b, c = %b", a, c);
endmodule
