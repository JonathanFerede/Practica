//
//  GlowAct.swift
//  HellGlow World
//
//  Created by Fhict on 26/02/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import Foundation



class GlowAct {
    //properties and methods
    var name:String
    var rating:Int
    var startTime:String
    
    init(name:String, rating:Int, startTime:String){
        self.name = name
        self.rating = rating
        self.startTime = startTime
        

    }
    
    func showInfo() ->String
    {
        return "The act is called \(name) and starts at \(startTime). It is given an average rating of \(rating)"
    }
}