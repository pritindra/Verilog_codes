// An 8-function 4 bit ALU implementation
// using case statements

module ALU4(sig, operand1, operand2, result, cout);

    input [2:0] sig;
    input [3:0] operand1, operand2;

    output reg [4:0] result;
    output reg cout = 1'b0;

    parameter [2:0]
        OP1 = 3'b000,
        ADD = 3'b001, 
        SUB = 3'b010,
        DIV = 3'b011,
        REM = 3'b100,
        LSH = 3'b101,
        RSH = 3'b110,
        COM = 3'b111;

    always @(sig or operand1 or operand2)
    begin
        case(sig)
        OP1:begin
                result = operand1;
            end
        ADD:begin
                result = operand1 + operand2;
                cout = result[4];
            end
        SUB:begin
                result = operand1 - operand2;
                cout = result[4];
            end
        DIV:begin
                result = operand1 / operand2;
            end
        REM:begin
                result = operand1 % operand2;
            end
        LSH:begin
                result = operand1 << 1;
            end
        RSH:begin
                result = operand1 >> 1;
            end
        COM:begin
                if(operand1 > operand2)
                    result = 5'b00001;
                else
                    result = 5'b0;
                end
        default:begin
                result = 5'b0;
                cout = 1'b0;
            end
        endcase
    end

endmodule


