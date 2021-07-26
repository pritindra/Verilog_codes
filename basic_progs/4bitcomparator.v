// A 4 bit Comparator implementation
// behavior moddelling 

module Comp4bit(A,B,Gt,Lt,Et);
    input [3:0] A,B;
    output reg Gt,Lt,Et;

    always @(A,B)
    begin
        if (A<B)
            begin 
                Gt=0;
                Lt=1;
                Et=0;
            end
        else if(A>B)
            begin
                Gt=1;
                Lt=0;
                Et=0;

            end
        else
            begin
                Gt=0;
                Lt=0;
                Et=1;
            end
    end
endmodule
