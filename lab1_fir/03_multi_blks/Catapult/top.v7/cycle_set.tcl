
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
directive set /top/fir/run/run:rlp CSTEPS_FROM {{. == 1}}
directive set /top/fir/run/run:rlp/main CSTEPS_FROM {{. == 2} {.. == 1}}

# IO operation constraints
directive set /top/fir/run/run:rlp/main/SHIFT-8:if:io_read(input) CSTEPS_FROM {{.. == 0}}
directive set /top/fir/run/run:rlp/main/MAC:asn CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#2 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#3 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#5 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#7 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#9 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#11 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:asn#13 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/io_write(output) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /top/fir/run/run:rlp/main/MAC-7:mul CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC-8:mul CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC-5:mul CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC-6:mul CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:acc#8 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC-3:mul CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC-4:mul CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC-1:mul CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC-2:mul CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:acc#7 CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC:acc CSTEPS_FROM {{.. == 1}}
directive set /top/fir/run/run:rlp/main/MAC-8:acc#1 CSTEPS_FROM {{.. == 1}}

# Probe constraints
