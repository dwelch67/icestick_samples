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

//a Module uart02
module uart02
(
    clk,

    PMOD4,

    RS232_Tx
);

    //b Clocks
    input clk;

    //b Inputs
    input PMOD4;

    //b Outputs
    output RS232_Tx;

// output components here

    //b Output combinatorials
    reg RS232_Tx;

    //b Output nets

    //b Internal and output registers
    reg [3:0]xstate;
    reg [7:0]uart_tx_buffer;
    reg uart_tx;
    reg [6:0]clock_divider;

    //b Internal combinatorials

    //b Internal nets

    //b Clock gating module instances
    //b Module instances
    //b the_code__comb combinatorial process
    always @( //the_code__comb
        uart_tx )
    begin: the_code__comb_code
        RS232_Tx = uart_tx;
    end //always

    //b the_code__posedge_clk_active_high_PMOD4 clock process
    always @( posedge clk or posedge PMOD4)
    begin : the_code__posedge_clk_active_high_PMOD4__code
        if (PMOD4==1'b1)
        begin
            clock_divider <= 7'h67;
            uart_tx <= 1'h1;
            xstate <= 4'h0;
            uart_tx_buffer <= 8'h56;
        end
        else
        begin
            if ((clock_divider!=7'h0))
            begin
                clock_divider <= (clock_divider-7'h1);
            end //if
            else
            begin
                clock_divider <= 7'h67;
                case (xstate) //synopsys parallel_case
                4'h0: // req 1
                    begin
                    uart_tx <= 1'h0;
                    xstate <= (xstate+4'h1);
                    end
                4'h9: // req 1
                    begin
                    uart_tx <= 1'h1;
                    uart_tx_buffer <= 8'h56;
                    xstate <= 4'h0;
                    end
                default: // req 1
                    begin
                    uart_tx <= uart_tx_buffer[0];
                    uart_tx_buffer[0] <= uart_tx_buffer[1];
                    uart_tx_buffer[1] <= uart_tx_buffer[2];
                    uart_tx_buffer[2] <= uart_tx_buffer[3];
                    uart_tx_buffer[3] <= uart_tx_buffer[4];
                    uart_tx_buffer[4] <= uart_tx_buffer[5];
                    uart_tx_buffer[5] <= uart_tx_buffer[6];
                    uart_tx_buffer[6] <= uart_tx_buffer[7];
                    uart_tx_buffer[7] <= 1'h0;
                    xstate <= (xstate+4'h1);
                    end
                endcase
            end //else
        end //if
    end //always

endmodule // uart02
