      PROGRAM PLOT2
        INTEGER PGOPEN
C-----------------------------------------------------------------------

C
      IF (PGOPEN('?') .LE. 0) STOP
C-----------------------------------------------------------------------
C
C Finally, call PGCLOS to terminate things properly.
C
      CALL PGCLOS

      END
