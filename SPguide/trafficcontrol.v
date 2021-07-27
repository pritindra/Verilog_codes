// Traffic signal controller using finite state machine appproach
// description on chapter 7.9.3

`define TRUE 1'b1
`define FALSE 1'b0

//delays
`define Y2RDELAY 3
`define R2GDELAY 2

module sig_control(hwy, cntry, clock, clear);
    output [1:0] hwy, cntry;
    reg [1:0] hwy, cntry;
    
    input x;
    input clock, clear;

    parameter RED = 2'd0,
        YELLOW = 2'd1,
        GREEN = 2'd2;

    parameter 
        S0 = 3'd0,
        S1 = 3'd1,
        S2 = 3'd2,
        S3 = 3'd3,
        S4 = 3'd4;

    reg [2:0] state;
    reg [2:0] next_state;
    always @(posedge clock)
        if (clear)
            state <= S0;
        else
            state <= next_state;
    always @(state)
    begin
        hwy = GREEN;
        cntry = RED;
        case (state)
            S0: ;
            S1: hwy = YELLOW;
            S2: hwy = RED;
            S3: begin
                    hwy = RED;
                    cntry = GREEN;
                end
            S4: begin
                    hwy = RED;
                    cntry = YELLOW;
                end
        endcase

    end
    // finite state machine using case statements
    always @(state or X)
    begin
        case (state)
            S0: if(X)
                    next_state = S1;
                else
                    next_state = S0;
            S1: begin
                repeat(`Y2RDELAY) @(postedge clock);
                    next_state = S2;
                end
            S2: begin 
                repeat (`R2GDELAY) @(posedge clock);
                    next_state = S3;
                end
            S3: if (X)
                    next_state = S3;
                else 
                    next_state = S4;

            S4: begin 
                repeat (`Y2RDELAY) @(posedge clock);
                    next_state = S0;
                end
            default: next_state = S0;
        endcase
    end

endmodule
