@name Fifth Element
@inputs B1 B2 B3 B4 B5
@persist ELEMENTS:array ELEMENT:entity ROCK1:vector ROCK2:vector ROCK3:vector ROCK4:vector E1 E2 E3 E4 E5 RADIUS

interval(1000)

E5 = E1 + E2 + E3 + E4

E2CHIP = entity()
E2POS = entity():pos()


if (first()) {
    
    E1 = 0
    E2 = 0
    E3 = 0
    E4 = 0
    E5 = 0
    
    RADIUS = 250
	
    E2CHIP = entity()
    E2POS = entity():pos()

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
holoScale(5, vec(0.8,0.8,5))

holoCreate(6)
holoPos(6, holoEntity(2):pos() + vec(0,0,20))
holoMaterial(6, "models/props_c17/furniturefabric001a")
holoScale(6, vec(0.8,0.8,5))

holoCreate(7)
holoPos(7, holoEntity(3):pos() + vec(0,0,20))
holoMaterial(7, "models/props_c17/furniturefabric001a")
holoScale(7, vec(0.8,0.8,5))

holoCreate(8)
holoPos(8, holoEntity(4):pos() + vec(0,0,20))
holoMaterial(8, "models/props_c17/furniturefabric001a")
holoScale(8, vec(0.98,0.8,5))


holoCreate(50)
holoPos(50, E2POS - vec(0,0,20))
holoModel(50, "models/jdavis/angel_statue/angel_statue.mdl")
holoScale(50, vec(0.55,0.55,0.55))
holoColor(50, vec(45,45,45))

    # COLOURS
    ROCK1 = vec(132,0,50) # PINK
    ROCK2 = vec(255,255,0) # YELLOW
    ROCK3 = vec(0,255,0) # GREEN
    ROCK4 = vec(0,161,255) # BLUE



function funcActivateLight() {

	holoMaterial(9, "models/alyx/emptool_glow")
	holoMaterial(10, "models/alyx/emptool_glow")
	holoMaterial(11, "models/alyx/emptool_glow")
	holoMaterial(12, "models/alyx/emptool_glow")

lightCreate(9, holoEntity(1):pos() + vec(0,0,90), ROCK1, 150, 150)
lightCreate(10, holoEntity(2):pos() + vec(0,0,90), ROCK2, 150, 150)
lightCreate(11, holoEntity(3):pos() + vec(0,0,90), ROCK3, 150, 150)
lightCreate(12, holoEntity(4):pos() + vec(0,0,90), ROCK4, 150, 150)

    lightCreate(30, E2POS + vec(0,0,100), vec(255,255,255), 200, 200) # E5: WHITE
    
# TORUS RING
    holoCreate(17)
    holoPos(17, E2POS + vec(0,0,90))
    holoScaleUnits(17, vec(168,168,98))
    holoModel(17, "hq_torus")
    holoMaterial(17, "models/spawn_effect2")   # models/props_forest/waterfall001, models/props_c17/fisheyelens_dx60, Models/props_lab/monitorface, models/props_combine/tpballglow, Effects/fake_fog01
    holoColor(17, vec(255,255,255), 200)
# TORUS RING 2
    #holoCreate(18)
    #holoPos(18, E2POS + vec(0,0,90))
    #holoScaleUnits(18, vec(170,170,100))
    #holoModel(18, "hq_torus")
    #holoMaterial(18, "models/props_c17/fisheyelens_dx60")   # models/props_forest/waterfall001, models/props_c17/fisheyelens_dx60
    #holoColor(18, vec(255,0,0), 128)
    
    
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

    holoColor(19, ROCK1, 255)
    holoColor(20, ROCK2, 255)
    holoColor(21, ROCK3, 255)
    holoColor(22, ROCK4, 255)

   timer("DivineSequence", 1000)

} #ENDFUNC


function funcDivineSequence() {
    
    E1 = 0
    E2 = 0
    E3 = 0
    E4 = 0
    E5 = 0
    
    lightCreate(31, E2POS + vec(0,0,150), vec(255,255,255), 700, 700)
    
    # Turn the statue white during divine light seq
    holoColor(50, vec(255,255,255))
    
    # Column of divine light
    holoCreate(49)
    holoModel(49, "cylinder")
    holoPos(49, E2POS + vec(0,0,0)) #4096
    holoScaleUnits(49, vec(170,170,8192))  # 8092
    holoMaterial(49, "models/alyx/emptool_glow") 
    holoColor(49, vec(255,255,255))
    
    holoCreate(48)
    holoModel(48, "cylinder")
    holoPos(48, E2POS + vec(0,0,0)) #4096
    holoScaleUnits(48, vec(168,168,8192))  # 8092
    holoMaterial(48, "models/props_forest/waterfall001") 
    holoColor(48, vec(255,255,255))
	
	timer("Cleanup1",13000)
 
} #ENDFUNC

} # END FIRST





if(E1 == 1) {
    #lightCreate(1, E2POS + vec(RADIUS,0,100), ROCK1, 150, 200)
    holoCreate(9)
    holoPos(9, holoEntity(1):pos() + vec(0,0,25))
    holoScale(9, vec(0.7,0.7,7))
    holoColor(9, ROCK1)
    
    lightCreate(81, holoEntity(5):pos() + vec(0,-35,25), ROCK1, 50, 15)
    lightCreate(82, holoEntity(5):pos() + vec(-35,0,25), ROCK1, 50, 15)
    lightCreate(83, holoEntity(5):pos() + vec(0,35,25), ROCK1, 50, 15)
    #lightCreate(84, holoEntity(5):pos() + vec(35,0,25), ROCK1, 50, 15)
}

if(E2 == 1) {
    #lightCreate(2, E2POS + vec(-RADIUS,0,100), ROCK2, 150, 200)
    holoCreate(10)
    holoPos(10, holoEntity(2):pos() + vec(0,0,25))
    holoScale(10, vec(0.7,0.7,7))
    holoColor(10, ROCK2)
    
    lightCreate(85, holoEntity(6):pos() + vec(0,-35,25), ROCK2, 50, 15)
    lightCreate(86, holoEntity(6):pos() + vec(-35,0,25), ROCK2, 50, 15)
    lightCreate(87, holoEntity(6):pos() + vec(0,35,25), ROCK2, 50, 15)
    #lightCreate(88, holoEntity(6):pos() + vec(35,0,25), ROCK2, 50, 15)
}

if(E3 == 1) {
    #lightCreate(3, E2POS + vec(0,-RADIUS,100), ROCK3, 150, 200)
    holoCreate(11)
    holoPos(11, holoEntity(3):pos() + vec(0,0,25))
    holoScale(11, vec(0.7,0.7,7))
    holoColor(11, ROCK3)
    
    lightCreate(89, holoEntity(7):pos() + vec(0,-35,25), ROCK3, 50, 15)
    lightCreate(90, holoEntity(7):pos() + vec(-35,0,25), ROCK3, 50, 15)
    lightCreate(91, holoEntity(7):pos() + vec(0,35,25), ROCK3, 50, 15)
    #lightCreate(92, holoEntity(7):pos() + vec(35,0,25), ROCK3, 50, 15)
}

if(E4 == 1) {
    #lightCreate(4, E2POS + vec(0,RADIUS,100), ROCK4, 150, 200)
    holoCreate(12)
    holoPos(12, holoEntity(4):pos() + vec(0,0,25))
    holoScale(12, vec(0.7,0.7,7))
    holoColor(12, ROCK4)
    
    lightCreate(93, holoEntity(8):pos() + vec(0,-35,25), ROCK4, 50, 15)
    lightCreate(94, holoEntity(8):pos() + vec(-35,0,25), ROCK4, 50, 15)
    lightCreate(95, holoEntity(8):pos() + vec(0,35,25), ROCK4, 50, 15)
    #lightCreate(96, holoEntity(8):pos() + vec(35,0,25), ROCK4, 50, 15)
}

if(E5 == 4) {

# Add extra lights to each stone
#lightCreate(5, holoEntity(1):pos() + vec(0,0,50), ROCK1, 200, 300)
#lightCreate(6, holoEntity(2):pos() + vec(0,0,50), ROCK2, 200, 300)
#lightCreate(7, holoEntity(3):pos() + vec(0,0,50), ROCK3, 200, 300)
#lightCreate(8, holoEntity(4):pos() + vec(0,0,50), ROCK4, 200, 300)

timer("Activate", 4000)
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
    funcDivineSequence()
}


if(clk("Cleanup1")) {

	holoMaterial(9, "")
	holoMaterial(10, "")
	holoMaterial(11, "")
	holoMaterial(12, "")
	
    holoColor(50, vec(45,45,45))
    
    #TORUS
    holoDelete(17)
    
    #COLUMN
    holoDelete(49)
    holoDelete(48)
    
for (Index = 13, 22) {
    if (holoEntity(Index)) {
        holoDelete(Index)
    }
}

for (Index = 5, 32) {
    if (lightEntity(Index)) {
        lightRemove(Index)
    }
}    
	
timer("Cleanup2",3000)
}


if(clk("Cleanup2")) {

for (Index = 9, 12) {
    if (holoEntity(Index)) {
        holoDelete(Index)
    }
}

for (Index = 80, 100) {
    if (lightEntity(Index)) {
        lightRemove(Index)
    }
}

for (Index = 1, 4) {
    if (lightEntity(Index)) {
        lightRemove(Index)
    }
}

}
