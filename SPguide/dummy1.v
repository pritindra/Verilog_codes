// timescale implementation

`timescale 100ns / 1ns

module dummy1;
    reg toggle;
    initial
        toggle = 1'b0;
    always #5
    begin
        toggle = ~toggle;
        $display("%d , In %m toggle = %b", $time, toggle);
    end
endmodule

module dummy2;
    reg toggle;
    initial
        toggle = 1'b0;
        always #5
            begin
                toggle = ~toggle;
                $display("%d , In %m toggle = %b", $time, toggle);
            end
endmodule
