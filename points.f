C plots crosses and circles
      SUBROUTINE CROSS(X,Y,W)
        IMPLICIT NONE
        REAL X,Y,W
	PRINT *,' CROSS  ',X,Y,W
        WRITE(13,112)X,Y
        WRITE(13,114)'e'
	WRITE(12,110)W
110     FORMAT('''newpoints.dat'' with points pt 1 ps 'F6.4' title "",')
112	FORMAT(F11.6' 'F11.6)
114	FORMAT(A1)
      END
      SUBROUTINE CIRCLE(X,Y,R)
        IMPLICIT NONE
	    REAL X,Y,R
	PRINT *,' CIRCLE  ',X,Y,R
        WRITE(13,112)X,Y
        WRITE(13,114)'e'
        WRITE(13,112)X,Y
        WRITE(13,114)'e'
	WRITE(12,110)R
	WRITE(12,111)R
110     FORMAT('''newpoints.dat'' with points pt 1 ps 'F6.4' title "",')
111     FORMAT('''newpoints.dat'' with points pt 6 ps 'F6.4' title "",')
112	FORMAT(F11.6' 'F11.6)
114	FORMAT(A1)
      END
      SUBROUTINE DISPLAY
        CALL SYSTEM('gnuplot -p points.gp')
      END
      PROGRAM PPOINT
        IMPLICIT NONE
        INTEGER I
        CHARACTER*16 FNAME
        REAL X(10000),Y(10000),C(10000)
        WRITE(0,*) 'ENTER THE POINTS INPUT FILE NAME'
        READ *,FNAME
        OPEN(UNIT=11,STATUS='UNKNOWN',FILE=FNAME)
        OPEN(UNIT=12,STATUS='UNKNOWN',FILE='points.gp')
        OPEN(UNIT=13,STATUS='UNKNOWN',FILE='newpoints.dat')
        WRITE(12,*) 'set size square'
        WRITE(12,*) 'set xrange [-500:500]'
        WRITE(12,*) 'set yrange [-500:500]'
        WRITE(12,*) 'plot \'
        DO 10,I=1,10
            READ *,X(I),Y(I),C(I)
	    PRINT *,X(I),Y(I),C(I)
	    IF(C(I).LT.0) THEN
	            CALL CIRCLE(X(I),Y(I),ABS(C(I))/10**8)
	    ELSE
	            CALL CROSS(X(I),Y(I),C(I)/10**8)
	    END IF
10	    CONTINUE
        CLOSE(11)
        CLOSE(12)
        CLOSE(13)
	CALL DISPLAY
      END
