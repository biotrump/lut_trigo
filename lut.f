C.f77 : Thomas Tsai, thomas@life100.cc
C sin(-x)=-sin(x)
C cos(-x)=cos(x)

	REAL*4 function sinf(x)
	use trigon_lut
	implicit none
	REAL*4 x
	INTEGER i
	x = x * AMOD (2.0 * PI)
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
	x = x * DMOD (2.0 * PI)
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
	x = x * AMOD (2.0 * PI)
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
	x = x * DMOD (2.0 * PI)
	i = INT(x / SLICE)
	if( i .ge. 0 ) then
		cosd=cosd_lut(i)
	else
		cosd=cosd_lut(-i)
	endif
	return
	end function cosd
