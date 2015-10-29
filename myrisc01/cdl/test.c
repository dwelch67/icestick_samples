#include "tinyasm.c"

    START("test.cdl");

declare(loop_top);
declare(loop_done);
declare(outer);

    equ(LOOPS,10);
    lui(r3,0);
label(outer);
    addi(r1,r0,LOOPS);
    nand(r2,r0,r0);
label(loop_top);
    add(r1,r1,r2);
    beq(r1,r0,loop_done);
    beq(r0,r0,loop_top);
label(loop_done);
    addi(r3,r3,1);
    sw(r3,r0,31);
    beq(r0,r0,outer);
//    beq(r1,r1,outer);
    halt();
    END

