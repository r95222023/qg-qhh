#if 0
* specs.h
* process specifications
* generated by FormCalc 9.6 (16 Apr 2018) on 11-Jan-2020 21:31
#endif

#undef FCVERSION
#define FCVERSION "FormCalc 9.6 (16 Apr 2018)"

#undef PROCNAME
#define PROCNAME "V5iF43iS1S1F43i"

#undef SQUAREDME_FUNC
#define SQUAREDME_FUNC SquaredME

#undef KIN
#define KIN "2to3.F"

#undef IDENTICALFACTOR
#define IDENTICALFACTOR 2

#undef DIRACFERMIONS
#define DIRACFERMIONS 0

#undef Compose
#define Compose(f,c,A,B,C,D,E) c(c(c(c(f(A,1,1),f(B,2,1)),f(C,3,2)),f(D,4,2)),f(E,5,2))

#undef Generic
#define Generic(f,c) Compose(f,c,PHOTON,FERMION,SCALAR,SCALAR,FERMION)

#undef Anti
#define Anti(f,c) Compose(f,c,1,1,1,1,1)

#undef Mass
#define Mass(f,c) Compose(f,c,0,MB,MH,MH,MB)

#undef Charge
#define Charge(f,c) Compose(f,c,0,-1/3.D0,0,0,-1/3.D0)

#undef ColorCharge
#define ColorCharge(f,c) Compose(f,c,Sqrt(3.D0),2/Sqrt(3.D0),0,0,2/Sqrt(3.D0))

