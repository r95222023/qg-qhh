#if 0
* box.F
* form factors for {V[5, {Glu1}], F[4, {3, Col2}]} -> {S[1], S[1], F[4, {3, Col5}]}
* generated by FormCalc 9.6 (16 Apr 2018) on 11-Jan-2020 21:31
#endif

#include "vars.h"
#include "inline.h"
#include "contains.h"


	subroutine box
	implicit none

#include "vars.h"
#include "inline.h"

        Cloop(HelAll(1)) = 
     &   Cloop(HelAll(1)) - 
     &    Alfa2*(GS*(1/144.D0*
     &          (Sub3808/(MB2 - S) + 
     &            Sub3848/(MB2 + 2*MH2 - S - T - T14)) + 
     &         1/36.D0*(Pair1*Sub3778 + Pair3*Sub3786 + 
     &            1/CW2**2*Sub3780) + 
     &         1/SW2**2*(1/8.D0*Sub3783 + 
     &            1/24.D0*(MH2*Sub3817)/(MH2 - S34))))

#if DEBUG >= 4
	DEB("box:Cloop(1)", Cloop(HelAll(1)))
#endif

#include "contains.h"

	end

