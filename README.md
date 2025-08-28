# 8-Bit ALU Design Using Vivado

This repository contains the design and implementation of an 8-bit Arithmetic Logic Unit (ALU) using Verilog in Vivado. The project demonstrates various arithmetic and logical operations, organized into the following components:

## Repository Structure
- **Source Files**: Verilog modules for the ALU and its subcomponents.
- **Testbenches**: Verification files to test the functionality of the ALU.
- **Images**: Output waveforms and simulation results.

## ALU Operations
The ALU supports the following operations based on the 3-bit opcode:

| Opcode | Operation     | Description      |
|--------|---------------|------------------|
| 000    | `res = a + b` | Addition         |
| 001    | `res = a - b` | Subtraction      |
| 010    | `res = a & b` | Bitwise AND      |
| 011    | `res = a | b` | Bitwise OR       |
| 100    | `res = a ^ b` | Bitwise XOR      |
| 101    | `res = ~a`    | Bitwise NOT A    |
| 110    | `res = a + 1` | Increment A      |
| 111    | `res = a - 1` | Decrement A      |

## Submodules
The project includes the following Verilog modules:
1. **Full Adder**: Implements a 1-bit full adder.
2. **4-Bit Ripple Carry Adder**: Combines multiple full adders for 4-bit addition.
3. **8-Bit Adder-Subtractor**: Performs addition and subtraction for 8-bit inputs.
4. **8-Bit ALU**: Integrates all operations into a single module.

## Simulation Results
Below is an example of the output waveform for the ALU:

![ALU Waveform](/images/alu_wave.png)

## Tools Used
- **Vivado**: For design, simulation, and synthesis.
- **Verilog**: Hardware description language for module implementation.

This project serves as a foundational example for understanding ALU design and digital logic concepts.