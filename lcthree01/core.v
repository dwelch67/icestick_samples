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

//a Module core
module core
(
    clock_in,

    mem_in,
    reset_in,

    led_out,
    mem_fetch,
    mem_we,
    mem_oe,
    mem_add,
    mem_out
);

    //b Clocks
    input clock_in;

    //b Inputs
    input [15:0]mem_in;
    input reset_in;

    //b Outputs
    output [7:0]led_out;
    output mem_fetch;
    output mem_we;
    output mem_oe;
    output [15:0]mem_add;
    output [15:0]mem_out;

// output components here

    //b Output combinatorials
    reg [7:0]led_out;
    reg mem_fetch;
    reg mem_we;
    reg mem_oe;
    reg [15:0]mem_add;
    reg [15:0]mem_out;

    //b Output nets

    //b Internal and output registers
    reg [15:0]psr;
    reg [15:0]pc;
    reg [15:0]reg__value[7:0];
    reg [1:0]xstate;
    reg [15:0]inst;
    reg [7:0]led;

    //b Internal combinatorials
    reg [2:0]xsr2;
    reg [2:0]xsr1;
    reg [2:0]xdr;
    reg [7:0]trap;
    reg [15:0]op_res;
    reg [15:0]op_b;
    reg [15:0]op_a;
    reg [1:0]xstate_next;
    reg [15:0]pc_next;

    //b Internal nets

    //b Clock gating module instances
    //b Module instances
    //b the_code__comb combinatorial process
    always @( //the_code__comb
        xstate or
        inst or
        pc or
        reg__value[0] or
        reg__value[1] or
        reg__value[2] or
        reg__value[3] or
        reg__value[4] or
        reg__value[5] or
        reg__value[6] or
        reg__value[7]        //reg__value - Xilinx does not want arrays in sensitivity lists
 or
        psr or
        mem_in or
        led )
    begin: the_code__comb_code
    reg mem_oe__var;
    reg mem_we__var;
    reg [15:0]mem_add__var;
    reg [15:0]mem_out__var;
    reg mem_fetch__var;
    reg [2:0]xdr__var;
    reg [2:0]xsr1__var;
    reg [2:0]xsr2__var;
    reg [15:0]op_a__var;
    reg [15:0]op_b__var;
    reg [15:0]op_res__var;
    reg [7:0]trap__var;
    reg [1:0]xstate_next__var;
        pc_next = 16'h0;
        mem_oe__var = 1'h0;
        mem_we__var = 1'h0;
        mem_add__var = 16'h0;
        mem_out__var = 16'h0;
        mem_fetch__var = 1'h0;
        xdr__var = 3'h0;
        xsr1__var = 3'h0;
        xsr2__var = 3'h0;
        op_a__var = 16'h0;
        op_b__var = 16'h0;
        op_res__var = 16'h0;
        trap__var = 8'h0;
        led_out = led;
        case (xstate) //synopsys parallel_case
        2'h0: // req 1
            begin
            xstate_next__var = 2'h1;
            end
        2'h1: // req 1
            begin
            xstate_next__var = 2'h2;
            mem_oe__var = 1'h1;
            mem_fetch__var = 1'h1;
            mem_add__var = pc;
            end
        2'h2: // req 1
            begin
            xstate_next__var = 2'h1;
            case (inst[15:12]) //synopsys parallel_case
            4'h1: // req 1
                begin
                if ((inst[5]==1'h0))
                begin
                    xdr__var = inst[11:9];
                    xsr1__var = inst[8:6];
                    xsr2__var = inst[2:0];
                    op_a__var = reg__value[xsr1__var];
                    op_b__var = reg__value[xsr2__var];
                end //if
                else
                begin
                    xdr__var = inst[11:9];
                    xsr1__var = inst[8:6];
                    op_a__var = reg__value[xsr1__var];
                    if ((inst[4]==1'h0))
                    begin
                        op_b__var = {11'h0,inst[4:0]};
                    end //if
                    else
                    begin
                        op_b__var = {11'h7ff,inst[4:0]};
                    end //else
                end //else
                op_res__var = (op_a__var+op_b__var);
                end
            4'h5: // req 1
                begin
                if ((inst[5]==1'h0))
                begin
                    xdr__var = inst[11:9];
                    xsr1__var = inst[8:6];
                    xsr2__var = inst[2:0];
                    op_a__var = reg__value[xsr1__var];
                    op_b__var = reg__value[xsr2__var];
                end //if
                else
                begin
                    xdr__var = inst[11:9];
                    xsr1__var = inst[8:6];
                    op_a__var = reg__value[xsr1__var];
                    if ((inst[4]==1'h0))
                    begin
                        op_b__var = {11'h0,inst[4:0]};
                    end //if
                    else
                    begin
                        op_b__var = {11'h7ff,inst[4:0]};
                    end //else
                end //else
                op_res__var = (op_a__var & op_b__var);
                end
            4'h0: // req 1
                begin
                if (((inst[11:9] & psr[2:0])!=3'h0))
                begin
                    op_a__var = pc;
                    if ((inst[8]==1'h0))
                    begin
                        op_b__var = {7'h0,inst[8:0]};
                    end //if
                    else
                    begin
                        op_b__var = {7'h7f,inst[8:0]};
                    end //else
                    op_res__var = (op_a__var+op_b__var);
                end //if
                end
            4'hc: // req 1
                begin
                xsr1__var = inst[8:6];
                end
            4'h4: // req 1
                begin
                if ((inst[11]==1'h1))
                begin
                    op_a__var = pc;
                    if ((inst[10]==1'h0))
                    begin
                        op_b__var = {5'h0,inst[10:0]};
                    end //if
                    else
                    begin
                        op_b__var = {5'h1f,inst[10:0]};
                    end //else
                    op_res__var = (op_a__var+op_b__var);
                end //if
                else
                begin
                    xsr1__var = inst[8:6];
                end //else
                end
            4'h2: // req 1
                begin
                xdr__var = inst[11:9];
                op_a__var = pc;
                if ((inst[8]==1'h0))
                begin
                    op_b__var = {7'h0,inst[8:0]};
                end //if
                else
                begin
                    op_b__var = {7'h7f,inst[8:0]};
                end //else
                mem_add__var = (op_a__var+op_b__var);
                mem_oe__var = 1'h1;
                op_res__var = mem_in;
                end
            4'h6: // req 1
                begin
                xdr__var = inst[11:9];
                xsr1__var = inst[8:6];
                op_a__var = reg__value[xsr1__var];
                if ((inst[5]==1'h0))
                begin
                    op_b__var = {10'h0,inst[5:0]};
                end //if
                else
                begin
                    op_b__var = {10'h3ff,inst[5:0]};
                end //else
                mem_add__var = (op_a__var+op_b__var);
                mem_oe__var = 1'h1;
                op_res__var = mem_in;
                end
            4'he: // req 1
                begin
                xdr__var = inst[11:9];
                op_a__var = pc;
                if ((inst[8]==1'h0))
                begin
                    op_b__var = {7'h0,inst[8:0]};
                end //if
                else
                begin
                    op_b__var = {7'h7f,inst[8:0]};
                end //else
                op_res__var = (op_a__var+op_b__var);
                end
            4'h9: // req 1
                begin
                xdr__var = inst[11:9];
                xsr1__var = inst[8:6];
                op_a__var = reg__value[xsr1__var];
                op_res__var = ~op_a__var;
                end
            4'h3: // req 1
                begin
                xdr__var = inst[11:9];
                op_a__var = pc;
                if ((inst[8]==1'h0))
                begin
                    op_b__var = {7'h0,inst[8:0]};
                end //if
                else
                begin
                    op_b__var = {7'h7f,inst[8:0]};
                end //else
                mem_add__var = (op_a__var+op_b__var);
                mem_we__var = 1'h1;
                mem_out__var = reg__value[xdr__var];
                end
            4'h7: // req 1
                begin
                xdr__var = inst[11:9];
                xsr1__var = inst[8:6];
                op_a__var = reg__value[xsr1__var];
                if ((inst[5]==1'h0))
                begin
                    op_b__var = {10'h0,inst[5:0]};
                end //if
                else
                begin
                    op_b__var = {10'h3ff,inst[5:0]};
                end //else
                mem_add__var = (op_a__var+op_b__var);
                mem_we__var = 1'h1;
                mem_out__var = reg__value[xdr__var];
                end
            4'hf: // req 1
                begin
                trap__var = inst[7:0];
                if ((trap__var==8'h25))
                begin
                    xstate_next__var = 2'h3;
                end //if
                end
            default: // req 1
                begin
                xstate_next__var = 2'h3;
                end
            endcase
            end
        default: // req 1
            begin
            xstate_next__var = 2'h3;
            mem_add__var = 16'hffff;
            end
        endcase
        mem_oe = mem_oe__var;
        mem_we = mem_we__var;
        mem_add = mem_add__var;
        mem_out = mem_out__var;
        mem_fetch = mem_fetch__var;
        xdr = xdr__var;
        xsr1 = xsr1__var;
        xsr2 = xsr2__var;
        op_a = op_a__var;
        op_b = op_b__var;
        op_res = op_res__var;
        trap = trap__var;
        xstate_next = xstate_next__var;
    end //always

    //b the_code__posedge_clock_in_active_high_reset_in clock process
    always @( posedge clock_in or posedge reset_in)
    begin : the_code__posedge_clock_in_active_high_reset_in__code
        if (reset_in==1'b1)
        begin
            pc <= 16'h3000;
            reg__value[0] <= 16'h0;
            reg__value[1] <= 16'h0;
            reg__value[2] <= 16'h0;
            reg__value[3] <= 16'h0;
            reg__value[4] <= 16'h0;
            reg__value[5] <= 16'h0;
            reg__value[6] <= 16'h0;
            reg__value[7] <= 16'h0;
            inst <= 16'hffff;
            psr <= 16'h0;
            led <= 8'h0;
            xstate <= 2'h0;
        end
        else
        begin
            case (xstate) //synopsys parallel_case
            2'h0: // req 1
                begin
                pc <= 16'h3000;
                reg__value[0] <= 16'h0;
                reg__value[1] <= 16'h1;
                reg__value[2] <= 16'h2;
                reg__value[3] <= 16'h3;
                reg__value[4] <= 16'h0;
                reg__value[5] <= 16'h0;
                reg__value[6] <= 16'h0;
                reg__value[7] <= 16'h0;
                end
            2'h1: // req 1
                begin
                pc <= (pc+16'h1);
                inst <= mem_in;
                end
            2'h2: // req 1
                begin
                inst <= inst;
                case (inst[15:12]) //synopsys parallel_case
                4'h1: // req 1
                    begin
                    if ((op_res[15]==1'h0))
                    begin
                        if ((op_res==16'h0))
                        begin
                            psr[2:0] <= 3'h2;
                        end //if
                        else
                        begin
                            psr[2:0] <= 3'h1;
                        end //else
                    end //if
                    else
                    begin
                        psr[2:0] <= 3'h4;
                    end //else
                    reg__value[xdr] <= op_res[15:0];
                    end
                4'h5: // req 1
                    begin
                    if ((op_res[15]==1'h0))
                    begin
                        if ((op_res==16'h0))
                        begin
                            psr[2:0] <= 3'h2;
                        end //if
                        else
                        begin
                            psr[2:0] <= 3'h1;
                        end //else
                    end //if
                    else
                    begin
                        psr[2:0] <= 3'h4;
                    end //else
                    reg__value[xdr] <= op_res[15:0];
                    end
                4'h0: // req 1
                    begin
                    if (((inst[11:9] & psr[2:0])!=3'h0))
                    begin
                        pc <= op_res;
                    end //if
                    end
                4'hc: // req 1
                    begin
                    pc <= reg__value[xsr1];
                    end
                4'h4: // req 1
                    begin
                    reg__value[7] <= pc;
                    if ((inst[11]==1'h1))
                    begin
                        pc <= op_res;
                    end //if
                    else
                    begin
                        pc <= reg__value[xsr1];
                    end //else
                    end
                4'h2: // req 1
                    begin
                    if ((op_res[15]==1'h0))
                    begin
                        if ((op_res==16'h0))
                        begin
                            psr[2:0] <= 3'h2;
                        end //if
                        else
                        begin
                            psr[2:0] <= 3'h1;
                        end //else
                    end //if
                    else
                    begin
                        psr[2:0] <= 3'h4;
                    end //else
                    reg__value[xdr] <= op_res;
                    end
                4'h6: // req 1
                    begin
                    if ((op_res[15]==1'h0))
                    begin
                        if ((op_res==16'h0))
                        begin
                            psr[2:0] <= 3'h2;
                        end //if
                        else
                        begin
                            psr[2:0] <= 3'h1;
                        end //else
                    end //if
                    else
                    begin
                        psr[2:0] <= 3'h4;
                    end //else
                    reg__value[xdr] <= op_res;
                    end
                4'he: // req 1
                    begin
                    if ((op_res[15]==1'h0))
                    begin
                        if ((op_res==16'h0))
                        begin
                            psr[2:0] <= 3'h2;
                        end //if
                        else
                        begin
                            psr[2:0] <= 3'h1;
                        end //else
                    end //if
                    else
                    begin
                        psr[2:0] <= 3'h4;
                    end //else
                    reg__value[xdr] <= op_res;
                    end
                4'h9: // req 1
                    begin
                    if ((op_res[15]==1'h0))
                    begin
                        if ((op_res==16'h0))
                        begin
                            psr[2:0] <= 3'h2;
                        end //if
                        else
                        begin
                            psr[2:0] <= 3'h1;
                        end //else
                    end //if
                    else
                    begin
                        psr[2:0] <= 3'h4;
                    end //else
                    reg__value[xdr] <= op_res[15:0];
                    end
                4'h3: // req 1
                    begin
                    end
                4'h7: // req 1
                    begin
                    end
                4'hf: // req 1
                    begin
                    if ((trap==8'h30))
                    begin
                        led <= (led+8'h1);
                    end //if
                    end
                default: // req 1
                    begin
                    end
                endcase
                end
            default: // req 1
                begin
                inst <= inst;
                pc <= 16'hffff;
                end
            endcase
            xstate <= xstate_next;
        end //if
    end //always

endmodule // core
