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

    PMOD4,
    PMOD3,
    PMOD2,
    PMOD1,

    RS232_Tx,
    LED5,
    LED4,
    LED3,
    LED2,
    LED1
);

    //b Clocks
    input clk;

    //b Inputs
    input PMOD4;
    input PMOD3;
    input PMOD2;
    input PMOD1;

    //b Outputs
    output RS232_Tx;
    output LED5;
    output LED4;
    output LED3;
    output LED2;
    output LED1;

// output components here

    //b Output combinatorials
    reg RS232_Tx;
    reg LED5;
    reg LED4;
    reg LED3;
    reg LED2;
    reg LED1;

    //b Output nets

    //b Internal and output registers
    reg UARTTX;
    reg [7:0]UCOUNT;
    reg [31:0]XCOUNT;

    //b Internal combinatorials

    //b Internal nets

    //b Clock gating module instances
    //b Module instances
    //b the_code__comb combinatorial process
    always @( //the_code__comb
        XCOUNT or
        UARTTX )
    begin: the_code__comb_code
        LED1 = XCOUNT[23];
        LED2 = XCOUNT[23];
        LED3 = XCOUNT[23];
        LED4 = XCOUNT[23];
        LED5 = XCOUNT[23];
        RS232_Tx = UARTTX;
    end //always

    //b the_code__posedge_clk_active_high_PMOD4 clock process
    always @( posedge clk or posedge PMOD4)
    begin : the_code__posedge_clk_active_high_PMOD4__code
        if (PMOD4==1'b1)
        begin
            XCOUNT <= 32'h0;
            UCOUNT <= 8'h0;
            UARTTX <= 1'h0;
        end
        else
        begin
            XCOUNT <= (XCOUNT+32'h1);
            if ((UCOUNT==8'h67))
            begin
                UCOUNT <= 8'h0;
                UARTTX <= (UARTTX+1'h1);
            end //if
            else
            begin
                UCOUNT <= (UCOUNT+8'h1);
            end //else
        end //if
    end //always

endmodule // blinker01
