//a Note: created by CDL 1.4 - do not hand edit without recognizing it will be out of sync with the source
// Output mode 0 (VMOD=1, standard verilog=0)
// Verilog option comb reg suffix '__var'
// Verilog option include_displays 0
// Verilog option include_assertions 0
// Verilog option sv_assertions 0
// Verilog option assert delay string '<NULL>'
// Verilog option include_coverage 0
// Verilog option clock_gate_module_instance_type 'clock_gate_module'
// Verilog option clock_gate_module_instance_extra_ports ''

//a Module blinker01
module blinker01
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

    //b Clocks
    input clk;

    //b Inputs
    input NOTRESET;

    //b Outputs
    output LED7;
    output LED6;
    output LED5;
    output LED4;
    output LED3;
    output LED2;
    output LED1;
    output LED0;

// output components here

    //b Output combinatorials
    reg LED7;
    reg LED6;
    reg LED5;
    reg LED4;
    reg LED3;
    reg LED2;
    reg LED1;
    reg LED0;

    //b Output nets

    //b Internal and output registers
    reg xled7;
    reg xled6;
    reg xled5;
    reg xled4;
    reg xled3;
    reg xled2;
    reg xled1;
    reg xled0;
    reg z;
    reg [31:0]XCOUNT;

    //b Internal combinatorials

    //b Internal nets

    //b Clock gating module instances
    //b Module instances
    //b the_code__comb combinatorial process
    always @( //the_code__comb
        xled0 or
        xled1 or
        xled2 or
        xled3 or
        xled4 or
        xled5 or
        xled6 or
        xled7 )
    begin: the_code__comb_code
        LED0 = xled0;
        LED1 = xled1;
        LED2 = xled2;
        LED3 = xled3;
        LED4 = xled4;
        LED5 = xled5;
        LED6 = xled6;
        LED7 = xled7;
    end //always

    //b the_code__posedge_clk_active_high_NOTRESET clock process
    always @( posedge clk or posedge NOTRESET)
    begin : the_code__posedge_clk_active_high_NOTRESET__code
        if (NOTRESET==1'b1)
        begin
            XCOUNT <= 32'h0;
            z <= 1'h0;
            xled1 <= 1'h1;
            xled2 <= 1'h0;
            xled3 <= 1'h1;
            xled4 <= 1'h0;
            xled5 <= 1'h1;
            xled6 <= 1'h0;
            xled7 <= 1'h1;
            xled0 <= 1'h0;
        end
        else
        begin
            XCOUNT <= (XCOUNT+32'h1);
            if ((XCOUNT[20]!=z))
            begin
                z <= XCOUNT[20];
                xled1 <= xled0;
                xled2 <= xled1;
                xled3 <= xled2;
                xled4 <= xled3;
                xled5 <= xled4;
                xled6 <= xled5;
                xled7 <= xled6;
                xled0 <= (((xled3 ^ xled4) ^ xled5) ^ xled7);
            end //if
        end //if
    end //always

endmodule // blinker01
