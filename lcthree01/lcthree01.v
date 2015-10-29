
module lcthree01
(
    clk,

    PMOD4,
    PMOD3,
    PMOD2,
    PMOD1,

    LED5,
    LED4,
    LED3,
    LED2,
    LED1
);

    input clk;

    input PMOD4;
    input PMOD3;
    input PMOD2;
    input PMOD1;

    output LED5;
    output LED4;
    output LED3;
    output LED2;
    output LED1;

    reg LED5;
    reg LED4;
    reg LED3;
    reg LED2;
    reg LED1;

    reg [31:0]XCOUNT;

    reg [7:0]led_out;

    always @( XCOUNT or led_out )
    begin
        LED1 = XCOUNT[21];
        LED2 = XCOUNT[22];
        LED3 = XCOUNT[23];
        LED4 = XCOUNT[24];
        LED5 = led_out[4];
    end

    always @( posedge clk or posedge PMOD4)
    begin
        if (PMOD4==1'b1)
        begin
            XCOUNT <= 32'h0;
        end
        else
        begin
            XCOUNT <= (XCOUNT+32'h1);
        end
    end

    top top0
    (
        .in_clock(clk),
        .in_reset(PMOD4),
        .out_led(led_out)
    );


endmodule // blinker01
