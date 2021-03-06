#if 0
* penta.F
* form factors for {V[5, {Glu1}], F[4, {3, Col2}]} -> {S[1], S[1], F[4, {3, Col5}]}
* generated by FormCalc 9.6 (16 Apr 2018) on 15-Jan-2020 16:50
#endif

#include "vars.h"
#include "inline.h"
#include "contains.h"


	subroutine penta
	implicit none

#include "vars.h"
#include "inline.h"

        Cloop(HelAll(1)) = 
     &   Cloop(HelAll(1)) + 
     &    Alfa2/(144.D0*CW2**2*MW2**2*SW2**2)*
     &     (GS*(MW2**2*SW2**2*Sub3873 + 18*CW2**2*Sub3991))

#if DEBUG >= 4
	DEB("penta:Cloop(1)", Cloop(HelAll(1)))
#endif

#include "contains.h"

	end

