//
//  BianaryInteger+extensions.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension BinaryInteger {
    
    //Returns an integer as an array of the single digits ie. 328 would return [3, 2, 8]
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
}
