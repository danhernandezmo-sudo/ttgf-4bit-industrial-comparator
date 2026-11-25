## How it works

This project implements a 4-bit digital comparator for industrial product sorting.

The circuit compares two unsigned 4-bit numbers, A and B, and generates three outputs:

- GT: A is greater than B.
- EQ: A is equal to B.
- LT: A is less than B.

Input A represents the measured product value, while input B represents the reference value.

The design uses two 2-bit comparators and combinational logic. It does not require a clock or reset.

## How to test

Set input A using ui[3:0] and input B using ui[7:4].

Observe the following outputs:

| A | B | GT | EQ | LT |
|---|---|---|---|---|
| 12 | 10 | 1 | 0 | 0 |
| 10 | 10 | 0 | 1 | 0 |
| 8 | 10 | 0 | 0 | 1 |

All 256 possible input combinations were successfully verified through simulation.

## External hardware

No external hardware is required for simulation.

For a physical demonstration, the following components can be used:

- Eight digital switches for the inputs.
- Three LEDs with current-limiting resistors for the outputs.

For industrial applications, an external digital sensor and a sorting controller can be connected to the comparator.
