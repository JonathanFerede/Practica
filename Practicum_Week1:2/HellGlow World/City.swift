//
//  City.swift
//  HellGlow World
//
//  Created by Fhict on 26/02/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import Foundation
class City {
    //properties and methods
    var name :String
    var population:Int
    var glowActs = [GlowAct]()
    
    init(name:String, population:Int){
        self.name = name
        self.population = population

    }

    
    func showInfo() -> String
    {
        let output = "In the city of \(name) there are currently living \(population) people. There will be \(glowActs.count) glowacts in this city."
        return output
    }
}