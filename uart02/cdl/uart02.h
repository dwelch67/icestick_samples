/*m Module core (from CDL module definition)
*/
extern module uart02(
clock clk,
input bit     PMOD4,
output bit     RS232_Tx
)
{
    timing from rising clock clk RS232_Tx;
}
