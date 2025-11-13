C plots crosses and circles
      SUBROUTINE CROSS(X,Y,W)
        IMPLICIT NONE
        REAL X,Y,W
	PRINT *,' CROSS  ',X,Y,W
	WRITE(12,110)W,'\'
110     FORMAT('''-'' with points pt 1 ps 'F6.4' title "",',A1)
      END
      SUBROUTINE CIRCLE(X,Y,R)
        IMPLICIT NONE
	REAL X,Y,R
	PRINT *,' CIRCLE  ',X,Y,R
	WRITE(12,110)R,'\'
	WRITE(12,111)R,'\'
110     FORMAT('''-'' with points pt 1 ps 'F6.4' title "",',A1)
111     FORMAT('''-'' with points pt 6 ps 'F6.4' title "",',A1)
      END
      SUBROUTINE DISPLAY
        CALL SYSTEM('gnuplot -p points.gp')
      END
      PROGRAM PPOINT
        IMPLICIT NONE
        INTEGER I,MAX
        CHARACTER*16 FNAME
        REAL X(10000),Y(10000),C(10000)
        PARAMETER(MAX=100)
        WRITE(0,*) 'ENTER THE POINTS INPUT FILE NAME'
        READ *,FNAME
        OPEN(UNIT=11,STATUS='UNKNOWN',FILE=FNAME)
        OPEN(UNIT=12,STATUS='UNKNOWN',FILE='points.gp')
        WRITE(12,*) 'set size square'
        WRITE(12,*) 'set xrange [-500:500]'
        WRITE(12,*) 'set yrange [-500:500]'
        WRITE(12,*) 'plot \'
        DO 10,I=1,MAX
            READ (11,*,END=30) X(I),Y(I),C(I)
	    WRITE(0,*) X(I),Y(I),C(I)
30	    IF(C(I).LT.0) THEN
	            CALL CIRCLE(X(I),Y(I),ABS(C(I))/10**8)
	    ELSE
	            CALL CROSS(X(I),Y(I),C(I)/10**8)
	    END IF
10	CONTINUE
        CLOSE(11)
	DO 20,I=1,MAX
	    IF(C(I).LT.0) THEN
	        WRITE(12,112)X(I),Y(I)
	        WRITE(12,114)'e'
	        WRITE(12,112)X(I),Y(I)
	        WRITE(12,114)'e'
	    ELSE
	        WRITE(12,112)X(I),Y(I)
        	WRITE(12,114)'e'
	    END IF
20	CONTINUE
        CLOSE(12)
	CALL DISPLAY
112	FORMAT(F11.6' 'F11.6)
114	FORMAT(A1)
      END
