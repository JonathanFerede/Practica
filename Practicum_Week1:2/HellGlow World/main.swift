//
//  main.swift
//  HellGlow World
//
//  Created by Fhict on 26/02/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import Foundation

//Maak een nieuw object aan van het type GlowAct
var blueLightAct = GlowAct(name: "BluelightAct",rating: 10,startTime: "22.00")
var redLightAct = GlowAct(name: "RedLightAct", rating: 5, startTime: "23.00")

//Maak een nieuw object aan van het type City
var Eindhoven = City(name: "Eindhoven",population: 220000)


//voeg de glowact objecten toe aan de array in het city object Eindhoven
Eindhoven.glowActs.append(blueLightAct)
Eindhoven.glowActs.append(redLightAct)

//show info van Eindhoven
print(Eindhoven.showInfo())


//Loop door alle glowacts in eindhoven
//en show info
for GlowAct in Eindhoven.glowActs {
    print(GlowAct.showInfo())
}
