
module myrisc1601
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

    reg [7:0]led_out;

    always @*
    begin
        LED1 = led_out[0];
        LED2 = led_out[2];
        LED3 = led_out[3];
        LED4 = led_out[4];
        LED5 = led_out[5];
    end

    myrisc16 myrisc16x
    (
        .in_clock(clk),
        .in_reset(PMOD4),
        .out_led(led_out)
    );


endmodule // blinker01
