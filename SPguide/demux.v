// 1 to 4 demux using case statements

module demux1to4(out0, out1, out2, out3, in, s1, s0);
    output out0, out1, out2, out3;
    reg out0, out1, out2, out3;
    input in;
    input s1, s0;

    always @(s1 or s2 or in)
    case ({s1, s0})
    2'b00 : begin out0=in; out1=1'bz; out2=1'bz; out3=1'bz; end
    2'b01 : begin out0=1'bz; out1=in; out2=1'bz; out3=1'bz; end
    2'b00 : begin out0=1'bz'; out1=1'bz; out2=in; out3=1'bz; end
    2'b00 : begin out0=1'bz; out1=1'bz; out2=1'bz; out3=in; end

    begin
        out0=1'bx; out1=1'bx; out2=1'bx; out3=1'bx; end

    2'bz0, 2'bz1, 2'bzz, 2'b0z, 2'b1z :
    begin
        out0=1'bz; out1=1'bz; out2=1'bz; out3=1'bz; end

    default:$display("Unspecified control signals");
    endcase

endmodule



