!
!
!
	PROGRAM main
	IMPLICIT NONE
	REAL*4 :: sinf
	REAL*4 :: cosf
	REAL*8 :: sind
	REAL*8 :: cosd
	REAL*8, PARAMETER :: PI=3.1415926535897932384626433832795029
	REAL*4 :: x
	REAL*8 :: xl

	x = PI/2.0
	WRITE(6,*) "sinf(PI/2)", sinf(x)
	x = PI*3.0
	WRITE(6,*) "cosf(3 * PI)", cosf(x)
	xl = -PI * 5.8
	WRITE(6,*) "sind(-5.8 * PI)", sind(xl)
	xl = -PI * 20.4
	WRITE(6,*) "cosd(-20.4 * PI )", cosd(xl)
	END
