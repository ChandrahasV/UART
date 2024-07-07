# UART (Universal Asynchronous Receiver-Transmitter)

## Description

This project implements a UART (Universal Asynchronous Receiver-Transmitter) module in Verilog. 
UART is a hardware communication protocol that uses asynchronous serial communication. 
It is widely used for serial communication between microcontrollers, computers, and other digital systems.

### Components:
**Transmitter**: The transmitter consists of three components:
- Baud Clock Generator :
  - This generates the clock signal for the UART module based on the baud select bits.
  - The baud rate determines the speed of data transmission.
  - Both the transmitter and the receiver must agree on the baud rate.
- Control Unit :
  - The control unit takes the 8 bit parallel data to be transmitted and the line control register as inputs.
  - Based on the line control register, it generates the parity bit and constructs the data frame(with start and stop bits) which will be transmitted.
  - Just like the baud select bits, both the transmitter and the receiver must receive the same line control register so that parity generation and checking can happen properly.
- PISO Shift Register :
  - Takes the parallel data frame from the control unit and transmitts it serially.

![Transmitter Schematic](Transmitter/Images/Transmitterschematic.png)
![Transmitter Waveform](Transmitter/Images/Transmitterwaveform.png)
 
**Receiver**: The receiver also consists of three components:
- Baud Clock Generator :
  - Just like in the transmitter, here also it generates a baud clock.
- SIPO Shift Register :
  - Takes the serial data as an input from the transmitter and converts it into parallel data.
- Receiver Control Unit :
  - Takes the parallel data and checks the start,stop and parity bits to check the integrity of the data.
  - Outputs the 8 bit parallel data received.
![Receiver Schematic](Receiver/Images/Receiverschematic.png)
![Receiver Waveform](Receiver/Images/Receiverwaveform.png)
## Features

- **Baud Rate Generation**:
  - Configurable baud rate to match the required communication speed.
  - The baud rate generator ensures the proper timing for data transmission and reception.
  - ![Baud Rate Generator](images/baud_rate/baud_rate_generator.png)

- **Start/Stop Bit Generation**:
  - Automatically generates start and stop bits to frame each data packet.
  - Ensures that the data packets are correctly recognized by the receiver.
  - ![Start/Stop Bit Generation](images/start_stop/start_stop_bits.png)

- **Parity Checking**:
  - Supports optional parity bit for error detection.
  - Configurable for even or odd parity.
  - ![Parity Checking](images/parity/parity_checking.png)

- **Data Width Selection**:
  - Allows selection of data width (typically 5, 6, 7, or 8 bits) to accommodate different data packet sizes.
  - Provides flexibility for various communication protocols.
  - ![Data Width Selection](images/data_width/data_width_selection.png)

- **Full-Duplex Communication**:
  - Enables simultaneous transmission and reception of data, enhancing communication efficiency.
  - ![Full-Duplex Communication](images/full_duplex/full_duplex.png)

- **Modular Design**:
  - The module is designed in a modular way to facilitate easy integration and reuse in various projects.
  - Each component (baud rate generator, parity checker, etc.) is implemented as a separate module.

- **Testbench Included**:
  - A comprehensive testbench is provided to verify the functionality of the UART module.
  - The testbench includes various test cases to validate different aspects of the UART functionality.
  - ![Testbench](images/testbench/testbench.png)

By providing a customizable and efficient UART solution, this project aims to simplify the integration of UART functionality into various digital designs. Whether for microcontroller interfacing, data logging, or other applications, this UART module offers a reliable and flexible communication interface.

