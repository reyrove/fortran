program decomposition
  implicit none
  parameter(n=3)   ! Defining the size of the matrix and vectors
  integer::n, ipivot(n)  ! Declare integer array 'ipivot' to store pivot indices
  real::det, a(n,n), b(n), x(n)   ! Declare real arrays for matrix 'a', vector 'b', solution vector 'x'
  
  ! Define the matrix 'a' and vector 'b'
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

  ! Call Banaciewicz method to perform factorization and get determinant
  call Banaciewicz(n,a,ipivot,det)
  
  ! Call solve subroutine to solve the system of equations
  call solve(n,a,b,x,ipivot)

  ! Print the pivot indices, determinant and the solution vector 'x'
  print*,'ipivot=',ipivot
  print*,'det=',det
  print*,'x=',x
end program decomposition


subroutine Banaciewicz(n, a, ipivot, det)
  implicit none
  integer::n, ipivot(n), p, q, i, i1, k, i2, j1, i3, j
  real::a(n,n), s(n), absaij, absaks, absais, temp, itemp, ratio, iflag, det
  
  ! Initialize the pivot array and scaling factors
  do i=1, n
    ipivot(i) = i
    s(i) = 0.0
    do j=1, n
      absaij = ABS(a(i,j))
      if (absaij > s(i)) then
        s(i) = absaij   ! Store the maximum absolute value in each row for scaling
      end if
    end do
  end do

  iflag = 1  ! Flag to indicate the sign of the determinant

  ! Begin the factorization process using Gaussian elimination with partial pivoting
  do k=1, n-1
    absaks = ABS(a(k,k)) / s(k)   ! Calculate the scaled pivot element
    p = k
    do i1 = k+1, n
      absais = ABS(a(i1,k)) / s(i1)   ! Calculate the scaled value for row 'i1'
      if (absais < absaks) then
        exit
      end if
      absaks = absais
      p = i1  ! Update the pivot row
    end do

    if (absaks == 0.0) then
      print*, 'no solution'
      return
    end if

    ! Swap rows 'k' and 'p' if necessary
    if (p /= k) then
      do q = 1, n
        temp = a(k,q)
        a(k,q) = a(p,q)
        a(p,q) = temp
      end do
      itemp = ipivot(k)
      ipivot(k) = ipivot(p)
      ipivot(p) = itemp
      temp = s(k)
      s(k) = s(p)
      s(p) = temp
      iflag = -iflag   ! Change the sign of the determinant if rows were swapped
    end if

    ! Perform row elimination to zero out the elements below the pivot
    do i2 = k+1, n
      a(i2, k) = a(i2, k) / a(k, k)   ! Scale the pivot row to eliminate the elements
      ratio = a(i2, k)
      do j1 = k+1, n
        a(i2, j1) = a(i2, j1) - ratio * a(k, j1)  ! Eliminate entries in the lower rows
      end do
    end do
  end do

  ! If the last pivot is zero, no solution exists
  if (a(n,n) == 0.0) then
    print*, 'no solution'
    return
  end if

  det = iflag  ! Set the sign of the determinant

  ! Compute the determinant by multiplying the diagonal elements
  do i3 = 1, n
    det = det * a(i3,i3)
  end do
end subroutine Banaciewicz


subroutine solve(n, a, b, x, ipivot)
  implicit none
  integer::n, ipivot(n), ip, i, i1, j1, j
  real::a(n,n), b(n), x(n), s(n), sum
  
  ! Forward substitution to solve for 'x' using the pivoted matrix
  ip = ipivot(1)
  x(1) = b(ip)

  do i = 2, n
    sum = 0.0
    do j = 1, i-1
      sum = sum + a(i,j) * x(j)  ! Sum the known solutions
    end do
    ip = ipivot(i)
    x(i) = b(ip) - sum   ! Solve for the current variable
  end do

  ! Backward substitution to finalize the solution
  x(n) = x(n) / a(n,n)   ! Normalize the last variable

  do i1 = n-1, 1, -1
    sum = 0.0
    do j1 = i1+1, n
      sum = sum + a(i1,j1) * x(j1)  ! Sum the known solutions from the upper rows
    end do
    x(i1) = (x(i1) - sum) / a(i1,i1)  ! Finalize the solution for the current variable
  end do
end subroutine solve



 