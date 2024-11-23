# Gaussian Elimination with Pivoting - Fortran Code

## Overview

This Fortran program demonstrates solving a system of linear equations using **Gaussian elimination with partial pivoting**. The system of equations is represented as:

\[
Ax = b
\]

Where:
- \( A \) is a square matrix of coefficients.
- \( x \) is the vector of unknowns.
- \( b \) is the vector of constants.

The program uses the **Banaciewicz method** for matrix factorization and **forward and backward substitution** to find the solution.

## Program Breakdown

### 1. **Matrix and Vector Initialization**

The matrix `A` and vector `b` are initialized with predefined values. The matrix is of size `3x3` and the vector `b` has 3 elements. Here's the initialization:

```fortran
a(1,1)=1
a(1,2)=0
a(1,3)=0
a(2,1)=0
a(2,2)=1
a(2,3)=0
a(3,1)=0
a(3,2)=0
a(3,3)=4

b(1)=1
b(2)=1
b(3)=16
```

- Matrix `A` is a simple identity matrix with one non-zero element at position `(3,3)`.
- Vector `b` has values `1, 1, 16`.

### 2. **Banaciewicz Subroutine (Factorization)**

The `Banaciewicz` subroutine is used to perform **Gaussian elimination**. It scales the rows of the matrix, identifies pivot elements, swaps rows if necessary, and performs row reduction to reduce the matrix into an upper triangular form.

Key steps in this subroutine:
- **Pivoting**: The largest element in each column is selected as the pivot. If necessary, rows are swapped to ensure numerical stability.
- **Row Reduction**: The subroutine eliminates elements below the pivot by modifying the rows to create zeros below the pivot.

```fortran
! Initialize pivot indices and scaling factors
do i=1, n
  ipivot(i) = i
  s(i) = 0.0
  do j=1, n
    absaij = ABS(a(i,j))
    if (absaij > s(i)) then
      s(i) = absaij  ! Store the largest absolute value in each row for scaling
    end if
  end do
end do
```

### 3. **Forward Substitution**

In forward substitution, we solve for the unknowns by starting from the first row and using previously calculated values to compute the current unknown. It is done for all equations except the last one.

```fortran
! Forward substitution to solve for 'x' using the pivoted matrix
ip = ipivot(1)
x(1) = b(ip)

do i = 2, n
  sum = 0.0
  do j = 1, i-1
    sum = sum + a(i,j) * x(j)  ! Sum of known solutions
  end do
  ip = ipivot(i)
  x(i) = b(ip) - sum   ! Solve for the current variable
end do
```

### 4. **Backward Substitution**

In backward substitution, we solve for the remaining unknowns, starting from the last equation and working backward. This step uses the previously computed values of the unknowns.

```fortran
! Backward substitution to finalize the solution
x(n) = x(n) / a(n,n)   ! Normalize the last variable

do i1 = n-1, 1, -1
  sum = 0.0
  do j1 = i1+1, n
    sum = sum + a(i1,j1) * x(j1)  ! Sum of known solutions from the upper rows
  end do
  x(i1) = (x(i1) - sum) / a(i1,i1)  ! Finalize the solution for the current variable
end do
```

### 5. **Determinant Calculation**

The determinant of the matrix is calculated by multiplying the diagonal elements of the matrix after performing the Gaussian elimination.

```fortran
det = iflag  ! Set the sign of the determinant

! Compute the determinant by multiplying the diagonal elements
do i3 = 1, n
  det = det * a(i3,i3)
end do
```

### 6. **Final Output**

The program prints the following outputs:
- **Pivot indices** (`ipivot`): The indices of the pivot rows after pivoting.
- **Determinant** (`det`): The determinant of the matrix after factorization.
- **Solution vector** (`x`): The solution to the system of equations.

```fortran
print*,'ipivot=',ipivot
print*,'det=',det
print*,'x=',x
```

## Conclusion

This Fortran program demonstrates an implementation of **Gaussian elimination with partial pivoting** to solve a system of linear equations. The program is structured into two main subroutines: `Banaciewicz` for factorization and `solve` for solving the system. 

The algorithm ensures numerical stability by selecting pivot elements and row swapping, making it a robust method for solving linear systems.

### Example Output

For the given matrix and vector, the output might look like:

```
ipivot= 1 2 3
det= 4.0
x= 1.0 1.0 4.0
```

Where the vector `x` is the solution to the system \( Ax = b \).

## References

- **Gaussian Elimination**: https://en.wikipedia.org/wiki/Gaussian_elimination
- **Fortran Programming Guide**: https://fortran-lang.org/ (For further learning on Fortran and its syntax)
```

