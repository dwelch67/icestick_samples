
module outer
(
    clk,
    NOTRESET,
    LED7,
    LED6,
    LED5,
    LED4,
    LED3,
    LED2,
    LED1,
    LED0
);

    input clk;
    input NOTRESET;
    output LED7;
    output LED6;
    output LED5;
    output LED4;
    output LED3;
    output LED2;
    output LED1;
    output LED0;
    reg [31:0]XCOUNT;
    blinker02 bb
    (
        .clk(XCOUNT[0]),
        .NOTRESET(NOTRESET),
        .LED0(LED0),
        .LED1(LED1),
        .LED2(LED2),
        .LED3(LED3),
        .LED4(LED4),
        .LED5(LED5),
        .LED6(LED6),
        .LED7(LED7)
    );

    always @( posedge clk or posedge NOTRESET)
    begin
        if (NOTRESET==1'b1)
        begin
            XCOUNT <= 32'h0;
        end
        else
        begin
            XCOUNT <= (XCOUNT+32'h1);
        end
    end
endmodule
