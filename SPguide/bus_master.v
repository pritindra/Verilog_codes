// module with delays

module bus_master;
    parameter delay1 = 2;
    parameter delay2 = 3;
    parameter delay3 = 7;
endmodule

module top;
    
    bus_master #(4,5,6) b1();
    bus_master #(9,4) b2();

    bus_master #(.delay1(4), delay3(7)) b3();
endmodule
