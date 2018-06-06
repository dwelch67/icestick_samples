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

//a Module blinker02
module blinker02
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
    reg [31:0]XCOUNT;

    //b Internal combinatorials

    //b Internal nets

    //b Clock gating module instances
    //b Module instances
    //b the_code__comb combinatorial process
    always @( //the_code__comb
        XCOUNT )
    begin: the_code__comb_code
        LED0 = XCOUNT[0];
        LED1 = XCOUNT[1];
        LED2 = XCOUNT[2];
        LED3 = XCOUNT[3];
        LED4 = XCOUNT[4];
        LED5 = XCOUNT[5];
        LED6 = XCOUNT[6];
        LED7 = XCOUNT[7];
    end //always

    //b the_code__posedge_clk_active_high_NOTRESET clock process
    always @( posedge clk or posedge NOTRESET)
    begin : the_code__posedge_clk_active_high_NOTRESET__code
        if (NOTRESET==1'b1)
        begin
            XCOUNT <= 32'h0;
        end
        else
        begin
            XCOUNT <= (XCOUNT+32'h1);
        end //if
    end //always

endmodule // blinker02
