program main
    implicit none
    integer:: i, s

    ! Initialize sum (s) to 0
    s = 0

    ! Loop through values of i from 0 to 30
    do i = 0, 30
        ! Add 2 raised to the power of i to the sum
        s = s + 2**i
    end do

    ! Print the result of the sum
    print*, s
end program main
