@name Fifth Element
@inputs B1 B2 B3 B4 B5
@persist E2POS:vector ELEMENTS:array ELEMENT:entity ROCK1:vector ROCK2:vector ROCK3:vector ROCK4:vector E1 E2 E3 E4 E5 RADIUS


interval(500)

E5 = E1 + E2 + E3 + E4


if (first()) {
    
    E1 = 0
    E2 = 0
    E3 = 0
    E4 = 0
    E5 = 0
    
    RADIUS = 500
	
    E2CHIP = entity()
    E2POS = entity():pos()
    TORUSPOS = E2POS + vec(0,0,80)

    #propSpawn("models/cubic/props/crystal1.mdl", E2POS + vec(0,120,60), 0)
    #propSpawn("models/cubic/props/crystal1.mdl", E2POS + vec(0,-120,60), 0)
    #propSpawn("models/cubic/props/crystal1.mdl", E2POS + vec(120,0,60), 0)
    #propSpawn("models/cubic/props/crystal1.mdl", E2POS + vec(-120,0,60), 0)
    
# BASE PILLARS
holoCreate(1)
holoPos(1, E2POS + vec(RADIUS,0,25))
holoModel(1, "models/props/de_inferno/brickpillara.mdl")
holoScale(1, vec(0.75,0.75,0.55))

holoCreate(2)
holoPos(2, E2POS + vec(-RADIUS,0,25))
holoModel(2, "models/props/de_inferno/brickpillara.mdl")
holoScale(2, vec(0.75,0.75,0.55))

holoCreate(3)
holoPos(3, E2POS + vec(0,-RADIUS,25))
holoModel(3, "models/props/de_inferno/brickpillara.mdl")
holoScale(3, vec(0.75,0.75,0.55))

holoCreate(4)
holoPos(4, E2POS + vec(0,RADIUS,25))
holoModel(4, "models/props/de_inferno/brickpillara.mdl")
holoScale(4, vec(0.75,0.75,0.55))


# STONES (IDLE)
holoCreate(5)
holoPos(5, holoEntity(1):pos() + vec(0,0,20))
holoMaterial(5, "models/props_c17/furniturefabric001a")
holoScale(5, vec(0.9,0.9,5))

holoCreate(6)
holoPos(6, holoEntity(2):pos() + vec(0,0,20))
holoMaterial(6, "models/props_c17/furniturefabric001a")
holoScale(6, vec(0.9,0.9,5))

holoCreate(7)
holoPos(7, holoEntity(3):pos() + vec(0,0,20))
holoMaterial(7, "models/props_c17/furniturefabric001a")
holoScale(7, vec(0.9,0.9,5))

holoCreate(8)
holoPos(8, holoEntity(4):pos() + vec(0,0,20))
holoMaterial(8, "models/props_c17/furniturefabric001a")
holoScale(8, vec(0.9,0.9,5))


holoCreate(50)
holoPos(50, E2POS - vec(0,0,20))
holoModel(50, "models/jdavis/angel_statue/angel_statue.mdl")
holoScale(50, vec(0.55,0.55,0.55))
holoColor(50, vec(45,45,45))

    # COLOURS
    ROCK1 = vec(255,0,77) # PINK
    ROCK2 = vec(255,255,0) # YELLOW
    ROCK3 = vec(0,255,0) # GREEN
    ROCK4 = vec(0,77,255) # BLUE
    
}





Radius = 50
Speed = 7
Height = 20






if(E1 == 1) {
    lightCreate(1, E2POS + vec(RADIUS,0,90), ROCK1, 150, 200)
    holoCreate(9)
    holoPos(9, holoEntity(1):pos() + vec(0,0,25))
    #holoModel(9, "models/holograms/cube.mdl")
    holoScale(9, vec(0.8,0.8,7))
    holoColor(9, ROCK1)
}

if(E2 == 1) {
    lightCreate(2, E2POS + vec(-RADIUS,0,90), ROCK2, 150, 200)
    holoCreate(10)
    holoPos(10, holoEntity(2):pos() + vec(0,0,35))
    #holoModel(10, "models/holograms/cube.mdl")
    holoScale(10, vec(0.8,0.8,7))
    holoColor(10, ROCK2)
}

if(E3 == 1) {
    lightCreate(3, E2POS + vec(0,-RADIUS,90), ROCK3, 150, 200)
    holoCreate(11)
    holoPos(11, holoEntity(3):pos() + vec(0,0,25))
    #holoModel(11, "models/holograms/cube.mdl")
    holoScale(11, vec(0.8,0.8,7))
    holoColor(11, ROCK3)
}

if(E4 == 1) {
    lightCreate(4, E2POS + vec(0,RADIUS,90), ROCK4, 150, 200)
    holoCreate(12)
    holoPos(12, holoEntity(4):pos() + vec(0,0,25))
    #holoModel(12, "models/holograms/cube.mdl")
    holoScale(12, vec(0.8,0.8,7))
    holoColor(12, ROCK4)
}


#lightCreate(1, E2POS + vec(RADIUS,0,90), ROCK1, 150, 200)
#lightCreate(2, E2POS + vec(-RADIUS,0,90), ROCK2, 150, 200)
#lightCreate(3, E2POS + vec(0,-RADIUS,90), ROCK3, 150, 200)
#lightCreate(4, E2POS + vec(0,RADIUS,90), ROCK4, 150, 200)



if(E5 == 4) {

	holoMaterial(9, "models/alyx/emptool_glow")
	holoMaterial(10, "models/alyx/emptool_glow")
	holoMaterial(11, "models/alyx/emptool_glow")
	holoMaterial(12, "models/alyx/emptool_glow")

# Add extra lights to each stone
lightCreate(5, E2POS + vec(0,RADIUS,35), ROCK4, 150, 200)
lightCreate(6, E2POS + vec(0,RADIUS,35), ROCK4, 150, 200)
lightCreate(7, E2POS + vec(0,RADIUS,35), ROCK4, 150, 200)
lightCreate(8, E2POS + vec(0,RADIUS,35), ROCK4, 150, 200)

timer("Activate", 4000)
}


function funcActivateLight() {

    lightCreate(9, E2POS + vec(0,0,100), vec(255,255,255), 200, 200) # E5: WHITE
    
# TORUS RING
    holoCreate(17)
    holoPos(17, E2POS + vec(0,0,90))
    #holoAng(17, ChosenGPS:angles())
    holoScaleUnits(17, vec(170,170,100))
    holoModel(17, "hq_torus")
    holoMaterial(17, "models/props_forest/waterfall001")   # models/props_forest/waterfall001, models/props_c17/fisheyelens_dx60
    holoColor(17, vec(255,255,255), 200)
    
    TORUS = holoEntity(17)
    TORUSPOS = TORUS:pos()
    
    
for (Index = 9, 12) {

if (holoEntity(Index)) {

ELEMENT = holoEntity(Index)
ELEMENTPOS = holoEntity(Index):pos() + vec(0,0,35)

ElementDifference = ELEMENTPOS - TORUSPOS						#Subtract them to make a direction
ElementDistance = ElementDifference:length()							#Gets the LandingBayDistanceance (its the same as ChosenGPS:pos():LandingBayDistanceance(E2))
ElementHoloAngle = ElementDifference:toAngle() + ang(90,0,0)

holoCreate(Index+10)
holoPos(Index+10, (ELEMENTPOS + TORUSPOS) / 2)
holoModel(Index+10, "cylinder")
#holoAlpha(Index+40, 100)
holoAng(Index+10, ElementHoloAngle)			#Angle it. adding 90 to pitch because it is a cylinder, so I want to scale its Z, not its X.
holoScale(Index+10, vec(7.5,7.5,ElementDistance) / 12)					#Scale it to make it as long as the LandingBayDistanceance.
holoMaterial(Index+10, "models/alyx/emptool_glow")    # models/alyx/emptool_glow, models/props_combine/portalball001_sheet, Models/props_combine/masterinterface01c

}
}
    
    holoColor(19, vec(255,0,77), 255)
    holoColor(20, vec(255,255,0), 255)
    holoColor(21, vec(0,255,0), 255)
    holoColor(22, vec(0,213,255), 255)
 
    timer("DivineSequence", 1000)

}




# BEGIN INPUT BUTTONS

if (B1&~B1) {
    E1 = 1
}

if (B2&~B2) {
    E2 = 1
}

if (B3&~B3) {
    E3 = 1
}

if (B4&~B4) {
    E4 = 1
}




# BEGIN TIMER SECTION


if(clk("Activate")) {
    funcActivateLight()
}


if(clk("DivineSequence")) {
    
    E1 = 0
    E2 = 0
    E3 = 0
    E4 = 0
    E5 = 0
    
    lightCreate(10, E2POS + vec(0,0,150), vec(255,255,255), 700, 700) # E5: WHITE
    
    # Turn the statue white during divine light seq
    holoColor(50, vec(255,255,255))
    
    # Column of divine light
    holoCreate(49)
    holoModel(49, "cylinder")
    holoPos(49, E2POS + vec(0,0,4096)) #4096
    holoScaleUnits(49, vec(170,170,8192))  # 8092
    holoMaterial(49, "models/alyx/emptool_glow") 
    holoColor(49, vec(255,255,255))
    
    holoCreate(48)
    holoModel(48, "cylinder")
    holoPos(48, E2POS + vec(0,0,4096)) #4096
    holoAng(48, ang(0,-90,0))
    holoScaleUnits(48, vec(168,168,8192))  # 8092
    holoMaterial(48, "models/props_forest/waterfall001") 
    holoColor(48, vec(255,255,255))
	
	timer("Cleanup1",9000)
}


if(clk("Cleanup1")) {

	holoMaterial(9, "")
	holoMaterial(10, "")
	holoMaterial(11, "")
	holoMaterial(12, "")
	
    holoColor(50, vec(45,45,45))
    
    holoDelete(17)
    
    holoDelete(49)
    holoDelete(48)
    
for (Index = 13, 22) {
    if (holoEntity(Index)) {
        holoDelete(Index)
    }
}

for (Index = 5, 22) {
    if (lightEntity(Index)) {
        lightRemove(Index)
    }
}    
	
timer("Cleanup2",4000)
}


if(clk("Cleanup2")) {

for (Index = 9, 12) {
    if (holoEntity(Index)) {
        holoDelete(Index)
    }
}

for (Index = 1, 4) {
    if (lightEntity(Index)) {
        lightRemove(Index)
    }
}

}
