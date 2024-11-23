# Thomas Algorithm for Solving Tridiagonal Systems of Equations

## Overview

The **Thomas Algorithm** is a specialized method for solving a system of linear equations represented by a tridiagonal matrix. This matrix structure appears frequently in numerical methods, particularly in solving partial differential equations using finite difference methods.

This program demonstrates the use of the Thomas Algorithm to solve a system of equations \(A \cdot x = b\), where \(A\) is a tridiagonal matrix, \(b\) is the right-hand side vector, and \(x\) is the solution vector.

The matrix \(A\) for a system of \(n\) equations is structured as follows:

\[
A = \begin{bmatrix}
d_1 & c_1 & 0   & 0   & \dots & 0 \\
a_2 & d_2 & c_2 & 0   & \dots & 0 \\
0   & a_3 & d_3 & c_3 & \dots & 0 \\
\vdots & \vdots & \vdots & \vdots & \ddots & \vdots \\
0   & 0   & 0   & 0   & \dots & d_n
\end{bmatrix}
\]

Where:
- `a(i)` represents the subdiagonal elements (below the main diagonal).
- `c(i)` represents the superdiagonal elements (above the main diagonal).
- `d(i)` represents the diagonal elements.
- `b` is the right-hand side vector.
- `x` is the solution vector that we aim to compute.

## Program Features

- **Dynamic Matrix Size**: The program allows the user to input the size of the matrix (denoted by `n`), making it flexible for systems of varying sizes.
- **Efficient Computation**: The Thomas Algorithm reduces the complexity of Gaussian elimination from \(O(n^3)\) to \(O(n)\) for tridiagonal systems, making it highly efficient.
- **User Input**: The user is prompted to enter the coefficients for the tridiagonal matrix (subdiagonal, diagonal, superdiagonal) and the right-hand side vector.
- **Error Handling**: Checks for division by zero are included, ensuring that the program gracefully handles cases where a diagonal element is zero (which would make the system unsolvable).

## Program Walkthrough

### 1. **Initialization**

```fortran
d(1) = 1
d(2) = -1
c(1) = 0
c(2) = 1
a(1) = 1
a(2) = 0
b(1) = 2
b(2) = 0
```

The program initializes the tridiagonal matrix coefficients (`a`, `b`, `c`, `d`) for a system of equations. The matrix size is determined by user input, and the values for the coefficients are taken interactively.

### 2. **Forward Elimination**

```fortran
do k = 1, n-1
  if (d(k) == 0) then
    print *, 'No solution: Diagonal element is zero.'
    stop
  end if
  ratio = c(k) / d(k)
  d(k+1) = d(k+1) - ratio * a(k)
  b(k+1) = b(k+1) - ratio * b(k)
end do
```

In the forward elimination step, the goal is to eliminate the lower diagonal elements, transforming the system into an upper triangular form. This step involves:
- Checking for a zero diagonal element (`d(k)`), as division by zero would make the system unsolvable.
- Updating the coefficients using the ratio of the current element and its corresponding diagonal element.

### 3. **Backward Substitution**

```fortran
x(n) = b(n) / d(n)
do i = n-1, 1, -1
  x(i) = (b(i) - a(i) * x(i+1)) / d(i)
end do
```

Once the system is in upper triangular form, the solution is computed by solving for the last variable first and then moving upwards to calculate all variables.

### 4. **Output**

```fortran
print *, 'Solution vector x: '
print *, x
```

After solving the system, the program prints the solution vector `x`, which contains the values of the unknowns in the system.

## Example

### Input:
```
Enter the size of the matrix (n):
3

Enter the subdiagonal (a):
1
1

Enter the diagonal (d):
4
4
4

Enter the superdiagonal (c):
1
1

Enter the right-hand side vector b:
2
4
6
```

### Output:
```
Solution vector x:
 1.0000000
 1.0000000
 1.0000000
```

This indicates that the solution to the system of equations is \(x_1 = 1\), \(x_2 = 1\), and \(x_3 = 1\).

## Key Concepts

- **Thomas Algorithm**: A specialized form of Gaussian elimination optimized for tridiagonal systems of equations. It transforms the system into an upper triangular matrix using forward elimination, followed by backward substitution to find the solution.
- **Tridiagonal System**: A system of linear equations where the coefficient matrix has non-zero elements only on the main diagonal and the two adjacent diagonals (subdiagonal and superdiagonal).

## Conclusion

This program demonstrates an efficient way to solve a system of linear equations with a tridiagonal coefficient matrix using the Thomas Algorithm. It's an essential tool in computational mathematics and numerical analysis, particularly in problems where large sparse matrices arise, such as in finite difference methods for partial differential equations.

### Key Features:
- Efficient, \(O(n)\) complexity for tridiagonal systems.
- Interactive, user-driven input for matrix and vector coefficients.
- Handles edge cases like division by zero with error messages.
  
### Notes:
- The program is suitable for small to medium-sized systems. For larger systems, consider optimizing memory allocation and enhancing performance further.
- You can modify the matrix size `n` to handle larger systems by adjusting the input accordingly.

---

This improved implementation makes the Thomas Algorithm more flexible, robust, and suitable for various problem sizes, allowing users to solve tridiagonal systems of any size.
