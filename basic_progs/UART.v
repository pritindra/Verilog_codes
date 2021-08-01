// Implementation of an UART

`define WORD_SIZE 8'd3

module UARTtrans(din, wr_en, t_clk, t_rst, tx, tx_busy);

    input wire wr_en, t_clk, t_rst;
    input wire [7:0] din;

    output reg tx;
    output wire tx_busy;
    
    initial 
    begin
        tx = 1'b1;
    end
    parameter TX_IDLE = 2'b00;
    parameter TX_START = 2'b01;
    parameter TX_DATA = 2'b10;
    parameter TX_STOP = 2'b11;

    reg [7:0] data = 8'h00;
    reg [2:0] bitpos = 3'h0;
    reg [1:0] state = TX_IDLE;

    always @* begin
        case (state)
        TX_IDLE: begin
            if(wr_en) 
            begin
                state <= TX_START;
                data <= din;
                bitpos <= 3'h0;
            end
        end
        TX_START: begin
            if (t_rst) begin
                tx <= 1'b0;
                state <= TX_DATA;
            end
        end
        TX_DATA: begin
            if (t_rst) begin
                if (bitpos == 3'h7)
                    state <= TX_STOP;
                else
                    bitpos <= bitpos + 3'h1;
                tx <= data[bitpos];
            end
        end
        TX_STOP: begin
            if (t_rst)
            begin
                tx <= 1'b1;
                state <= TX_IDLE;
            end
        end
        default: begin
            tx <= 1'b1;
            state <= TX_IDLE;
        end

        endcase
    end
    assign tx_busy = (state != TX_IDLE);

endmodule

module UARTrec(serial_i, ready_i, r_clk, r_reset, ready_o, data_o);

    input wire r_reset, serial_i, r_clk;
    input ready_i;
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
                    data_o <= scratch;
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

module UART();
// insert receiver and transmitter
endmodule
