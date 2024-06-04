# Verilog-Processor-design

This repository serves as a comprehensive resource for the Digital Systems course offered at IIT Gandhinagar. It contains Verilog code implementations and corresponding test benches for various topics covered in the course. All codes are written in Vivado™ ML 2023.2 version.

## Topics Covered
- K Maps
- Adders and subtractors
- Comparators
- Flip-Flops 
- Counters (Synchronous, Asynchronous and Johnson ring counter)
- Shift Registers
- Finite State Machines (Moore and Mealy FSMs)
- Hazards
- FPGA Implementation
- CPU Design

## Highlight: CPU Design
The most recent and significant addition to this repository is the design and implementation of a CPU. Below is a brief overview of the CPU's architecture and instruction set:

### CPU Description:
The CPU consists of a register file with 16 registers, each 8 bits wide. It executes instructions with a one-clock cycle delay and employs an accumulator for arithmetic operations. Additionally, it utilizes an 8-bit extended register during multiplication and division operations, and a carry/borrow register for addition and subtraction.

### Note:
- Division operation can never have 0 as the divisor.
- Branch instructions can only branch within the program.

### Instruction Set:
| Instruction Opcode | Operation | Explanation |
|--------------------|-----------|-------------|
| 0000 0000 | NOP | No operation |
| 0001 xxxx | ADD Ri | Add ACC with Register contents and store the result in ACC. Updates C/B. |
| 0010 xxxx | SUB Ri | Subtract ACC with Register contents and store the result in ACC. Updates C/B. |
| 0011 xxxx | MUL Ri | Multiply ACC with Register contents and store the result in ACC. Updates EXT. |
| 0100 xxxx | DIV Ri | Divide ACC with Register contents and store the Quotient in ACC. Updates EXT with remainder. |
| 0000 0001 | LSL ACC | Left shift left logical the contents of ACC. Does not update C/B. |
| 0000 0010 | LSR ACC | Left shift right logical the contents of ACC. Does not update C/B. |
| 0000 0011 | CIR ACC | Circuit right shift ACC contents. Does not update C/B. |
| 0000 0100 | CIL ACC | Circuit left shift ACC contents. Does not update C/B. |
| 0000 0101 | ASR ACC | Arithmetic Shift Right ACC contents. |
| 0101 xxxx | AND Ri| AND ACC with Register contents (bitwise) and store the result in ACC. C/B is not updated. |
| 0110 xxxx | XRA Ri | XRA ACC with Register contents (bitwise) and store the result in ACC. C/B is not updated. |
| 0111 xxxx | CMP Ri | CMP ACC with Register contents (ACC-Reg) and update C/B. If ACC>=Reg, C/B=0, else C/B=1. |
| 0000 0110 | INC ACC | Increments ACC, updates C/B when overflows. |
| 0000 0111 | DEC ACC | Decrements ACC, updates C/B when underflows. |
| 1000 xxxx | Br <4-bit address> | PC is updated and the program Branches to 4-bit address if C/B=1. |
| 1001 xxxx | MOV ACC, Ri | Moves the contents of Ri to ACC. |
| 1010 xxxx | MOV Ri, ACC | Moves the contents of ACC to Ri. |
| 1011 xxxx | Ret <4-bit address> | PC is updated, and the program returns to the called program. |
| 1111 1111 | HLT | Stop the program (last instruction). |

