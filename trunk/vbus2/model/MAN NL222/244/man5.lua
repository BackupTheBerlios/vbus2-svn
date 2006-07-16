n_addModel("man5.3ds")
n_addModelEx("steeringWheel.ive",-0.85,8.3,1.2,20,0,0)
n_collisionBox(-1.13809, -3.39061, 0.237674,  1.13809, 8.53558, 3)
n_setMassMatrix(9870, 0.002, -0.011, 0.411,  0, 0, 0)

n_setOffset(0,  -0.85, 7.6, 1.65,   0, 0)
n_setOffset(1,  -1.4, 8.5, 2.24, -10, 180)
n_setOffset(2,   1.4, 8.5, 2.24, -10, 180)

spring= 6400
shock= math.sqrt(spring)
n_addTire("pr110-fwheel.ive",  1.00, 6.46, 0.4,  40, 0.235, 0.5, shock, spring, 0.3, 1, 0, 1)
n_addTire("pr110-fwheel.ive", -1.00, 6.46, 0.4,  40, 0.235, 0.5, shock, spring, 0.3, 1, 0, 1)
n_addTire("pr110-rwheel.ive",  0.87, 0.0, 0.4,  40, 0.235, 0.5, shock, spring, 0.3, 0, 1, 1)
n_addTire("pr110-rwheel.ive", -0.87, 0.0, 0.4,  40, 0.235, 0.5, shock, spring, 0.3, 0, 1, 1)

n_loadSound("engine", "engine.wav", 600, 1, 1)

n_transmission(6.308, 0.75)

n_engine(1000)
n_torqePoint(1400,1000)
n_torqePoint(1400,1390)
n_torqePoint(1700,1250)
n_torqePoint(1900,1160)

n_gear(-3.46)
n_gear(0.00)
n_gear( 2.25)
n_gear( 1.36)
n_gear( 1)

n_loadSound("dopen1", "dopen.wav", 0, 1, 0)
n_loadSound("dopen2", "dopen.wav", 0, 1, 0)
n_loadSound("dopen3", "dopen.wav", 0, 1, 0)
n_loadSound("dopen4", "dopen.wav", 0, 1, 0)
n_loadSound("dsignal", "dzwonek.wav", 0, 1, 1)

function doorRanim(name, x, y, speed) 
	n_pivotPoint(name, x, y, 0)
	n_addKey(name,     0,   0  , 0, 0,   0, 0, 0 ,0)
	n_addKey(name, speed,  -0.15, 0, 0,  80, 0, 0 ,1)
end

function doorLanim(name, x, y, speed) 
	n_pivotPoint(name, x, y, 0)
	n_addKey(name,     0,   0  , 0, 0,   0, 0, 0 ,0)
	n_addKey(name, speed,  -0.15, 0, 0, -80, 0, 0 ,1)
end

function door(name, x, y, speed, anim, delay, sound_o, sound_c)

	anim(name.."1_1", x, y, speed)
	anim(name.."2_1", x, y, speed)
	anim(name.."2_2", x, y, speed)

	n_setDelay(name.."_c", delay)
	n_addCommand(name.."_c", "playSound", sound_c)
	n_addCommand(name.."_c", "setAnimV", name.."1_1", -1)
	n_addCommand(name.."_c", "setAnimV", name.."2_1", -1)
	n_addCommand(name.."_c", "setAnimV", name.."2_2", -1)
	n_setDelay(name.."_o", delay)
	n_addCommand(name.."_o", "playSound", sound_o)
	n_addCommand(name.."_o", "setAnimV", name.."1_1", 1)
	n_addCommand(name.."_o", "setAnimV", name.."2_1", 1)
	n_addCommand(name.."_o", "setAnimV", name.."2_2", 1)
	n_addState(name, 0, name.."_c", "")
	n_addState(name, 1, name.."_o", "")

end

door("d0r", 1.0721,  8.1900, 2.0, doorRanim, 0.08, "dopen1", "dopen1")
door("d1l", 1.0721,  7.45, 1.9, doorLanim, 0.04, "dopen2", "dopen2")

door("d2r", 1.0721,  3.6, 2.6, doorRanim, 0.15, "dopen3", "dopen3")
door("d2l", 1.0721,  2.8, 2, doorLanim, 0.15, "dopen3", "dopen3")

door("d3r", 1.0721, -1.02, 2.4, doorRanim, 0.11, "dopen4", "dopen4")
door("d3l", 1.05, -1.8, 2, doorLanim, 0.15, "dopen4", "dopen4")

n_addCommand("keyDown_g", "incLState", "d0r", 1)
n_addCommand("keyDown_h", "incLState", "d1l", 1)
n_addCommand("keyDown_j", "incLState", "d2r", 1)
n_addCommand("keyDown_j", "incLState", "d2l", 1)
n_addCommand("keyDown_k", "incLState", "d3r", 1)
n_addCommand("keyDown_k", "incLState", "d3l", 1)


n_addCommand("closeAll", "setState", "d1l", 0)
n_addCommand("closeAll", "setState", "d2r", 0)
n_addCommand("closeAll", "setState", "d2l", 0)
n_addCommand("closeAll", "setState", "d3r", 0)
n_addCommand("closeAll", "setState", "d3l", 0)


n_addCommand("dsignalPlay", "playSound", "dsignal")

n_addCommand("keyUp_f", "setReleaseEvent", "", 0)
n_addCommand("keyUp_f", "stopSound", "dsignal")
n_addCommand("keyUp_f", "equal", "d1l", 1, "closeAll")
n_addCommand("keyUp_f", "equal", "d2r", 1, "closeAll")
n_addCommand("keyUp_f", "equal", "d2l", 1, "closeAll")
n_addCommand("keyUp_f", "equal", "d3r", 1, "closeAll")
n_addCommand("keyUp_f", "equal", "d3l", 1, "closeAll")
n_addCommand("keyUp_f", "setState", "d1l", 1)
n_addCommand("keyUp_f", "setState", "d2r", 1)
n_addCommand("keyUp_f", "setState", "d2l", 1)
n_addCommand("keyUp_f", "setState", "d3r", 1)
n_addCommand("keyUp_f", "setState", "d3l", 1)

n_addCommand("keyDown_f", "setReleaseEvent", "keyUp_f", 0)
n_addCommand("keyDown_f", "equal", "d1l", 1, "dsignalPlay")
n_addCommand("keyDown_f", "equal", "d2r", 1, "dsignalPlay")
n_addCommand("keyDown_f", "equal", "d2l", 1, "dsignalPlay")
n_addCommand("keyDown_f", "equal", "d3r", 1, "dsignalPlay")
n_addCommand("keyDown_f", "equal", "d3l", 1, "dsignalPlay")

n_addPick("zeg","keyDown_f",0)
--n_addPick("d1l2_1","keyDown_8",0)