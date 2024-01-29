program powers
  ! LOCAL VARIABLES
  implicit none
  integer inarr(10), outarr(10)
  integer i, k, n, stat
  integer power, num_args
  character(len=64) power_str

  ! handle command line args
  num_args = command_argument_count()
  if (num_args == 1) then
    call get_command_argument(1, power_str)
    read(power_str,*,iostat=stat) power
    if (stat == 0 ) then
      write(*,*) "Raising numbers to the power of ", power
  !45  format(, power)
    else
      write(*,*) "Invalid argument for the power, setting power to 2"
      power = 2
    endif
  else
    write(*,*) "Wrong command argument count. Power set to 2"
    power = 2
  endif


  inarr(:) = 0
  outarr(:) = 0
  open(unit=8, file='infile.dat', action='read')
  read(8,*) n, (inarr(i), i=1,n)
  close (unit=8)
  !    print 50, inarr
  !50 format (I4)
      k  = 0
      do i = 1, n
        if (inarr(i) .ne. 0) then
        k=k+1
        outarr(k) = inarr(i)**power
        end if 
      end do
      write(*,*) 'Total number of elements read is ', n
  !20  format (' Total number of elements read is',I4)
      write(*,*) 'Number of nonzero elements is ', k
  !30  format (' Number of nonzero elements is',I4)
      open(unit=10,file='outfile.dat',action='write')
      do i=1,k
        write(10,*) outarr(i)
      end do
end program powers