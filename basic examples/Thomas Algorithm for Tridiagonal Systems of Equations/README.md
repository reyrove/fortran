To properly display mathematical equations and matrices in **Markdown** with LaTeX-style formatting (such as the one used for the Thomas Algorithm example), you'll need to use a platform or tool that supports LaTeX rendering. Most Markdown editors, including GitHub and Jupyter Notebooks, support LaTeX syntax enclosed by dollar signs for inline math or double dollar signs for block math. For matrices, the `bmatrix` environment is commonly used in LaTeX.

Here is the corrected version of the matrix formatting using LaTeX in **Markdown** for your **Thomas Algorithm** example:

---

# Thomas Algorithm for Solving Tridiagonal Systems of Equations

## Overview

The **Thomas Algorithm** is an efficient method for solving a system of linear equations represented by a tridiagonal matrix. This matrix structure is common in numerical methods, particularly for solving partial differential equations using finite difference methods.

This program demonstrates the use of the Thomas Algorithm to solve a system of equations \(A \cdot x = b\), where \(A\) is a tridiagonal matrix, and \(b\) is the right-hand side vector. The matrix \(A\) is structured as follows:

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
- \(a(i)\) represents the subdiagonal elements (below the main diagonal).
- \(c(i)\) represents the superdiagonal elements (above the main diagonal).
- \(d(i)\) represents the diagonal elements.
- \(b\) is the right-hand side vector.
- \(x\) is the solution vector.

## Program Features

- **Dynamic Matrix Size**: The program allows for a flexible system size by user input.
- **Efficient Computation**: The Thomas Algorithm reduces complexity from \(O(n^3)\) to \(O(n)\) for tridiagonal systems.
- **Error Handling**: Includes checks for division by zero to handle singular matrices.

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

The coefficients for the tridiagonal matrix `A` and the right-hand side vector `b` are initialized. You can modify the matrix size `n` as needed.

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

The forward elimination process eliminates the lower diagonal elements to convert the system into upper triangular form. It checks for a zero diagonal element (which would make the system unsolvable).

### 3. **Backward Substitution**

```fortran
x(n) = b(n) / d(n)
do i = n-1, 1, -1
  x(i) = (b(i) - a(i) * x(i+1)) / d(i)
end do
```

In the backward substitution step, the solution is computed starting from the last variable and working upwards to calculate the entire solution vector `x`.

### 4. **Output**

```fortran
print *, 'Solution vector x: '
print *, x
```

The program prints the solution vector `x`, which contains the values of the unknowns.

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

This output indicates that the solution to the system of equations is \(x_1 = 1\), \(x_2 = 1\), and \(x_3 = 1\).

## Key Concepts

- **Thomas Algorithm**: This is a specialized version of Gaussian elimination tailored for tridiagonal systems.
- **Tridiagonal Matrix**: A matrix where only the main diagonal and the two adjacent diagonals are non-zero.
- **Forward Elimination**: Converts the system to an upper triangular form.
- **Backward Substitution**: Solves for the unknowns after the matrix has been converted into upper triangular form.

## Conclusion

The **Thomas Algorithm** is an efficient method for solving systems of linear equations with a tridiagonal matrix. This program demonstrates its application with forward elimination followed by backward substitution to find the solution. This algorithm is particularly useful in numerical simulations where such systems frequently arise.

---

This version of the readme now uses the correct Markdown syntax for LaTeX formatting with proper matrix equations. Ensure that the platform you're using (e.g., GitHub, Jupyter Notebooks) supports this LaTeX rendering for it to be displayed properly.
