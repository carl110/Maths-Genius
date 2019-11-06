//
//  SingletonClass.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 06/11/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit



class SingletonClass {
    
    class var sharedInstance: SingletonClass {
         struct Singleton {
             static let instance = SingletonClass()
         }

         return Singleton.instance
     }
    
    var cornerRoundingNumber: CGFloat = 25
}
