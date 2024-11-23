# Thomas Algorithm for Solving Tridiagonal Systems

This program demonstrates the implementation of the **Thomas Algorithm** to solve a system of linear equations that arises from a tridiagonal matrix. This algorithm is efficient and widely used for solving tridiagonal systems, commonly found in numerical methods such as finite difference methods for partial differential equations.

## Program Overview

The program solves a system of linear equations of the form:

\[
A \cdot x = b
\]

where `A` is a tridiagonal matrix, and `b` is the right-hand side vector. The matrix `A` has the form:

\[
A = \begin{bmatrix}
d_1 & c_1 & 0   & 0   & \dots & 0 \\
a_2 & d_2 & c_2 & 0   & \dots & 0 \\
0   & a_3 & d_3 & c_3 & \dots & 0 \\
\vdots & \vdots & \vdots & \vdots & \ddots & \vdots \\
0   & 0   & 0   & 0   & \dots & d_n
\end{bmatrix}
\]

Here:
- `a(i)` represents the subdiagonal (elements below the main diagonal).
- `c(i)` represents the superdiagonal (elements above the main diagonal).
- `d(i)` represents the main diagonal elements of the matrix `A`.
- `b` is the right-hand side vector.
- `x` is the solution vector we aim to compute.

## Code Walkthrough

### Initialization
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
- The coefficients for the tridiagonal matrix `A` are initialized, as well as the right-hand side vector `b`. In this case, we use a 2x2 matrix, but the program can be extended to larger systems by modifying the size of the matrix.

### Forward Elimination
```fortran
do k = 1, n-1
  if (d(k) == 0) then
    print *, 'No solution: Diagonal element is zero.'
    stop
  end if
  ratio = c(k+1) / d(k)
  d(k+1) = d(k+1) - ratio * a(k)
  b(k+1) = b(k+1) - ratio * b(k)
end do
```
- **Forward Elimination**: This step eliminates the elements below the diagonal, making the system upper triangular. The matrix is transformed such that only the diagonal and upper triangular elements remain.
- It checks for division by zero (which would imply no solution), and performs elimination by updating the values of `d` and `b` based on the calculated ratio.

### Backward Substitution
```fortran
x(n) = b(n) / d(n)
do i = n-1, 1, -1
  x(i) = (b(i) - a(i) * x(i+1)) / d(i)
end do
```
- **Backward Substitution**: Once the matrix is in upper triangular form, the system can be solved by starting from the last equation and working backwards.
- For each unknown `x(i)`, the solution is calculated using the known values of the variables that have already been computed.

### Output
```fortran
print *, 'Right-hand side vector b: ', b
print *, 'Diagonal array d: ', d
print *, 'Solution vector x: ', x
```
- Finally, the program prints the original right-hand side vector `b`, the updated diagonal `d`, and the solution vector `x`.

## Key Concepts

- **Thomas Algorithm**: An efficient method for solving a tridiagonal system of equations. It is essentially a simplified version of Gaussian elimination tailored for tridiagonal matrices.
- **Forward Elimination**: This step modifies the matrix so that all elements below the main diagonal are zeroed out.
- **Backward Substitution**: After the matrix is transformed into an upper triangular form, we solve for the unknowns by substitution, starting from the last equation.

## Example

Given the following system of equations:

\[
1 \cdot x_1 + 0 \cdot x_2 = 2
\]
\[
0 \cdot x_1 + (-1) \cdot x_2 = 0
\]

The code will solve for `x1` and `x2` using the Thomas algorithm. The output will be the solution vector `x` containing the values of `x1` and `x2`.

## Conclusion

The Thomas algorithm is an efficient method for solving tridiagonal systems. This code implements the algorithm and demonstrates how to perform forward elimination followed by backward substitution to obtain the solution. This is particularly useful in solving problems in numerical analysis, where such systems frequently arise.

---

**Notes**:
- For larger systems, simply modify the value of `n` and the corresponding coefficient arrays.
- The program checks for division by zero during the forward elimination phase and will output an error message if the matrix is singular.
```






