* user.h
* the model declarations should be inserted here
* as well as any kind of user definition
* this file is part of FormCalc
* last modified 10 Feb 17 th


#ifndef USER_H
#define USER_H
* declarations for the whole file (e.g. preprocessor defs)

#define NINJA
c#define SAMURAI
c#define CUTTOOLS

#else
* declarations for every subroutine
        integer istep
        common /userpara/ istep
c#include "opp.h"
#include "model_mssm.h"

#endif

