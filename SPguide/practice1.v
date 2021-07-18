
`define MEM_SIZE 1024

module
latch = 4'd12;
in_reg = 3'd2;

$display("The current value of latch = %b\n", latch);
$monitor($time,"In register value = %b\n", in_reg[2:0]);
$display("The maximum memory size is %h",`MEM_SIZE);
endmodule

// syntax errors occur
