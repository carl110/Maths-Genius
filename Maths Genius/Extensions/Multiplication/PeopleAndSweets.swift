//
//  PeopleAndSweets.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 26/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func peopleAndSweets(firstNumber: Int, secondNumber: Int) -> [String] {
        
        //create an array of the numbers
        var firstNumberArray = firstNumber.digits
        var secondNumberArray = secondNumber.digits
        
        //using the arays, if the numbers are less that 1000 add preceeding 0's for readability
        while 4 - firstNumberArray.count > 0 {
            firstNumberArray.insert(0, at: 0)
        }
        while 4 - secondNumberArray.count > 0 {
            secondNumberArray.insert(0, at: 0)
        }
        
        //Split numbers into their place values
        var fnUnit = firstNumberArray[3]
        var fnTen = firstNumberArray[2]
        var fnHund = firstNumberArray[1]
        var fnThou = firstNumberArray[0]
        let snUnit = secondNumberArray[3]
        let snTen = secondNumberArray[2]
        let snHund = secondNumberArray[1]
        let snThou = secondNumberArray[0]
        
        var exampleText = [String]()
        
        
        if firstNumber * secondNumber > 100 {
            
            exampleText.append("This number is too large to use this method easily.\n\nPerhaps you should look at another method of working out your multiplication sum.")
            
        } else {
            
            //Show original equation
            exampleText.append("Using the eqaution\n\(firstNumber) - \(secondNumber)\nyou can do the following :\n")
            
            if firstNumber == secondNumber {
                exampleText.append("Since both numbers are the same both people and sweets will be \(firstNumber)/n")
                
                exampleText.append("So we have \(firstNumber) \(UIImage(named: "wand"))")
                
            } else if firstNumber < secondNumber {
                exampleText.append("Since the second number is larger than the first number lets make the first number the ammount of people and the socond number the sweets\n")
                
                exampleText.append("So we have \(firstNumber) \(UIImage(named: "wand"))")
            } else if firstNumber > secondNumber {
                exampleText.append("Since the first number is larger than the second number lets make the second number the ammount of people and the first number the number of sweets\n")
                
                exampleText.append("So we have \(firstNumber) \(UIImage(named: "wand"))")
            }
            
        }
        
        
        //join all sections of array into 1 section seperated by a line break
        exampleText = [exampleText.joined(separator: "\n")]
        
        return exampleText
    }
    
}
