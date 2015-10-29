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

//a Module myrisc16
module myrisc16
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
    reg [15:0]inst;
    reg [15:0]pc;
    reg [15:0]reg__value[7:0];
    reg [15:0]mem__value[15:0];
    reg [1:0]xstate;
    reg [7:0]XCOUNT;

    //b Internal combinatorials
    reg [15:0]memadd;
    reg [9:0]imm10;
    reg [15:0]simm7;
    reg [2:0]regc;
    reg [2:0]regb;
    reg [2:0]rega;
    reg [2:0]opcode;
    reg [1:0]xstate_next;

    //b Internal nets

    //b Clock gating module instances
    //b Module instances
    //b top_code__comb combinatorial process
    always @( //top_code__comb
        mem__value[0] or
        mem__value[1] or
        mem__value[2] or
        mem__value[3] or
        mem__value[4] or
        mem__value[5] or
        mem__value[6] or
        mem__value[7] or
        mem__value[8] or
        mem__value[9] or
        mem__value[10] or
        mem__value[11] or
        mem__value[12] or
        mem__value[13] or
        mem__value[14] or
        mem__value[15]        //mem__value - Xilinx does not want arrays in sensitivity lists
 or
        inst or
        xstate or
        reg__value[0] or
        reg__value[1] or
        reg__value[2] or
        reg__value[3] or
        reg__value[4] or
        reg__value[5] or
        reg__value[6] or
        reg__value[7]        //reg__value - Xilinx does not want arrays in sensitivity lists
 )
    begin: top_code__comb_code
    reg [15:0]simm7__var;
    reg [1:0]xstate_next__var;
    reg [15:0]memadd__var;
        out_led = mem__value[15][7:0];
        opcode = inst[15:13];
        rega = inst[12:10];
        regb = inst[9:7];
        regc = inst[2:0];
        if ((inst[6]==1'h0))
        begin
            simm7__var = {9'h0,inst[6:0]};
        end //if
        else
        begin
            simm7__var = {9'h1ff,inst[6:0]};
        end //else
        imm10 = inst[9:0];
        xstate_next__var = 2'h3;
        case (xstate) //synopsys parallel_case
        2'h0: // req 1
            begin
            xstate_next__var = 2'h1;
            end
        2'h1: // req 1
            begin
            xstate_next__var = 2'h2;
            end
        2'h2: // req 1
            begin
            xstate_next__var = 2'h1;
            case (opcode) //synopsys parallel_case
            3'h0: // req 1
                begin
                end
            3'h1: // req 1
                begin
                end
            3'h2: // req 1
                begin
                end
            3'h3: // req 1
                begin
                end
            3'h4: // req 1
                begin
                memadd__var = (reg__value[regb]+simm7__var);
                end
            3'h5: // req 1
                begin
                memadd__var = (reg__value[regb]+simm7__var);
                end
            3'h6: // req 1
                begin
                end
            default: // req 1
                begin
                if ((inst[6:0]!=7'h0))
                begin
                    xstate_next__var = 2'h3;
                end //if
                end
            endcase
            end
        default: // req 1
            begin
            xstate_next__var = 2'h3;
            end
        endcase
        simm7 = simm7__var;
        xstate_next = xstate_next__var;
        memadd = memadd__var;
    end //always

    //b top_code__posedge_in_clock_active_high_in_reset clock process
    always @( posedge in_clock or posedge in_reset)
    begin : top_code__posedge_in_clock_active_high_in_reset__code
        if (in_reset==1'b1)
        begin
            XCOUNT <= 8'h0;
            pc <= 16'h0;
            reg__value[0] <= 16'h0;
            reg__value[1] <= 16'h0;
            reg__value[2] <= 16'h0;
            reg__value[3] <= 16'h0;
            reg__value[4] <= 16'h0;
            reg__value[5] <= 16'h0;
            reg__value[6] <= 16'h0;
            reg__value[7] <= 16'h0;
            mem__value[0] <= 16'hffff;
            mem__value[1] <= 16'hffff;
            mem__value[2] <= 16'hffff;
            mem__value[3] <= 16'hffff;
            mem__value[4] <= 16'hffff;
            mem__value[5] <= 16'hffff;
            mem__value[6] <= 16'hffff;
            mem__value[7] <= 16'hffff;
            mem__value[8] <= 16'hffff;
            mem__value[9] <= 16'hffff;
            mem__value[10] <= 16'hffff;
            mem__value[11] <= 16'hffff;
            mem__value[12] <= 16'hffff;
            mem__value[13] <= 16'hffff;
            mem__value[14] <= 16'hffff;
            mem__value[15] <= 16'hffff;
            inst <= 16'h0;
            xstate <= 2'h0;
        end
        else
        begin
            XCOUNT <= (XCOUNT+8'h1);
            case (xstate) //synopsys parallel_case
            2'h0: // req 1
                begin
                pc <= 16'h0;
                reg__value[0] <= 16'h0;
                reg__value[1] <= 16'h1;
                reg__value[2] <= 16'h2;
                reg__value[3] <= 16'h3;
                reg__value[4] <= 16'h4;
                reg__value[5] <= 16'h5;
                reg__value[6] <= 16'h6;
                reg__value[7] <= 16'h7;
                mem__value[0] <= 16'h6c00;
                mem__value[1] <= 16'h240a;
                mem__value[2] <= 16'h4800;
                mem__value[3] <= 16'h482;
                mem__value[4] <= 16'hc401;
                mem__value[5] <= 16'hc07d;
                mem__value[6] <= 16'h2d81;
                mem__value[7] <= 16'h8c1f;
                mem__value[8] <= 16'hc078;
                mem__value[9] <= 16'hffff;
                mem__value[10] <= 16'hffff;
                mem__value[11] <= 16'hffff;
                mem__value[12] <= 16'hffff;
                mem__value[13] <= 16'hffff;
                mem__value[14] <= 16'hffff;
                mem__value[15] <= 16'hffff;
                end
            2'h1: // req 1
                begin
                inst <= mem__value[pc[3:0]];
                pc <= (pc+16'h1);
                end
            2'h2: // req 1
                begin
                case (opcode) //synopsys parallel_case
                3'h0: // req 1
                    begin
                    reg__value[rega] <= (reg__value[regb]+reg__value[regc]);
                    end
                3'h1: // req 1
                    begin
                    reg__value[rega] <= (reg__value[regb]+simm7);
                    end
                3'h2: // req 1
                    begin
                    reg__value[rega] <= ~(reg__value[regb] & reg__value[regc]);
                    end
                3'h3: // req 1
                    begin
                    reg__value[rega] <= {imm10,6'h0};
                    end
                3'h4: // req 1
                    begin
                    mem__value[memadd[3:0]] <= reg__value[rega];
                    end
                3'h5: // req 1
                    begin
                    reg__value[rega] <= mem__value[memadd[3:0]];
                    end
                3'h6: // req 1
                    begin
                    if ((reg__value[rega]==reg__value[regb]))
                    begin
                        pc <= (pc+simm7);
                    end //if
                    end
                default: // req 1
                    begin
                    reg__value[rega] <= pc;
                    pc <= reg__value[regb];
                    end
                endcase
                end
            default: // req 1
                begin
                end
            endcase
            xstate <= xstate_next;
            reg__value[0] <= 16'h0;
        end //if
    end //always

endmodule // myrisc16
