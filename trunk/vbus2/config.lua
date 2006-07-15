math.randomseed(os.time())

n_farPlane(4000)

--n_loadVehicle("pr110.lua", 0, 0, 0, 5, 1) 
--n_loadVehicle("pr110.lua", 40, -10, 0, 90, 1) 
n_loadVehicle("model\\jelcz pr110\\pr110.lua", 971, 500, 0, 90, 1) --mikowo


n_createBox(-100,-100,0, 3,3,3, 50, 1,0,0,1)

for x = -200, -100, 33 do
	for y = 400, 500, 33 do
	--	n_createStatic("windgen.lua",x,y,-34,math.random(-45,45))
	end
end

--n_createStatic("windgen.lua",0,0,-34,math.random(-45,45))