
# Loop constraints
directive set /top/decimator/run/run:rlp CSTEPS_FROM {{. == 1}}
directive set /top/decimator/run/run:rlp/main CSTEPS_FROM {{. == 2} {.. == 1}}

# IO operation constraints
directive set /top/decimator/run/run:rlp/main/temp:io_read(din) CSTEPS_FROM {{.. == 0}}
directive set /top/decimator/run/run:rlp/main/if#1:io_write(dout) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /top/decimator/run/run:rlp/main/and CSTEPS_FROM {{.. == 1}}
directive set /top/decimator/run/run:rlp/main/acc CSTEPS_FROM {{.. == 1}}

# Probe constraints

# Loop constraints
directive set /top/fir/run/run:rlp CSTEPS_FROM {{. == 0}}
directive set /top/fir/run/run:rlp/main CSTEPS_FROM {{. == 3} {.. == 0}}

# IO operation constraints
directive set /top/fir/run/run:rlp/main/main-1:SHIFT:if:io_read(input) CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#1 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#2 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#3 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#4 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#5 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#6 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#7 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/main-1:io_write(output) CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/main-2:SHIFT:if:io_read(input) CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#8 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/MAC:asn#9 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/MAC:asn#10 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/MAC:asn#11 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/MAC:asn#12 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/MAC:asn#13 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/MAC:asn#14 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/MAC:asn#15 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/main-2:io_write(output) CSTEPS_FROM {{.. == 2}}

# Sync operation constraints

# Real operation constraints
directive set /top/fir/run/run:rlp/main/SHIFT:SHIFT:and CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#2 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:SHIFT:and#3 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:else:mux CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#4 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#5 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#6 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#7 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#8 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#9 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#10 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#11 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/main-1:SHIFT:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:mux CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:mux#1 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/main-1:MAC:mul CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/main-1:MAC:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/main-1:MAC:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:SHIFT:and#4 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/SHIFT:else:mux#14 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#20 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#21 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#22 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#23 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#24 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#25 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#26 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#27 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/main-2:SHIFT:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:mux#2 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/MAC:mux#3 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/main-2:MAC:mul CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/main-2:MAC:acc#1 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/main-2:MAC:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:SHIFT:and#5 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:SHIFT:mux1h CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#33 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#34 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#35 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#36 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#37 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#38 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#39 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#40 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#41 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:SHIFT:mux1h#1 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:SHIFT:mux1h#2 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#44 CSTEPS_FROM {{.. == 2}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#45 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT:mux#46 CSTEPS_FROM {{.. == 1}}

# Probe constraints
