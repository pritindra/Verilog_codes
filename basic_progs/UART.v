// Implementation of an UART

`define WORD_SIZE = 8

module UARTtrans(ready, t_byte, t_clk, t_rst);

    
endmodule

module UARTrec(serial_i, ready_i, r_clk, r_rst, ready_o, data_o);

    input wire reset_n, ready_i, serial_i, r_clk;
    output reg [`WORD_SIZE - 1:0] data_o;
    output reg ready_o;

    initial
    begin
        ready_i = 0;
        data_o = 8'b0;
    end

    parameter RX_IDLE = 2'b00;
    parameter RX_START = 2'b01;
    parameter RX_RECEIV = 2'b11;

    reg [1:0] state = RX_IDLE;
    reg [3:0] sample = 0;
    reg [3:0] bitpos = 0;
    reg [7:0] scratch = 8'b0;

    always @*
    begin
        if (ready_i)
            ready_o <= 0;
        if (r_reset)
        begin
            case(state)
            RX_IDLE: begin
                if(!serial_i || sample != 0)
                    sample <= sample + 4'b1;

                if (sample == 15)
                begin
                    state <= RX_START;
                    bitpos <= 0;
                    sample <= 0;
                    scratch <= 0;
                end
            end
            RX_START: begin
                sample <= sample + 4'b1;
                if (sample == 4'h8) begin
                    scratch[bitpos[2:0]] <= serial_i;
                    bitpos <= bitpos + 4'b1;
                end
                if (bitpos == 8 && sample == 15)
                    state <= RX_RECEIV;
            end
            RX_RECEIV: begin
                if (sample==15 || (sample >= 8 && !serial_i))
                begin
                    state <= RX_IDLE;
                    data <= scratch;
                    ready_o <= 1'b1;
                    sample <= 0;
                end
                else
                begin
                    sample <= sample + 4'b1;
                end
            end

            default: begin
                state <= RX_IDLE;
            end

            endcase
        end
    end

endmodule
