# Fortran Example: CPU Time Measurement

## Purpose:
This Fortran program demonstrates how to measure the execution time of a section of code using the `cpu_time` subroutine.

## Code Explanation:

### 1. **Variable Declarations**:
- `start`: A variable to store the start time of the execution.
- `finish`: A variable to store the end time of the execution.

### 2. **Start Time Measurement**:
- The `call cpu_time(start)` line retrieves the current CPU time and stores it in the `start` variable.

### 3. **Code Block to Test**:
- In the placeholder comment `! put code to test here`, you should insert the code whose execution time you want to measure. For example, a computation or any other operations.

### 4. **End Time Measurement**:
- The `call cpu_time(finish)` line retrieves the CPU time again after the code has executed and stores it in the `finish` variable.

### 5. **Time Calculation and Output**:
- The difference between `finish` and `start` gives the elapsed time in seconds. The program then prints the result in the format `Time = [elapsed time] seconds`.

## Expected Output:
The output will display the time it took for the code inside the loop or function to execute, like this: Time =  0.000 seconds.

## Notes:
- The `cpu_time` subroutine is commonly used to measure the time taken by small blocks of code or functions.
- The accuracy of time measurement depends on the system's clock and the granularity of the CPU timer.

---

### Example Usage:
This program can be extended to measure the performance of algorithms, compare the execution time of different methods, or profile specific sections of code for optimization purposes.

Feel free to modify the `! put code to test here` section with your own code to measure its execution time.








