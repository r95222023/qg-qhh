#if 0
* born.F
* form factors for {V[5, {Glu1}], F[4, {3, Col2}]} -> {S[1], S[1], F[4, {3, Col5}]}
* generated by FormCalc 9.6 (16 Apr 2018) on 15-Jan-2020 16:50
#endif

#include "vars.h"
#include "inline.h"
#include "contains.h"


	subroutine born
	implicit none

#include "vars.h"
#include "inline.h"

        Cloop(HelAll(1)) = 
     &   Cloop(HelAll(1)) - 
     &    (Alfa*Pi)/(MW2*SW2)*
     &     (GS*((3*MB*MH2*Sub3782)/(MH2 - S34) - MB2*Sub3785))

#if DEBUG >= 4
	DEB("born:Cloop(1)", Cloop(HelAll(1)))
#endif

#include "contains.h"

	end

