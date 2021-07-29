// An up down 8bit synchronus counter implementation

module UDCounter8bit(clk,enable,reset,mode,count,tc);

    input clk, enable, reset, mode;
    output reg [7:0] count;
    output reg tc;

    always @(posedge clk)
    begin
        if(enable)
        begin
            if(reset)
            begin
                count = 0;
                tc = 0;
            end
            else
            begin
                if (mode==0)
                begin
                    count = count + 1;
                    if (count==255)
                        tc = 1;
                    else
                        tc = 0;
                end
                else
                begin
                    count = count - 1;
                    if (count == 0)
                        tc = 1;
                    else
                        tc = 0;
                end
            end
        end
    end

endmodule
