# Basic Fortran 95 Examples with Plato IDE

This repository contains a collection of basic **Fortran 95** (FTN95) programming examples designed to work with the **Plato IDE**. These examples cover fundamental numerical and algorithmic methods, including CPU time measurement, Gaussian elimination, factorial calculation, and more. These programs are excellent for understanding key concepts in computational programming and Fortran syntax.

## Table of Contents

1. CPU Time Measurement
2. Gaussian Elimination and Factorization
3. Gaussian Elimination with Scaled Partial Pivoting
4. Geometric Series Sum of Powers of 2
5. Interactive Factorial Calculator Program
6. Thomas Algorithm for Tridiagonal Systems of Equations

## 1. CPU Time Measurement

This example demonstrates how to measure the CPU time taken by a Fortran program using the `CPU_TIME` intrinsic function. It measures the time taken to execute a particular block of code and outputs the result in seconds.

### Example:
```fortran
program cpu_time_example
    real :: start, finish
    call cpu_time(start)
    ! Code to test here
    call cpu_time(finish)
    print *, "Time = ", finish - start, " seconds."
end program cpu_time_example
```

This simple example is useful for performance testing and optimization of Fortran programs.

---

## 2. Gaussian Elimination and Factorization

This example demonstrates solving a system of linear equations using **Gaussian Elimination** without pivoting. The system is represented by a matrix \(A\) and a vector \(b\), and the goal is to find the solution vector \(x\).

### Example:
```fortran
program gauss_elimination
    implicit none
    integer, parameter:: n = 3
    real :: a(n, n), b(n), x(n)
    integer :: i, j, k
    ! Matrix and vector setup
    ! Perform Gaussian elimination
    ! Back substitution to find the solution
end program gauss_elimination
```

This example is foundational for understanding the method of solving linear equations using direct methods.

---

## 3. Gaussian Elimination with Scaled Partial Pivoting

This example enhances Gaussian elimination by adding **scaled partial pivoting**, which helps improve numerical stability. It swaps rows based on the largest scaled element in the current column.

### Example:
```fortran
program gauss_pivot
    implicit none
    integer, parameter:: n = 3
    real :: a(n, n), b(n), x(n)
    integer :: i, j, k
    ! Matrix setup and pivoting logic
end program gauss_pivot
```

This method reduces the risk of round-off errors, especially for ill-conditioned systems.

---

## 4. Geometric Series Sum of Powers of 2

This example calculates the sum of the first \( n \) powers of 2 using a **geometric series**. It's a simple but effective way to demonstrate the application of mathematical series in Fortran.

### Example:
```fortran
program geometric_series
    implicit none
    integer :: i, n
    real :: sum
    n = 10
    sum = 0.0
    do i = 1, n
        sum = sum + 2**i
    end do
    print *, "Sum of geometric series:", sum
end program geometric_series
```

This program calculates the sum \( S = 2^1 + 2^2 + ... + 2^n \).

---

## 5. Interactive Factorial Calculator Program

This example prompts the user to input a number and computes its factorial using a simple **iterative loop**. It demonstrates user input handling and function calls in Fortran.

### Example:
```fortran
program factorial_calculator
    implicit none
    integer :: n
    print *, "Enter a number:"
    read *, n
    print *, "Factorial is: ", factorial(n)
contains
    function factorial(n)
        integer :: n
        integer :: factorial
        integer :: i
        factorial = 1
        do i = 1, n
            factorial = factorial * i
        end do
    end function factorial
end program factorial_calculator
```

This is a basic example for learning how to write and use functions and handle user input.

---

## 6. Thomas Algorithm for Tridiagonal Systems of Equations

This example demonstrates the **Thomas algorithm**, an efficient method for solving a system of linear equations where the matrix is tridiagonal. The program solves \(Ax = b\) with a tridiagonal matrix \(A\) and vector \(b\).

### Example:
```fortran
program thomas_algorithm
    implicit none
    integer :: i
    real :: a(n), b(n), c(n), d(n), x(n)
    ! Setup matrix and vector
    ! Thomas algorithm for solving tridiagonal system
end program thomas_algorithm
```

This algorithm is highly efficient for specific types of systems, making it a key technique for numerical linear algebra.

---

## How to Use Plato IDE with FTN95

To run the above examples in **Plato IDE**, follow these steps:

1. **Install Plato IDE**: Download and install the Plato IDE for Fortran from [here](https://www.silverfrost.com/16/ftn95/plato.aspx).
   
2. **Create a New Project**:
   - Open Plato IDE.
   - Go to **File > New Project** and select **Fortran Project**.
   - Create a new Fortran file for your example code.

3. **Compile and Run**:
   - Write or paste the example code into the Plato editor.
   - Save the file with a `.f95` extension.
   - Click on **Build and Run** to compile and execute the program.

4. **Output**: The output will appear in the **console** within Plato, where you can view results like CPU time, solution vectors, or error messages.

---

## License and Usage

These code examples are **free to use**. Please credit the source if you decide to use them in your own projects, particularly when modifying or redistributing the content.
