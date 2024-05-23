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

# Video sources
### Information sources

- [Wikipedia: FPGA](https://en.wikipedia.org/wiki/Field-programmable_gate_array)
- [Wikipedia: ASIC](https://en.wikipedia.org/wiki/Application-specific_integrated_circuit)
- [Wikipedia: Turing Completeness](https://en.wikipedia.org/wiki/Turing_completeness)
- [Youtube: Whats an FPGA?](https://www.youtube.com/watch?v=iHg0mmIg0UU)
- [Youtube: LTT ASIC vs FPGA](https://www.youtube.com/watch?v=7Elgs5HzIbE&pp=ygUMYXNpYyB2cyBmcGdh)
- [Youtube: FPGA vs CPU](https://www.youtube.com/watch?v=BML1YHZpx2o)
- [Wevolver: ASIC vs FPGA](https://www.wevolver.com/article/asic-vs-fpga)
- [ESA: FPGAs in space](https://www.esa.int/Enabling_Support/Space_Engineering_Technology/Microelectronics/The_use_of_reprogrammable_FPGAs_in_space)
- [DOULOS: What is Verilog?](https://www.doulos.com/knowhow/verilog/what-is-verilog/)

### Scientific articles

- [IEEE: 754-2019](https://ieeexplore.ieee.org/document/8766229)
- [IEEE: ASIC VDF acceleration](https://ieeexplore.ieee.org/abstract/document/9289016)
- [ACM: FPGA CNN](https://dl.acm.org/doi/abs/10.1145/2847263.2847265)