
�
(Validation failed for board file %s:
 %s34*board2i
UC:/Xilinx/Vivado/2017.4/data/boards/board_files/PYNQ-Z2 board file v1.0/A.0/board.xml2default:default2E
1Frequency Parameter not provided for audio_clock
2default:defaultZ49-69h px� 
u
Command: %s
53*	vivadotcl2D
0link_design -top top_piano -part xc7a35tcsg324-12default:defaultZ4-113h px� 
g
#Design is defaulting to srcset: %s
437*	planAhead2
	sources_12default:defaultZ12-437h px� 
j
&Design is defaulting to constrset: %s
434*	planAhead2
	constrs_12default:defaultZ12-434h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2e
Qd:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/ip/dcm_clk/dcm_clk.dcp2default:default2
u_clk2default:defaultZ1-454h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
422default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2017.42default:defaultZ1-479h px� 
V
Loading part %s157*device2#
xc7a35tcsg324-12default:defaultZ21-403h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
�
LRemoving redundant IBUF, %s, from the path connected to top-level port: %s 
35*opt2+
u_clk/inst/clkin1_ibufg2default:default2
clk2default:defaultZ31-35h px� 
�
�Could not create '%s' constraint because net '%s' is not directly connected to top level port. '%s' is ignored by %s but preserved for implementation tool.
528*constraints2 
IBUF_LOW_PWR2default:default2#
u_clk/clk_in12default:default2 
IBUF_LOW_PWR2default:default2
Vivado2default:default2~
hD:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.runs/impl_1/.Xil/Vivado-12724-AlexD-Desktop/dcp3/dcm_clk.edf2default:default2
2862default:default8@Z18-550h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2m
Wd:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/ip/dcm_clk/dcm_clk_board.xdc2default:default2 

u_clk/inst	2default:default8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2m
Wd:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/ip/dcm_clk/dcm_clk_board.xdc2default:default2 

u_clk/inst	2default:default8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2g
Qd:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/ip/dcm_clk/dcm_clk.xdc2default:default2 

u_clk/inst	2default:default8Z20-848h px� 
�
%Done setting XDC timing constraints.
35*timing2g
Qd:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/ip/dcm_clk/dcm_clk.xdc2default:default2
572default:default8@Z38-35h px� 
�
Deriving generated clocks
2*timing2g
Qd:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/ip/dcm_clk/dcm_clk.xdc2default:default2
572default:default8@Z38-2h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
get_clocks: 2default:default2
00:00:112default:default2
00:00:102default:default2
1191.2662default:default2
563.5552default:defaultZ17-268h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2g
Qd:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/sources_1/ip/dcm_clk/dcm_clk.xdc2default:default2 

u_clk/inst	2default:default8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2c
MD:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/constrs_1/new/piano_EGo1.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2c
MD:/List_Vivado/2017_4/piano_EGo1/piano_EGo1.srcs/constrs_1/new/piano_EGo1.xdc2default:default8Z20-178h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
102default:default2
32default:default2
02default:default2
02default:defaultZ4-41h px� 
]
%s completed successfully
29*	vivadotcl2
link_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2!
link_design: 2default:default2
00:00:172default:default2
00:00:182default:default2
1191.2662default:default2
895.0662default:defaultZ17-268h px� 


End Record