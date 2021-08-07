// recursive function on factorial of integer

module top;

    function automatic integer factorial;
        input [31:0] op;
        integer i;
        begin
            if (op >= 2)
                factorial = factorial (op - 1) * op;
            else
                factorial = 1;
        end
    endfunction

    integer res;
    initial
    begin
        res = factorial(4);
        $display("factorial of 4 is %0d", res);
    end
endmodule
