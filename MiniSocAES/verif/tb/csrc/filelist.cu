LDVERSION= $(shell $(PIC_LD) -v | grep -q 2.3 ;echo $$?)
ifeq ($(LDVERSION), 0)
     LD_NORELAX_FLAG= --no-relax
endif

ARCHIVE_OBJS=
ARCHIVE_OBJS += _3557445_archive_1.so
_3557445_archive_1.so : archive.0/_3557445_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -Bsymbolic $(LD_NORELAX_FLAG)  -o .//../build/vcs/minisoc_top_sim.daidir//_3557445_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../build/vcs/minisoc_top_sim.daidir//_3557445_archive_1.so $@




VCS_CU_ARC_OBJS = 


O0_OBJS =

$(O0_OBJS) : %.o: %.c
	$(CC_CG) $(CFLAGS_O0) -c -o $@ $<


%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<

CU_UDP_OBJS = \


CU_UDP_OBJS += 
CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \
objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

