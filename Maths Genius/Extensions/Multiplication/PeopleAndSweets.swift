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
            
            var smallerNumber = 0
            var largerNumber = 0
            
            //Show original equation
            exampleText.append("Using the eqaution\n\(firstNumber) × \(secondNumber)\nyou can do the following :\n")
            
           
            if firstNumber == 1 || secondNumber == 1 {
                
                exampleText.append("Any number multiplied by 1 will be the same number.\nUsing the help example: 1 person has \(firstNumber * secondNumber) sweets")
                
            } else {
                
                if firstNumber == secondNumber {
                    
                    largerNumber = firstNumber
                    
                    smallerNumber = secondNumber
                    
                    exampleText.append("Since both numbers are the same both people and sweets will be \(firstNumber)\n")
                    
                    
                } else if firstNumber < secondNumber {
                    
                    largerNumber = secondNumber
                    
                    smallerNumber = firstNumber
                    exampleText.append("Since the second number is larger than the first number lets make the first number the amount of people and the socond number the sweets")
                    
                    
                } else if firstNumber > secondNumber {

                    largerNumber = firstNumber
                    
                    smallerNumber = secondNumber

                    exampleText.append("Since the first number is larger than the second number lets make the second number the amount of people and the first number the number of sweets\n")
                    
                }
                    
                    exampleText.append("So \(smallerNumber) people have \(largerNumber) sweets each")
                    
                    exampleText.append("Lets add the sweets up\n\nAdd \(largerNumber) sweets from person 1 to \(largerNumber) sweets from person 2\n\(largerNumber) + \(largerNumber) = \(largerNumber * 2)\n")
                
                if smallerNumber > 2 {
                    for i in 3...smallerNumber {
                         exampleText.append("Now add \(largerNumber) sweets form person \(i) to the previouse \(largerNumber * (i-1))\n\(largerNumber * (i-1)) + \(largerNumber) = \(largerNumber * i)")
                         
                     }

                }
            }
            

            
            exampleText.append("\nTherefore \(firstNumber) × \(secondNumber) = \(firstNumber * secondNumber)")
        }
        
        
        //join all sections of array into 1 section seperated by a line break
        exampleText = [exampleText.joined(separator: "\n")]
        
        return exampleText
    }
    
}
