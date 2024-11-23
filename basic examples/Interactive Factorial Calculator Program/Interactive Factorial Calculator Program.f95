program main
! This program calculates the factorial of a user-inputted number in a loop.
! It continues to prompt the user until a negative number is entered.

implicit none
real :: a, b  ! Declare 'a' for input and 'b' for the factorial result.

do while (.true.)
    ! Prompt the user for input.
    write(*, *) "a="  
    read(*, *) a
    
    ! Exit the loop if the input number is negative.
    if (a < 0) then
        exit
    end if

    ! Call the factorial subroutine to calculate the factorial of 'a'.
    call factorial(a, b)
    
    ! Print the factorial result.
    print *, b
end do

contains
    subroutine factorial(n, m)
    ! This subroutine calculates the factorial of a number 'n'.
    ! The result is stored in 'm'.

    implicit none
    real :: n, counter1, m  ! Declare local variables.
    
    m = 1  ! Initialize the factorial result to 1.
    
    do counter1 = 1, n
        ! Multiply 'm' by each number from 1 to 'n'.
        m = m * counter1
    end do
    end subroutine factorial

end program main
