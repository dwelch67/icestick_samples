
outer:
not r0,r1
and r0,r1,#0
not r0,r0
inner:
add r0,r0,#0xFFFF
brnp inner
trap 0x25
brnzp outer
