
# Loop constraints
directive set /fir/run/run:rlp CSTEPS_FROM {{. == 1}}
directive set /fir/run/run:rlp/main CSTEPS_FROM {{. == 2} {.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT CSTEPS_FROM {{. == 2} {.. == 1}}

# IO operation constraints
directive set /fir/run/run:rlp/main/addr:io_read(coeff_addr) CSTEPS_FROM {{.. == 0}}
directive set /fir/run/run:rlp/main/SHIFT/SHIFT:if:io_read(input) CSTEPS_FROM {{.. == 0}}
directive set /fir/run/run:rlp/main/io_write(output) CSTEPS_FROM {{.. == 1}}

# Sync operation constraints

# Real operation constraints
directive set /fir/run/run:rlp/main/SHIFT/SHIFT:else:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT/SHIFT:else:mux CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT/SHIFT:mux CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT/SHIFT:mux#1 CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT/SHIFT:mux#2 CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT/SHIFT:mux#3 CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT/SHIFT:mux#4 CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT/SHIFT:mux#5 CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT/SHIFT:mux#6 CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT/SHIFT:mux#7 CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT/SHIFT:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT/MAC:read_mem(coeffs:rsc.@) CSTEPS_FROM {{.. == 1}}
directive set /fir/run/run:rlp/main/SHIFT/MAC:mux CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/SHIFT/MAC:mul CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/SHIFT/MAC:acc#2 CSTEPS_FROM {{.. == 2}}
directive set /fir/run/run:rlp/main/SHIFT/MAC:acc#3 CSTEPS_FROM {{.. == 1}}

# Probe constraints
