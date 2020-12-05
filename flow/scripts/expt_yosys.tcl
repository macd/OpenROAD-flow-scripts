# Yosys tcl script
hierarchy -top $::env(DESIGN_NAME)
# proc  # apparently the tcl proc is a different beast from the yosys shell proc
# The following is the expanded version of the Yosys "proc" command
proc_clean
proc_rmdead
proc_prune
proc_init
proc_arst
proc_mux
proc_dlatch
proc_dff
proc_clean

alumacc
maccmap
# if we want our own alu...
#techmap -map techmap_alu.v

flatten
opt_expr
opt_clean
check
opt -nodffe -nosdff
fsm
opt
wreduce
peepopt
opt_clean
alumacc
share
opt
memory -nomap
opt_clean
opt -fast -full
memory_map
opt -full
techmap
opt -fast
abc -fast
opt -fast
