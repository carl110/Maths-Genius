//
//  Int+extensions.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 24/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    
    //returns a random number from array of Int the number is divisable by ie. self = 2 would be [1, 2]
    func randomDivisable(lowerLimit: Int, upperLimit: Int) -> Int {
        
        var sumArray = [Int]()

        //for range see what the number is divisable by and add to array
                for divisable in lowerLimit...upperLimit {
                    if self % divisable == 0 {
                        sumArray.append(divisable)
                        print ("\(self) is divisable by \(divisable)")
                    }
                }
        
        //incase the number is prime 1 is added so it doesnt fail
        if sumArray.isEmpty {
            sumArray = [1]
        }
        
        return sumArray.randomElement()!
    }
}

