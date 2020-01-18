MMA = 1
run: run.d libs
run.d: run.F /usr/include/stdc-predef.h F/main.F F/xsection.F F/decl.h \
 distrib.h simd.h F/types.h extra.h include/generic.h F/user.h F/util.h \
 renconst/RenConst.h.F include/MassShift.h.F F/inline.h F/contains.h \
 process.h partonic.h squaredme/specs.h F/parton.h F/2to3.F \
 F/lumi_hadron.F F/xsection.h F/const.h \
 ../LoopTools-2.14/build/looptools.h F/model_mssm.h F/model_sm.h \
 F/model_fv.h F/model_sm.F F/cuts.F
