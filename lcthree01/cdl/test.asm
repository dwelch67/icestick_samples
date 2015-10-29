
outer:
not r0,r1
and r0,r1,#0
add r0,r0,#7
inner:
add r0,r0,#0xFFFF
brnp inner
trap 0x30
brnzp outer
