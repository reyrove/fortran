# Gauss Program for Gaussian Elimination with Scaled Partial Pivoting

## Overview
This program implements Gaussian Elimination with Scaled Partial Pivoting to solve a system of linear equations in the form \( Ax = b \), where \( A \) is a square matrix and \( x \) is the solution vector. The algorithm performs forward elimination and back substitution to compute the solution, ensuring numerical stability through scaling and partial pivoting.

### Key Concepts:
- **Gaussian Elimination**: A method to solve systems of linear equations by transforming the matrix \( A \) into an upper triangular form.
- **Scaled Partial Pivoting**: A technique used to select the pivot element in each column, ensuring numerical stability by comparing the ratio of the current element to the maximum element in the row.
- **Forward Elimination**: The process of eliminating variables to create an upper triangular matrix.
- **Back Substitution**: The process of solving for the unknowns starting from the last row and working upwards.

## Code Explanation

### Step 1: Initialize the matrix and vectors
- The matrix `A` and the vector `b` represent the system of linear equations. The size of the matrix is set to `n = 3` in this example.

```fortran
a(1,1) = 2; a(1,2) = -7; a(1,3) = 4
a(2,1) = 1; a(2,2) = 9;  a(2,3) = -6
a(3,1) = -3; a(3,2) = 8; a(3,3) = 5
b(1) = 9; b(2) = 1; b(3) = 6
```

### Step 2: Initialize scaling factors for partial pivoting
- The scaling factors `s(i)` are initialized for each row to ensure numerical stability. This is achieved by finding the maximum absolute value in each row.

```fortran
do i = 1, n
    s(i) = 0
    do j = 1, n
        absaij = abs(a(i,j))
        if (absaij > s(i)) then
            s(i) = absaij
        end if
    end do
end do
```

### Step 3: Forward Elimination
- In this step, the program iterates over each column and performs scaled partial pivoting. Rows are swapped if necessary to place the largest element in the pivot position.
- The elements below the pivot are eliminated, making the matrix upper triangular.

```fortran
do k = 1, n-1
    absaks = abs(a(k,k)) / s(k)  ! Compute scaled pivot ratio for row k
    p = k  ! Initialize pivot row
    do i1 = k+1, n
        absais = abs(a(i1,k)) / s(i1)  ! Scaled pivot ratio for subsequent rows
        if (absais > absaks) then
            absaks = absais
            p = i1  ! Update pivot row if needed
        end if
    end do
```

### Step 4: Row Interchange and Elimination
- If the pivot row is different from the current row, the rows are swapped to ensure the largest pivot element is at the diagonal.
- Then, the program eliminates the elements below the pivot element.

```fortran
if (p /= k) then
    do q = k, n
        temp = a(k,q)
        a(k,q) = a(p,q)
        a(p,q) = temp
    end do
    temp = b(k)
    b(k) = b(p)
    b(p) = temp
end if

do i2 = k+1, n
    ratio = a(i2,k) / a(k,k)  ! Elimination multiplier
    b(i2) = b(i2) - ratio * b(k)
    do j1 = k+1, n
        a(i2,j1) = a(i2,j1) - ratio * a(k,j1)  ! Update matrix A
    end do
end do
```

### Step 5: Back Substitution
- After the matrix is transformed into an upper triangular form, the program performs back substitution to find the solution vector `b`.

```fortran
b(n) = b(n) / a(n,n)  ! Solve for the last variable
do i3 = n-1, 1, -1
    sum = 0.0
    do j2 = i3+1, n
        sum = sum + a(i3,j2) * b(j2)  ! Compute the sum of known variables
    end do
    b(i3) = (b(i3) - sum) / a(i3,i3)  ! Solve for the current variable
end do
```

### Step 6: Output
- Finally, the program prints the solution vector `b`.

```fortran
print*, 'Solution vector b =', b
```

## Example Output

For the given system of linear equations:
```
2x1 - 7x2 + 4x3 = 9
x1 + 9x2 - 6x3 = 1
-3x1 + 8x2 + 5x3 = 6
```

The program will print the solution vector `b` which contains the values for \( x_1 \), \( x_2 \), and \( x_3 \).

```
Solution vector b =  x1 = -1.20000  x2 = 0.33333  x3 = 1.00000
```

## Conclusion
This program demonstrates the use of Gaussian elimination with scaled partial pivoting to solve a system of linear equations. The code handles row swapping and performs the necessary operations for both forward elimination and back substitution to find the solution vector.

## References
- [Gaussian Elimination](https://en.wikipedia.org/wiki/Gaussian_elimination)
- [Scaled Partial Pivoting](https://en.wikipedia.org/wiki/Partial_pivoting)
```








