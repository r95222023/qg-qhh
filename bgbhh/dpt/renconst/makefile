LIBS += $(LIB)
VPATH := $(DIR):$(VPATH)
OBJS_RC :=

OBJS := \
  $(DIR)RenConst.o

OBJS_RC += $(OBJS)

$(LIB)($(OBJS)): F-renconst.d $(DIR)RenConst.h.F


$(LIB): $(LIB)($(OBJS_RC))

