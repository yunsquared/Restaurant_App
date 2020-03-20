//
//  Restaurant.swift
//  yw458_p5
//
//  Created by Yunyun S. Wang on 4/11/19.
//  Copyright © 2019 Yunyun S. Wang. All rights reserved.
//

import Foundation
import UIKit

class Restaurant {
    
    var displayImage: UIImage? //bc returns optional
    var restaurantName: String
    var foodStyle: [FoodStyleEnum]
    var foodStyle2: Array<String>
    var price: String
    //need image name to make UIImage, and then need to create var for UIImage to pass in image name (str)
    init(imageName: String, restaurantName: String, foodStyle: [FoodStyleEnum], foodStyle2: Array<String>, price: String) {
        displayImage = UIImage(named: imageName)
        self.restaurantName = restaurantName
        self.foodStyle = foodStyle
        self.foodStyle2 = foodStyle2
        self.price = price
        
        //add a touch/button here to edit UITextField?
        
        }
}

//protocol Filter {
//    var filterTitle
//}

enum FoodStyleEnum: String, CaseIterable { //same naming convention for enums as classes, case iterable allows for iterating over all cases in loop 
    case American
    case Italian
    case Asian
    case Mexican
    
    case brunch
    case lunch
    case dinner
    case dessert
    
    
    
    
    
}

