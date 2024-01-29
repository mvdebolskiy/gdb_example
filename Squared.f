   PROGRAM SQUARES
      INTEGER INARR(10), OUTARR(10), I, K
! Read the input array from the data file.
      OPEN(UNIT=8, FILE='datafile.dat', STATUS='OLD')
      READ(8,*,END=5) N, (INARR(I), I=1,N)
  5   CLOSE (UNIT=8)
 
! Square all nonzero elements and store in OUTARR.
      K  = 0
      DO I = 1, N
        IF (INARR(I) .NE. 0) THEN
        OUTARR(K) = INARR(I)**2
        ENDIF
      END DO
 
! Print the squared output values. Then stop.
      PRINT 20, N
  20  FORMAT (' Total number of elements read is',I4)
      PRINT 30, K
  30  FORMAT (' Number of nonzero elements is',I4)
      DO I=1,K
        PRINT 40, I, OUTARR(K)
  40    FORMAT(' Element', I4, 'Has value',I6)
      END DO
  END PROGRAM SQUARES