`default_nettype none

module slow_clk(
    input original_clk,
    input reset,
    output slow_clk
    );
    
    parameter CLOCKCOUNT = 2;
    reg [36:0] counter;

    always @(posedge original_clk) begin
        if(reset)
            counter <= 0;
        else
        if(counter >= CLOCKCOUNT) begin
            counter <= 0;
        end
        else begin
            counter <= counter + 1;
        end
    end
    assign slow_clk = (counter == CLOCKCOUNT) ? 1 : 0;
    
endmodule
