# IDATT2104-project
Voluntary final project for the Networkprogramming class.

## Requirements
- Icarus Verilog
- GTKWave

Install with:
```bash
sudo apt-get install iverilog gtkwave
```

## File structure

Each folder contains all the files to run each example.
1. Compile the files with `iverilog -g2012 -o <output> <input> <input> ...`, the files in each folder are the input files for each example.
2. Run the simulation with `vvp <output>`
3. View the simulation with `gtkwave <output>.vcd`
