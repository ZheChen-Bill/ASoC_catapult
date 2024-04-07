
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
directive set /top/fir/run/run:rlp/main CSTEPS_FROM {{. == 2} {.. == 0}}
directive set /top/fir/run/run:rlp/main/SHIFT CSTEPS_FROM {{. == 1} {.. == 1}}

# IO operation constraints
directive set /top/fir/run/run:rlp/main/SHIFT/SHIFT:if:io_read(input) CSTEPS_FROM {{.. == 0}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:asn#1 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:asn#2 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:asn#3 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:asn#4 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:asn#5 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:asn#6 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:asn#7 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:asn#8 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/io_write(output) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /top/fir/run/run:rlp/main/SHIFT/SHIFT:else:mux CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/SHIFT:mux CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/SHIFT:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/SHIFT:mux#2 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/SHIFT:mux#3 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/SHIFT:mux#4 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/SHIFT:mux#5 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/SHIFT:mux#6 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/SHIFT:mux#7 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/SHIFT:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:mux CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:mul CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/SHIFT/MAC:acc#2 CSTEPS_FROM {{.. == 1}}

# Probe constraints
