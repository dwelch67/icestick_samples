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

//a Module ired01
module ired01
(
    clk,

    PMOD4,
    PMOD3,
    PMOD2,
    PMOD1,
    IRRXD,

    IRTXD,
    IRSD,
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
    input IRRXD;

    //b Outputs
    output IRTXD;
    output IRSD;
    output LED5;
    output LED4;
    output LED3;
    output LED2;
    output LED1;

// output components here

    //b Output combinatorials
    reg IRTXD;
    reg IRSD;
    reg LED5;
    reg LED4;
    reg LED3;
    reg LED2;
    reg LED1;

    //b Output nets

    //b Internal and output registers
    reg [9:0]state;
    reg [5:0]databit;
    reg [31:0]data;
    reg [3:0]rep;
    reg [8:0]div;
    reg [31:0]ICOUNT;
    reg LEDOUT;
    reg [31:0]XCOUNT;

    //b Internal combinatorials

    //b Internal nets

    //b Clock gating module instances
    //b Module instances
    //b the_code__comb combinatorial process
    always @( //the_code__comb
        LEDOUT or
        IRRXD )
    begin: the_code__comb_code
        LED1 = LEDOUT;
        LED2 = 1'h0;
        LED3 = ~IRRXD;
        LED4 = 1'h0;
        LED5 = 1'h0;
        IRSD = 1'h0;
        IRTXD = LEDOUT;
    end //always

    //b the_code__posedge_clk_active_high_PMOD4 clock process
    always @( posedge clk or posedge PMOD4)
    begin : the_code__posedge_clk_active_high_PMOD4__code
        if (PMOD4==1'b1)
        begin
            data <= 32'h10af40bf;
            XCOUNT <= 32'h0;
            div <= 9'h0;
            ICOUNT <= 32'h0;
            state <= 10'h0;
            databit <= 6'h1f;
            LEDOUT <= 1'h0;
            rep <= 4'h0;
        end
        else
        begin
            data <= 32'h10af40bf;
            XCOUNT <= (XCOUNT+32'h1);
            if ((div==9'h13b))
            begin
                div <= 9'h0;
                ICOUNT <= (ICOUNT+32'h1);
            end //if
            else
            begin
                div <= (div+9'h1);
            end //else
            case (state) //synopsys parallel_case
            10'h0: // req 1
                begin
                ICOUNT <= 32'h0;
                div <= 9'h0;
                state <= 10'h1;
                databit <= 6'h1f;
                end
            10'h1: // req 1
                begin
                LEDOUT <= ICOUNT[0];
                if ((ICOUNT==32'h140))
                begin
                    ICOUNT <= 32'h0;
                    state <= 10'h2;
                end //if
                end
            10'h2: // req 1
                begin
                LEDOUT <= 1'h0;
                if ((ICOUNT==32'ha0))
                begin
                    ICOUNT <= 32'h0;
                    state <= 10'h3;
                end //if
                end
            10'h3: // req 1
                begin
                LEDOUT <= ICOUNT[0];
                if ((ICOUNT==32'h14))
                begin
                    ICOUNT <= 32'h0;
                    if ((data[databit]==1'h0))
                    begin
                        state <= 10'h4;
                    end //if
                    else
                    begin
                        state <= 10'h5;
                    end //else
                end //if
                end
            10'h4: // req 1
                begin
                LEDOUT <= 1'h0;
                if ((ICOUNT==32'h14))
                begin
                    ICOUNT <= 32'h0;
                    if ((databit==6'h0))
                    begin
                        state <= 10'h6;
                    end //if
                    else
                    begin
                        databit <= (databit-6'h1);
                        state <= 10'h3;
                    end //else
                end //if
                end
            10'h5: // req 1
                begin
                LEDOUT <= 1'h0;
                if ((ICOUNT==32'h28))
                begin
                    ICOUNT <= 32'h0;
                    if ((databit==6'h0))
                    begin
                        state <= 10'h6;
                    end //if
                    else
                    begin
                        databit <= (databit-6'h1);
                        state <= 10'h3;
                    end //else
                end //if
                end
            10'h6: // req 1
                begin
                if ((rep==4'h3))
                begin
                end //if
                else
                begin
                    ICOUNT <= 32'h0;
                    state <= 10'h7;
                end //else
                end
            10'h7: // req 1
                begin
                if ((ICOUNT==32'h3e8))
                begin
                    rep <= (rep+4'h1);
                    state <= 10'h0;
                end //if
                end
            default: // req 1
                begin
                end
            endcase
        end //if
    end //always

endmodule // ired01
