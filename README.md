# 4-Bit Register with Mode Control (Verilog)

## 🧠 Project Overview
This project implements a **4-bit register** using:
- Four **D flip-flops (DFFs)**
- Four **4×1 multiplexers (MUX4x1)**

The register’s operation depends on two select inputs **s₁s₀**, which determine the mode of operation:

| s₁ | s₀ | Operation       | Description                             |
|----|----|------------------|-----------------------------------------|
| 0  | 0  | **Hold**         | No change, output remains the same.     |
| 0  | 1  | **Complement**   | Each bit of output is inverted.         |
| 1  | 0  | **Shift Right**  | Bits shift right, MSB ← 0.             |
| 1  | 1  | **Shift Left**   | Bits shift left, LSB ← 0.              |

---

## ⚙️ Files Included

| File | Description |
|------|--------------|
| `d_flipflop.v` | Implements a single-bit D flip-flop with asynchronous reset. |
| `mux4x1.v` | Implements a 4×1 multiplexer used for input selection. |
| `register4bit.v` | Main module — connects 4 DFFs and 4 MUX4x1s to form a 4-bit register. |
| `testbench_register.v` | Testbench to simulate all four operations and generate waveform output. |
| `register4bit.vcd` | Generated waveform file (created after simulation). |

---


# How To Run
iverilog -o test_register4bit.vvp testbench_register.v.txt register4bit.v.txt
vvp test_register4bit.vvp
