module M;
    
    initial
        $display("Displaying in %m");

endmodule

module top;
    M m1();
    M m2();
    M m3();
endmodule
