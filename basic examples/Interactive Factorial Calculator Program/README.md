# Factorial Calculator in Fortran

## Overview
This program calculates the factorial of a number entered by the user in an interactive loop. The user is prompted to enter a number, and its factorial is computed using a subroutine. The program continues until a negative number is entered, which terminates the execution.

---

## Code Structure

### Main Program
- **Purpose**: Continuously read input, compute factorial, and display the result.
- **Exit Condition**: Terminates the loop when the user enters a negative number.

### Subroutine `factorial`
- **Purpose**: Compute the factorial of a given number using a loop.
- **Parameters**:
  - Input: `n` (number for which the factorial is to be calculated)
  - Output: `m` (calculated factorial value)

---

## How It Works
1. **Input**: The program repeatedly asks the user for a number.
2. **Validation**: If the input number is negative, the program exits the loop.
3. **Calculation**: The factorial of the input number is computed in the `factorial` subroutine.
4. **Output**: The result is displayed after each calculation.

---

## Usage Example
### Input:
```
a = 5
```

### Output:
```
120.0
```

### Input:
```
a = 0
```

### Output:
```
1.0
```

---

## Program Requirements
- A Fortran compiler (e.g., gfortran).
- Compile and run the program using:
  ```bash
  gfortran -o factorial_calculator program_name.f90
  ./factorial_calculator
  ```

---

## Notes
- Factorials are defined only for non-negative integers. Ensure proper inputs for correct results.
- The factorial of a real number is calculated here, but it typically applies to integers in mathematics.

---

This program demonstrates Fortran's capability to handle numerical computations and modular programming through subroutines.


