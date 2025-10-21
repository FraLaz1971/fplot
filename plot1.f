      PROGRAM PLOT1
	CHARACTER*64 VALUE
	INTEGER LENGTH
	REAL X, Y, X1, X2, Y1, Y2
        INTEGER I
        REAL XS(5),YS(5), XR(100), YR(100)
        INTEGER PGOPEN
        DATA XS/1.,2.,3.,4.,5./
        DATA YS/1.,4.,9.,16.,25./
	IF (PGOPEN('?').LE.0) STOP
C
C Information available from PGQINF:
C
      CALL PGQINF('version',  VALUE, LENGTH)
      WRITE (*,*) 'version=', VALUE(:LENGTH)
      CALL PGQINF('state',    VALUE, LENGTH)
      WRITE (*,*) 'state=',   VALUE(:LENGTH)
      CALL PGQINF('user',     VALUE, LENGTH)
      WRITE (*,*) 'user=',    VALUE(:LENGTH)
      CALL PGQINF('now',      VALUE, LENGTH)
      WRITE (*,*) 'now=',     VALUE(:LENGTH)
      CALL PGQINF('device',   VALUE, LENGTH)
      WRITE (*,*) 'device=',  VALUE(:LENGTH)
      CALL PGQINF('file',     VALUE, LENGTH)
      WRITE (*,*) 'file=',    VALUE(:LENGTH)
      CALL PGQINF('type',     VALUE, LENGTH)
      WRITE (*,*) 'type=',    VALUE(:LENGTH)
      CALL PGQINF('dev/type', VALUE, LENGTH)
      WRITE (*,*) 'dev/type=',VALUE(:LENGTH)
      CALL PGQINF('hardcopy', VALUE, LENGTH)
      WRITE (*,*) 'hardcopy=',VALUE(:LENGTH)
      CALL PGQINF('terminal', VALUE, LENGTH)
      WRITE (*,*) 'terminal=',VALUE(:LENGTH)
      CALL PGQINF('cursor',   VALUE, LENGTH)
      WRITE (*,*) 'cursor=',  VALUE(:LENGTH)
C
C Get view surface dimensions:
C
      CALL PGQVSZ(1, X1, X2, Y1, Y2)
      X = X2-X1
      Y = Y2-Y1
      WRITE (*,100) X, Y, X*25.4, Y*25.4
100    FORMAT (' Plot dimensions (x,y; inches): ',F9.2,', ',F9.2
     1         '                          (mm): ',F9.2,', ',F9.2)


C-----------------------------------------------------------------------
C This example illustrates the use of PGENV, PGLAB, PGPT, PGLINE.
C-----------------------------------------------------------------------
C
C Call PGENV to specify the range of the axes and to draw a box, and
C PGLAB to label it. The x-axis runs from 0 to 10, and y from 0 to 20.
C
      CALL PGENV(0.,10.,0.,20.,0,1)
      CALL PGLAB('(x)', '(y)', 'PGPLOT Example 1:  y = x\u2')
C
C Mark five points (coordinates in arrays XS and YS), using symbol
C number 9.
C
      CALL PGPT(5,XS,YS,-6)
C
C Compute the function at 60 points, and use PGLINE to draw it.
C
      DO 10 I=1,60
          XR(I) = 0.1*I
          YR(I) = XR(I)**2
10    CONTINUE
      CALL PGLINE(60,XR,YR)

	CALL PGCLOS
      END
