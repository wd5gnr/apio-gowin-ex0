# APIO GOWIN Example 0

A simple APIO example for the Sipeed Tang Nano 20K FPGA.

This project accompanies *The FPGA Chronicles* series on Hackaday and is intended as a small starting point for using the open-source APIO toolchain with a GOWIN FPGA.

The example implements a simple LED design and includes a Verilog testbench for simulation.

## Requirements

- Sipeed Tang Nano 20K
- [APIO](https://fpgawars.github.io/apio/)
- Optional: the APIO extension for Visual Studio Code

The project is configured for:

```ini
[env:default]
board = sipeed-tang-nano-20k
top-module = led
```

## Building

From an APIO shell:

```sh
apio build
```

To program the FPGA:

```sh
apio upload
```

You can also use the corresponding Build and Upload commands from the APIO panel in Visual Studio Code.

## Simulation

The project includes a testbench. Run:

```sh
apio sim
```

APIO will run the simulation and open the resulting waveform in GTKWave.

The simulation uses a much slower clock than the real hardware so that the waveform is easier to inspect.

## Clock Setup

The example expects a 27 MHz clock on FPGA pin 10. On the Tang Nano 20K, this can be configured through the onboard debugger/microcontroller console.

Enter the console with Ctrl-X, Ctrl-C, Enter and use:

```text
pll_clk O0=27M -s
```

The `-s` saves the setting.

## More Information

This repository is intended as a teaching example rather than a complete FPGA framework.

See the accompanying FPGA Chronicles articles on [Hackaday](https://hackaday.com/) for explanation and background.
