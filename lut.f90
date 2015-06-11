!.f90 : Thomas Tsai, thomas@life100.cc
!.f90 : sine, cosine lookup table function
! sin(-x)=-sin(x) => odd function
! cos(-x)=cos(x) => even function

	REAL*4 function sinf(x)
		use trigon_lut
		implicit none
		REAL*4 :: x
		INTEGER :: i
		x = AMOD(x, REAL(2.0 * PI))
		i = INT(x / SLICE)
		if( i .ge. 0 ) then
			sinf=sinf_lut(i)
		else
			sinf=-sinf_lut(-i)
		endif
		return
	end function sinf

	REAL*8 function sind(x)
		use trigon_lut
		implicit none
		REAL*8 x
		INTEGER i
		x = DMOD(x, 2.0 * PI)
		i = INT(x / SLICE)
		if( i .ge. 0 ) then
			sind=sind_lut(i)
		else
			sind=-sind_lut(-i)
		endif
		return
	end function sind

	REAL*4 function cosf(x)
		use trigon_lut
		implicit none
		REAL*4 x
		INTEGER i
		x = AMOD(x, REAL(2.0 * PI))
		i = INT(x / SLICE)
		if( i .ge. 0 ) then
			cosf=cosf_lut(i)
		else
			cosf=cosf_lut(-i)
		endif
		return
	end function cosf

	REAL*8 function cosd(x)
		use trigon_lut
		implicit none
		REAL*8 x
		INTEGER i
		x = DMOD(x, 2.0 * PI)
		i = INT(x / SLICE)
		if( i .ge. 0 ) then
			cosd=cosd_lut(i)
		else
			cosd=cosd_lut(-i)
		endif
		return
	end function cosd

