C WRITES GIVEN NUMBER OF RANDOM POINTS
      PROGRAM WRIPOI
        IMPLICIT NONE
        INTEGER N,I
        integer m, clock, count
        integer seed(10000)
        REAL X(10000),Y(10000),C(10000)
! --- Seeding the random number generator ---
! Get the required size for the seed array
        call RANDOM_SEED(size = m)
! Allocate the seed array
c    allocate(seed(n))
! Get a time-dependent value from the system clock
        call SYSTEM_CLOCK(count=clock)
! Populate the seed array with values based on the clock, for better entropy
        do 20,i=1,m
          seed = clock + 37 * (i - 1)
20      continue
! Put the new seed into the generator
        call RANDOM_SEED(put = seed)
! Deallocate the seed array


! --- Generate an array of random numbers ---
        call RANDOM_NUMBER(X)
        call RANDOM_NUMBER(Y)
        call RANDOM_NUMBER(C)
c        print *, "Random array values: ", x,y
100     WRITE(0,*) 'ENTER N. OF POINTS [1,10000]'
        READ *,N
        IF ((N.LT.1).OR.(N.GT.10000)) THEN
         PRINT *,'ERROR: out of range'
         GOTO 100
        END IF
        DO 10,I=1,N
          PRINT *,X(I)*1000-500,Y(I)*1000-500,C(I)*1000000000-500000000
10      CONTINUE
C	PRINT *,0.0,0.0,0.0
      END
