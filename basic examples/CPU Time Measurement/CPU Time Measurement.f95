program test_cpu_time
    ! Declare real variables to store the start and finish times
    real :: start, finish

    ! Call the cpu_time subroutine to get the current CPU time at the start of the code
    call cpu_time(start)

    ! Put your code to test here - replace the following line with your code.
    ! Example:
    ! Do some complex calculation or any task you want to measure.
    ! For example: 
    ! do i = 1, 100000
    !     result = sqrt(i)
    ! end do

    ! Call the cpu_time subroutine again to get the CPU time after the code execution
    call cpu_time(finish)

    ! Calculate the elapsed time by subtracting the start time from the finish time
    ! Print the elapsed time in seconds
    print '("Time = ",f6.3," seconds.")', finish - start
end program test_cpu_time

