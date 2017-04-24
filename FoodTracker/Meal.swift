//
//  Meal.swift
//  FoodTracker
//
//  Created by ioc0 on 21.04.17.
//  Copyright © 2017 web-wizards. All rights reserved.
//
import UIKit

import Foundation
class Meal {
    var name : String
    var rating : Int
    var photo : UIImage?
    init?(name : String, rating : Int, photo : UIImage){
        //init should fail if name is empty
        if name.isEmpty || rating < 0 {
            return nil
        }
        //self state init
        self.name = name
        self.rating = rating
        self.photo = photo
        
        
    }
}


