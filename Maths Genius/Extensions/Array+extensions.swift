//
//  Array+extensions.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 11/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension Array {
    
    //provide last item of an array
    var last: Element {
        return self[self.endIndex - 1]
    }
    
    var secondToLast: Element {
        return self[self.endIndex - 2]
    }
    
    var thirdToLast: Element {
        return self[self.endIndex - 3]
    }
    
    var fourthToLast: Element {
        return self[self.endIndex - 4]
    }
    
    var fithToLast: Element {
        return self[self.endIndex - 5]
    }
    
    var first: Element {
        return self[self.startIndex]
    }
    
    var secondToStart: Element {
        return self [self.startIndex + 1]
    }
}


extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element {
        return reduce(.zero, +)
    }
}
