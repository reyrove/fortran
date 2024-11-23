# Fortran Example: Sum of Powers of 2

## Purpose:
This Fortran program calculates the sum of powers of 2 from `2^0` to `2^30`, and prints the final result.

## Code Explanation:

### 1. **Variable Declarations**:
- `i`: The loop counter, used to iterate through the powers of 2.
- `s`: A variable that holds the accumulated sum of the powers of 2.

### 2. **The Loop**:
- The `do` loop iterates from `i = 0` to `i = 30`, with each iteration adding `2^i` (2 raised to the power of `i`) to the sum `s`.

### 3. **Exponentiation Operation**:
- The operation `2**i` calculates `2` raised to the power of `i`. This is the Fortran way of performing exponentiation.

### 4. **Output**:
- After the loop completes, the program prints the value of `s`, which is the sum of the powers of 2 from `2^0` to `2^30`.

## Expected Output:
The output will be the sum of all powers of 2 from `2^0` to `2^30`, which evaluates to: 2147483647

## Notes:
- This example demonstrates basic Fortran syntax, including loops and the use of the `**` operator for exponentiation.
- The code is simple but shows how to work with loops and power calculations in Fortran.

---

Feel free to extend this code or modify the loop to compute higher powers of 2.



