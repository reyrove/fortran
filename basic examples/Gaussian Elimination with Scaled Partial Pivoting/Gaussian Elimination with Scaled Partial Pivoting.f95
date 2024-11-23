program Gauss
! This program performs Gaussian Elimination with Scaled Partial Pivoting 
! to solve a system of linear equations Ax = b.

implicit none
integer, parameter :: n = 3 ! Size of the matrix and vectors
real :: a(n,n), b(n), s(n) ! Matrix A, vector b, and scaling factors
integer :: p, q, k          ! Loop indices and pivot row tracker
integer :: i, j, i1, i2, j1, i3, j2
double precision :: absaij, absaks, absais, temp, ratio, sum

! Initialize matrix A and vector b
a(1,1) = 2; a(1,2) = -7; a(1,3) = 4
a(2,1) = 1; a(2,2) = 9;  a(2,3) = -6
a(3,1) = -3; a(3,2) = 8; a(3,3) = 5
b(1) = 9; b(2) = 1; b(3) = 6
s(1) = 7; s(2) = 9; s(3) = 8

! Step 1: Initialize scaling factors for partial pivoting
do i = 1, n
    s(i) = 0
    do j = 1, n
        absaij = abs(a(i,j)) ! Get absolute value of the current element
        if (absaij > s(i)) then
            s(i) = absaij ! Update scaling factor for row i
        end if
    end do
end do

! Step 2: Forward elimination with scaled partial pivoting
do k = 1, n-1
    absaks = abs(a(k,k)) / s(k) ! Compute the scaled pivot ratio for row k
    p = k ! Initialize pivot row
    do i1 = k+1, n
        absais = abs(a(i1,k)) / s(i1) ! Scaled pivot ratio for subsequent rows
        if (absais > absaks) then
            absaks = absais
            p = i1 ! Update pivot row if needed
        end if
    end do

    if (absaks == 0.0) then
        print*, 'No solution: singular matrix'
        stop
    end if

    ! Swap rows k and p if pivot row is different from the current row
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

    ! Eliminate x(k) from subsequent rows
    do i2 = k+1, n
        ratio = a(i2,k) / a(k,k) ! Compute the elimination multiplier
        b(i2) = b(i2) - ratio * b(k) ! Update vector b
        do j1 = k+1, n
            a(i2,j1) = a(i2,j1) - ratio * a(k,j1) ! Update matrix A
        end do
    end do
end do

! Check if the matrix is singular
if (a(n,n) == 0.0) then
    print*, 'No solution: singular matrix'
    stop
end if

! Step 3: Back substitution to find solution vector b
b(n) = b(n) / a(n,n) ! Solve for the last variable
do i3 = n-1, 1, -1
    sum = 0.0
    do j2 = i3+1, n
        sum = sum + a(i3,j2) * b(j2) ! Compute the sum of known variables
    end do
    b(i3) = (b(i3) - sum) / a(i3,i3) ! Solve for the current variable
end do

! Print the solution vector
print*, 'Solution vector b =', b

end program Gauss
