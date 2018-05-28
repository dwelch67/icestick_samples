/*m Module ired01 (from CDL module definition)
*/
extern module ired01(
clock clk,
input bit     PMOD4,
input bit     PMOD3,
input bit     PMOD2,
input bit     PMOD1,
input bit     IRRXD,
output bit     IRTXD,
output bit     IRSD,
output bit     LED5,
output bit     LED4,
output bit     LED3,
output bit     LED2,
output bit     LED1
)
{
    timing comb input IRRXD;
    timing comb output LED3;
    timing from rising clock clk IRTXD;
    timing from rising clock clk LED1;
}
