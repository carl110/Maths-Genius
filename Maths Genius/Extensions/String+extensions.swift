//
//  String+extensions.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    
    //Allows you to get the nth character of a string
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    // Changes text to title case
    func titlecased() -> String {
        return self.replacingOccurrences(of: "([A-Z])", with: " $1", options: .regularExpression, range: self.range(of: self))
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .capitalized
    }
    
    var numberValue:NSNumber? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.number(from: self)
    }
    
    //sets first letter of string to capital
    var uppercasingFirst: String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    //sets first character of string to lower case
    var lowercasingFirst: String {
        return prefix(1).lowercased() + dropFirst()
    }
    
    //convers string to camelCase
    var camelCase: String {
        guard !isEmpty else {
            return ""
        }
        
        //split individual words to sections
        let parts = self.components(separatedBy: CharacterSet.alphanumerics.inverted)
        
        //set first section with lowercase and rest with capital as first character
        let first = String(describing: parts.first!).lowercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercasingFirst})
        return ([first] + rest).joined(separator: "")
    }
}
