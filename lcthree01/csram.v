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

//a Module csram
module csram
(

    in_data,
    in_address,
    in_write_enable,
    in_output_enable,

    out_data
);

    //b Clocks

    //b Inputs
    input [15:0]in_data;
    input [15:0]in_address;
    input in_write_enable;
    input in_output_enable;

    //b Outputs
    output [15:0]out_data;

// output components here

    //b Output combinatorials
    reg [15:0]out_data;

    //b Output nets

    //b Internal and output registers

    //b Internal combinatorials

    //b Internal nets

    //b Clock gating module instances
    //b Module instances
    //b sram_code combinatorial process
    always @( //sram_code
        in_output_enable or
        in_address or
        in_write_enable or
        in_data )
    begin: sram_code__comb_code
    reg [15:0]out_data__var;
        out_data__var = 16'hffff;
        if ((in_output_enable==1'h1))
        begin
            case (in_address) //synopsys parallel_case
            16'h3000: // req 1
                begin
                out_data__var = 16'h9040;
                end
            16'h3001: // req 1
                begin
                out_data__var = 16'h5060;
                end
            16'h3002: // req 1
                begin
                out_data__var = 16'h1027;
                end
            16'h3003: // req 1
                begin
                out_data__var = 16'h103f;
                end
            16'h3004: // req 1
                begin
                out_data__var = 16'hbfe;
                end
            16'h3005: // req 1
                begin
                out_data__var = 16'hf030;
                end
            16'h3006: // req 1
                begin
                out_data__var = 16'hff9;
                end
            default: // req 1
                begin
                out_data__var = 16'hffff;
                end
            endcase
        end //if
        if ((in_write_enable==1'h1))
        begin
            out_data__var = in_data;
        end //if
        out_data = out_data__var;
    end //always

endmodule // csram
