//
//  Burger.swift
//  Burger
//
//  Created by Tedtya rady on 13/1/22.
//

import Foundation
import UIKit

struct Burger: Decodable{
    
    var name:String
    var ingredients:String
    var imageName:String
    var type:BurgerType
    var thumbnailName:String
}


enum BurgerType:String, Decodable{
    case vegetarian = "vegetarian"
    case meat = "meat"
}

