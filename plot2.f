      PROGRAM PLOT2
        INTEGER PGOPEN
C-----------------------------------------------------------------------
C This one is a graph of the
C sinc (sin x over x) function.
C-----------------------------------------------------------------------
        INTEGER I
        REAL XR(100), YR(100)

C
      IF (PGOPEN('?') .LE. 0) STOP
      CALL PGENV(-2.,10.,-0.4,1.2,0,1)
      CALL PGLAB('(x)', 'sin(x)/x', 
     $             'PGPLOT Example 2:  sin(x)/x Function')
      DO 20 I=1,100
          XR(I) = (I-50)/6.0
          YR(I) = 1.0
          IF (XR(I).NE.0.0) YR(I) = SIN(XR(I))/XR(I)
20    CONTINUE
      CALL PGLINE(100,XR,YR)
C-----------------------------------------------------------------------
C
C Finally, call PGCLOS to terminate things properly.
C
      CALL PGCLOS

      END
