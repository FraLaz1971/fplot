      PROGRAM PLOT2
	IMPLICIT NONE
        INTEGER PGOPEN
C-----------------------------------------------------------------------

C-----------------------------------------------------------------------
C This example illustrates the use of PGBOX and attribute routines to
C mix colors and line-styles.
C----------------------------------------------------------------------
      REAL PI
      PARAMETER (PI=3.14159265359)
      INTEGER I
      REAL XR(360), YR(360)
      REAL ARG
C
      IF (PGOPEN('myplot.png/PNG') .LE. 0) STOP

C
C Call PGENV to initialize the viewport and window; the
C AXIS argument is -2, so no frame or labels will be drawn.
C
      CALL PGENV(0.,720.,-2.0,2.0,0,-2)
      CALL PGSAVE
C
C Set the color index for the axes and grid (index 5 = cyan).
C Call PGBOX to draw first a grid at low brightness, and then a
C frame and axes at full brightness. Note that as the x-axis is
C to represent an angle in degrees, we request an explicit tick 
C interval of 90 deg with subdivisions at 30 deg, as multiples of
C 3 are a more natural division than the default.
C
      CALL PGSCI(14)
      CALL PGBOX('G',30.0,0,'G',0.2,0)
      CALL PGSCI(5)
      CALL PGBOX('ABCTSN',90.0,3,'ABCTSNV',0.0,0)
C
C Call PGLAB to label the graph in a different color (3=green).
C
      CALL PGSCI(3)
      CALL PGLAB('x (degrees)','f(x)','PGPLOT Example 3')
C
C Compute the function to be plotted: a trig function of an
C angle in degrees, computed every 2 degrees.
C
      DO 20 I=1,360
          XR(I) = 2.0*I
          ARG = XR(I)/180.0*PI
          YR(I) = SIN(ARG) + 0.5*COS(2.0*ARG) + 
     1                0.5*SIN(1.5*ARG+PI/3.0)
20    CONTINUE
C
C Change the color (6=magenta), line-style (2=dashed), and line
C width and draw the function.
C
      CALL PGSCI(6)
      CALL PGSLS(2)
      CALL PGSLW(3)
      CALL PGLINE(360,XR,YR)
C
C Restore attributes to defaults.
C
      CALL PGUNSA
C-----------------------------------------------------------------------

C
C Finally, call PGCLOS to terminate things properly.
C
      CALL PGCLOS

      END
