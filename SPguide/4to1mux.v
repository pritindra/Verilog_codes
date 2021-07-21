// A 4 to 1 muliplexer with 2 signal lines
// using logic gates only

module mux_4to1(out,i0,i1,i2,i3,s1,s0);
    output out;
    input i0,i1,i2,i3;
    input s0,s1;
    
    wire s1n,s0n;
    wire y0,y1,y2,y3;

    not (s1n,s1);
    not (s0n,s0);

    and (y0,i0,s1n,s0n);
    and (y1,i1,s1n,s0);
    and (y2,i2,s1,s0n);
    and (y0,i0,s1n,s0n);

    or (out,y0,y1,y2,y3);
endmodule


module stimulus;

    reg IN0,IN1,IN2,IN3;
    reg S0,S1;
    wire OUTPUT;
    
    mux_4to1 mux(OUTPUT,IN0,IN1,IN2,IN3,S1,S0);
    
    initial
    begin
        IN0 = 1; IN1 = 0; IN2=1; IN3 = 0;
        S1=0; S0=0;
        #1 $display("IN0= %b, IN1= %b, IN2= %b, IN3= %b\n",IN0,IN1,IN2,IN3);

        S1=0; S0=1;
        #1 $display("IN0= %b, IN1= %b, IN2= %b, IN3= %b\n",IN0,IN1,IN2,IN3);

        S1=1; S0=0;
        #1 $display("IN0= %b, IN1= %b, IN2= %b, IN3= %b\n",IN0,IN1,IN2,IN3);

        S1=1; S0=1;
        #1 $display("IN0= %b, IN1= %b, IN2= %b, IN3= %b\n",IN0,IN1,IN2,IN3);
    
    end
endmodule

 
