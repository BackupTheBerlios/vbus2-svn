
n_addModel("windgen.3ds")

o= 1+math.random()*2
n_pivotPoint("rotor",0,0,20)
n_addKey("rotor", 0     ,  0, 0, 0,    0, 0, 1 ,0)
n_addKey("rotor", 0.25/o,  0, 0, 0,   90, 0, 1 ,0)
n_addKey("rotor", 0.50/o,  0, 0, 0,  180, 0, 1 ,0)
n_addKey("rotor", 0.75/o,  0, 0, 0,  270, 0, 1 ,0)
n_addKey("rotor", 1.00/o,  0, 0, 0,  360, 0, 1 ,0)

--n_addCommand("start", "setAnimV", "rotor", 1)
--n_addCommand("stop", "setAnimV", "rotor", 0)
n_addCommand("start", "setAnimLoop", "rotor", 1)
n_addCommand("stop", "setAnimLoop", "rotor", 0)
n_addState("tg", 0, "stop", "")
n_addState("tg", 1, "start", "")

n_addCommand("toggle", "incLState", "tg", 1)

n_addPick("rotor","toggle",0)