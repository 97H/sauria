# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

SAURIA is a Convolutional Neural Network (CNN) accelerator based on an output stationary (OS) systolic array with on-chip, on-the-fly convolution lowering, written entirely in SystemVerilog. The accelerator can natively compute convolution and general matrix-matrix multiplication (GEMM) operations using a parametric architecture that supports different systolic array shapes, local memory configurations, and arithmetic formats.

## Development Environment Setup

### Initial Setup
```bash
# Clone and initialize submodules
git submodule update --init --recursive

# Set environment variables
source setup.sh

# Install Verilator v4.224 locally (required for simulation)
cd tools/
source install_verilator.sh
```

### Python Environment
```bash
# Option 1: Install dependencies directly
pip install -r Python/requirements_pip.txt

# Option 2: Use virtual environment
cd Python
source install_venv.sh
```

## Build and Simulation Commands

### Generate Test Stimuli
```bash
source setup.sh
cd Python
source generate_stimuli.sh bmk_small
```

### Verilator Simulation
```bash
cd test/verilator/
source compile_sauria.sh
source run_sauria_test.sh bmk_small

# With VCD dump for waveform viewing
source run_sauria_test.sh bmk_small vcd
source display_sauria_waves.sh new_test.vcd gtk_waves/sauria_8x16_fp16.gtkw
```

### VCS Simulation (Commercial)
```bash
cd test/vcs/
make sim          # With GUI
make sim_nogui    # Without GUI
make clean        # Clean build artifacts
```

## Architecture Overview

### Core Components
- **sauria_subsystem**: Top-level module integrating all components with dual clock domains (system@1.5GHz, sauria@500MHz)
- **sauria_core**: Main computational core containing systolic array and control logic
- **df_controller**: Dataflow controller managing computation sequences
- **dma_top**: DMA engine for data movement between external memory and local SRAMs

### Memory Hierarchy
- **SRAMA** (128-bit, 2048 deep): Activation/input feature map storage
- **SRAMB** (256-bit, 1024 deep): Weight storage with register file partitioning
- **SRAMC** (128-bit, 2048 deep): Output/partial sum storage

### Key Configuration Parameters (sauria_pkg.sv)
- Systolic array: 8x16 (Y×X) with FP16 arithmetic
- Configurable arithmetic types and approximation modes
- AXI4 interfaces for configuration (32-bit) and data (128-bit)

### Interface Architecture
- **Configuration**: AXI4-Lite slave for register access and control
- **Data Movement**: AXI4 master for external memory access via DMA
- **Clock Domain Crossing**: CDC FIFOs between system and SAURIA domains

## File Structure

### RTL Sources (`RTL/src/`)
- `sauria_pkg.sv`: Global configuration parameters and constants
- `sauria_subsystem.sv`: Top-level integration with AXI networks and CDC
- `sauria_core/`: Core computation modules including systolic array
- `df_controller/`: Dataflow control and sequencing logic
- `dma/`: DMA controller and data movement logic
- `axi/`, `common/`: Utility modules and AXI infrastructure

### Python Tools (`Python/`)
- `tb_sauria_generator.py`: Main testbench stimulus generation
- `helpers/`: Library modules for configuration, data generation, and testing
- `model/`: Analytical models and approximation functions

### Verification (`test/`)
- `verilator/`: Verilator-based simulation environment
- `vcs/`: VCS simulation setup
- `stimuli/`: Generated test cases and benchmarks

## Development Workflow

1. **Environment Setup**: Run `source setup.sh` from repository root
2. **Parameter Changes**: Modify `RTL/src/sauria_pkg.sv` for architectural changes
3. **Stimulus Generation**: Use Python scripts to create test cases
4. **Simulation**: Use Verilator for development, VCS for formal verification
5. **Waveform Analysis**: GTKWave with provided configuration files

## Testing and Verification

### Test Types
- `bmk_small`: Quick functionality tests
- `bmk_torture`: Extensive stress testing
- `conv_validation`: Convolution correctness verification

### Key Test Scripts
- `Python/generate_stimuli.sh <test_type>`: Generate test vectors
- `test/verilator/run_sauria_test.sh <test_type> [vcd]`: Run simulation
- `test/verilator/compile_sauria.sh`: Compile design

## Important Notes

- **Verilator Version**: Use exactly v4.224 - other versions may cause issues
- **Clock Domains**: System runs at 1.5GHz, SAURIA core at 500MHz with CDC
- **Memory Access**: All external memory access goes through DMA controller
- **Arithmetic**: Default FP16, configurable to support approximate arithmetic
- **File Lists**: `RTL/filelist.f`, `test/verilator/verilator_filelist.f`, `test/vcs/vcs_filelist.f`