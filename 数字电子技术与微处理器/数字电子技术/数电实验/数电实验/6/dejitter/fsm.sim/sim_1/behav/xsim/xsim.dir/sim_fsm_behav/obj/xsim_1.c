/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_14(char*, char *);
extern void execute_15(char*, char *);
extern void execute_16(char*, char *);
extern void execute_17(char*, char *);
extern void execute_24(char*, char *);
extern void execute_25(char*, char *);
extern void execute_4(char*, char *);
extern void execute_5(char*, char *);
extern void execute_7(char*, char *);
extern void execute_8(char*, char *);
extern void execute_9(char*, char *);
extern void execute_22(char*, char *);
extern void execute_11(char*, char *);
extern void execute_12(char*, char *);
extern void execute_13(char*, char *);
extern void execute_23(char*, char *);
extern void execute_19(char*, char *);
extern void execute_20(char*, char *);
extern void execute_21(char*, char *);
extern void execute_26(char*, char *);
extern void execute_27(char*, char *);
extern void execute_28(char*, char *);
extern void execute_29(char*, char *);
extern void execute_30(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[25] = {(funcp)execute_14, (funcp)execute_15, (funcp)execute_16, (funcp)execute_17, (funcp)execute_24, (funcp)execute_25, (funcp)execute_4, (funcp)execute_5, (funcp)execute_7, (funcp)execute_8, (funcp)execute_9, (funcp)execute_22, (funcp)execute_11, (funcp)execute_12, (funcp)execute_13, (funcp)execute_23, (funcp)execute_19, (funcp)execute_20, (funcp)execute_21, (funcp)execute_26, (funcp)execute_27, (funcp)execute_28, (funcp)execute_29, (funcp)execute_30, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 25;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/sim_fsm_behav/xsim.reloc",  (void **)funcTab, 25);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/sim_fsm_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/sim_fsm_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/sim_fsm_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/sim_fsm_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/sim_fsm_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
