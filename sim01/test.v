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

//a Module test
module test
(
    clk,

    reset_n,

    x_out
);

    //b Clocks
    input clk;

    //b Inputs
    input reset_n;

    //b Outputs
    output x_out;

// output components here

    //b Output combinatorials
    reg x_out;

    //b Output nets

    //b Internal and output registers
    reg x;
    reg [31:0]counter;

    //b Internal combinatorials

    //b Internal nets

    //b Clock gating module instances
    //b Module instances
    //b the_code__comb combinatorial process
    always @( //the_code__comb
        x )
    begin: the_code__comb_code
        x_out = x;
    end //always

    //b the_code__posedge_clk_active_low_reset_n clock process
    always @( posedge clk )
    begin : the_code__posedge_clk_active_low_reset_n__code
        if (reset_n==1'b0)
        begin
            counter <= 32'h0;
            x <= 1'h0;
        end
        else
        begin
            counter <= (counter+32'h1);
            x <= counter[4];
        end //if
    end //always

endmodule // test
