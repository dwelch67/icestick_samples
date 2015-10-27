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

//a Module top
module top
(
    in_clock,

    in_reset,

    out_led
);

    //b Clocks
    input in_clock;

    //b Inputs
    input in_reset;

    //b Outputs
    output [7:0]out_led;

// output components here

    //b Output combinatorials
    reg [7:0]out_led;

    //b Output nets

    //b Internal and output registers

    //b Internal combinatorials

    //b Internal nets
    wire [15:0]net_out_data;
    wire [15:0]net_in_data;
    wire [15:0]net_address;
    wire net_write_enable;
    wire net_output_enable;
    wire net_mem_fetch;
    wire [7:0]net_led_out;

    //b Clock gating module instances
    //b Module instances
    csram mem(
        .in_data(net_in_data),
        .in_address(net_address),
        .in_write_enable(net_write_enable),
        .in_output_enable(net_output_enable),
        .out_data(            net_out_data)         );
    core core0(
        .clock_in(in_clock),
        .mem_in(net_out_data),
        .reset_in(in_reset),
        .led_out(            net_led_out),
        .mem_fetch(            net_mem_fetch),
        .mem_out(            net_in_data),
        .mem_add(            net_address),
        .mem_we(            net_write_enable),
        .mem_oe(            net_output_enable)         );
    //b top_code combinatorial process
    always @( //top_code
        net_led_out )
    begin: top_code__comb_code
        out_led = net_led_out;
    end //always

endmodule // top
