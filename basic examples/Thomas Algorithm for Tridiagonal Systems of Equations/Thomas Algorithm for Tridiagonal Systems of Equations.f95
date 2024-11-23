program thomas
  implicit none
  integer:: k, i  ! Loop indices for iteration
  double precision:: ratio  ! Temporary variable for row elimination ratio
  integer, parameter:: n=2  ! Size of the tridiagonal matrix (number of equations)
  real:: d(n), c(n), a(n), b(n), x(n)  ! Arrays for the coefficients and solution vector

  ! Initialize the coefficients of the tridiagonal matrix and the right-hand side vector
  d(1) = 1
  d(2) = -1

  c(1) = 0
  c(2) = 1

  a(1) = 1
  a(2) = 0

  b(1) = 2
  b(2) = 0

  ! Forward elimination to transform the system into an upper-triangular form
  do k = 1, n-1  ! Loop through rows for forward elimination
    ! Check if the current diagonal element is zero (which would lead to division by zero)
    if (d(k) == 0) then
      print *, 'No solution: Diagonal element is zero.'
      stop
    end if

    ! Calculate the ratio for elimination
    ratio = c(k+1) / d(k)
    d(k+1) = d(k+1) - ratio * a(k)  ! Update the next diagonal element
    b(k+1) = b(k+1) - ratio * b(k)  ! Update the next right-hand side value
  end do

  ! Check the last diagonal element
  if (d(n) == 0) then
    print *, 'No solution: Last diagonal element is zero.'
    stop
  end if

  ! Backward substitution to solve for the unknowns
  x(n) = b(n) / d(n)  ! Start with the last unknown

  ! Loop through the system in reverse to solve for the other unknowns
  do i = n-1, 1, -1
    x(i) = (b(i) - a(i) * x(i+1)) / d(i)  ! Solve for the current unknown
  end do

  ! Print the coefficient arrays and the solution vector
  print *, 'Right-hand side vector b: ', b
  print *, 'Diagonal array d: ', d
  print *, 'Solution vector x: ', x

end program thomas
