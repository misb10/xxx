###############################################################################
# Initialize Octal UART stuff
# tyGSOctalDrv(int maxModules)
tyGSOctalDrv(1)
#tyGSOctalModuleInit(char *name, int interruptVector, int carrier, int slot)
tyGSOctalModuleInit("GSIP_OCTAL232", 0x80, 0, 0)

# int tyGSAsynInit(char *port, int uart, int channel, int baud, char parity, int sbits,
#                  int dbits, char handshake, char *eomstr)
tyGSAsynInit("serial1",  0, 0, 9600,'N',2,8,'N',"")  /* SRS570 */
tyGSAsynInit("serial2",  0, 1,19200,'E',1,8,'N',"")  /* MKS */
tyGSAsynInit("serial3",  0, 2, 9600,'E',1,7,'N',"")  /* Digitel */
tyGSAsynInit("serial4",  0, 3, 9600,'N',1,8,'N',"")  /* MPC */
tyGSAsynInit("serial5",  0, 4, 9600,'E',1,7,'N',"")  /* McClennan PM304 */
tyGSAsynInit("serial6",  0, 5,19200,'N',1,8,'N',"")  /* Keithley 2000 */
tyGSAsynInit("serial7",  0, 6, 9600,'N',1,8,'N',"")  /* Oxford ILM cryometer */
tyGSAsynInit("serial8",  0, 7,19200,'N',1,8,'N',"")  /* Love controllers */

# Newport MM4000 driver setup parameters:
#     (1) maximum # of controllers,
#     (2) motor task polling rate (min=1Hz, max=60Hz)
MM4000Setup(1, 10)

# Newport MM4000 driver configuration parameters:
#     (1) controller
#     (2) asyn port name (e.g. serial1 or gpib1)
#     (3) GPIB address (0 for serial)
MM4000Config(0, "serial7", 0)

# Newport PM500 driver setup parameters:
#     (1) maximum number of controllers in system
#     (2) motor task polling rate (min=1Hz,max=60Hz)
#PM500Setup(1, 10)

# Newport PM500 configuration parameters:
#     (1) controller
#     (2) asyn port name (e.g. serial1 or gpib1)
#PM500Config(0, "serial3")

# McClennan PM304 driver setup parameters:
#     (1) maximum number of controllers in system
#     (2) motor task polling rate (min=1Hz, max=60Hz)
#PM304Setup(1, 10)

# McClennan PM304 driver configuration parameters:
#     (1) controller being configured
#     (2) MPF serial server name (string)
#     (3) Number of axes on this controller
#PM304Config(0, "serial4", 1)

# ACS MCB-4B driver setup parameters:
#     (1) maximum number of controllers in system
#     (2) motor task polling rate (min=1Hz, max=60Hz)
#MCB4BSetup(1, 10)

# ACS MCB-4B driver configuration parameters:
#     (1) controller being configured
#     (2) asyn port name (string)
#MCB4BConfig(0, "serial5")

##### Pico Motors (Ernest Williams MHATT-CAT)
##### Motors (see picMot.substitutions in same directory as this file) ####
#dbLoadTemplate("picMot.substitutions")

# Load asynRecord records on all ports
dbLoadTemplate("asynRecord.template")

# send impromptu message to serial device, parse reply
# (was serial_OI_block)
#dbLoadRecords("$(IP)/ipApp/Db/deviceCmdReply.db","P=xxx:,N=1,PORT=serial5,ADDR=0,OMAX=100,IMAX=100")

# Stanford Research Systems SR570 Current Preamplifier
#dbLoadRecords("$(IP)/ipApp/Db/SR570.db", "P=xxx:,A=A1,PORT=serial1")

# Lakeshore DRC-93CA Temperature Controller
#dbLoadRecords("$(IP)/ipApp/Db/LakeShoreDRC-93CA.db", "P=xxx:,Q=TC1,PORT=serial4")

# Huber DMC9200 DC Motor Controller
#dbLoadRecords("$(IP)/ipApp/Db/HuberDMC9200.db", "P=xxx:,Q=DMC1:,PORT=serial5")

# Oriel 18011 Encoder Mike
#dbLoadRecords("$(IP)/ipApp/Db/eMike.db", "P=xxx:,M=em1,PORT=serial3")

# Keithley 2000 DMM
#dbLoadRecords("$(IP)/ipApp/Db/Keithley2kDMM_mf.db","P=xxx:,Dmm=D1,PORT=serial1")

# Oxford Cyberstar X1000 Scintillation detector and pulse processing unit
#dbLoadRecords("$(IP)/ipApp/Db/Oxford_X1k.db","P=xxx:,S=s1,PORT=serial4")

# Oxford ILM202 Cryogen Level Meter (Serial)
#dbLoadRecords("$(IP)/ipApp/Db/Oxford_ILM202.db","P=xxx:,S=s1,PORT=serial5")

# Elcomat autocollimator
#dbLoadRecords("$(IP)/ipApp/Db/Elcomat.db", "P=xxx:,PORT=serial8")

# Eurotherm temp controller
#dbLoadRecords("$(IP)/ipApp/Db/Eurotherm.db","P=xxx:,PORT=serial7")

# MKS vacuum gauges
#dbLoadRecords("$(IP)/ipApp/Db/MKS.db","P=xxx:,PORT=serial2,CC1=cc1,CC2=cc3,PR1=pr1,PR2=pr3")

# PI Digitel 500/1500 pump
#dbLoadRecords("$(IP)/ipApp/Db/Digitel.db","xxx:,PUMP=ip1,PORT=serial3")

# PI MPC ion pump
#dbLoadRecords("$(IP)/ipApp/Db/MPC.db","P=xxx:,PUMP=ip2,PORT=serial4,PA=0,PN=1")

# PI MPC TSP (titanium sublimation pump)
#dbLoadRecords("$(IP)/ipApp/Db/TSP.db","P=xxx:,TSP=tsp1,PORT=serial4,PA=0")

# Heidenhain ND261 encoder (for PSL monochromator)
#dbLoadRecords("$(IP)/ipApp/Db/heidND261.db", "P=xxx:,PORT=serial1")

# Love Controllers
#devLoveDebug=1
#loveServerDebug=1
#dbLoadRecords("$(IP)/ipApp/Db/love.db", "P=xxx:,Q=Love_0,C=0,PORT=PORT2,ADDR=1")

