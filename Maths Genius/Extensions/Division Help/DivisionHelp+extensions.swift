//
//  LongDivision.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 23/10/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func longDivision(firstNumber: Int, secondNumber: Int) -> [String] {
        
        var sumArray = [Int]()
        var carryOverNumber = 0
        
            //create an array of the numbers
        let firstNumberArray = firstNumber.digits
            var secondNumberArray = secondNumber.digits
            
//            //using the arays, if the numbers are less that 1000 add preceeding 0's for readability
//            while 4 - firstNumberArray.count > 0 {
//                firstNumberArray.insert(0, at: 0)
//            }
            while 4 - secondNumberArray.count > 0 {
                secondNumberArray.insert(0, at: 0)
            }
            
            //Split numbers into their place values
//            var fnUnit = firstNumberArray[3]
//            var fnTen = firstNumberArray[2]
//            var fnHund = firstNumberArray[1]
//            var fnThou = firstNumberArray[0]
//            let snUnit = secondNumberArray[3]
//            let snTen = secondNumberArray[2]
//            let snHund = secondNumberArray[1]
//            let snThou = secondNumberArray[0]
        
        for element in firstNumberArray {
            sumArray.append(0)
        }
//
            
            //Show original equation
            var exampleText = ["Using the eqaution \(firstNumber) ÷ \(secondNumber) you can do the following :\n\n",
                "\(secondNumber) ⟌ \(firstNumber)\n\n"]
        
        
        
        for (index, element) in firstNumberArray.enumerated() {
            
            if index == 0 {
                exampleText.append("Lets start by taking the largest place value digit from your dividend, which in this case is \(element) and create the new equation with your divisor\n\n\(element) ÷ \(secondNumber)\n\n")
            } else {
                exampleText.append("Your new equation is \(element + carryOverNumber) ÷ \(secondNumber)\n\n")
            }
            
//                if element + carryOverNumber > element {
//                    print ("for number \(element) And place the \(element) to the right of it.\nYour new exuation is \(element + carryOverNumber) ÷ \(secondNumber)\n\n")
//                }
                
                
         
            if element + carryOverNumber < secondNumber {
                
                exampleText.append("Since the \(secondNumber) is larger than the \(element + carryOverNumber) we can place a 0 above the \(element).\n\n")
            }
            
            

            
            else {
                exampleText.append("The \(secondNumber) (the Divisor) can be multipled ")
                
                if (element + carryOverNumber) / secondNumber == 1 {
                    exampleText.append("only once")
                } else {
                    exampleText.append("\((element + carryOverNumber) / secondNumber) times")
                }
                
                exampleText.append(" before it becomes larger than the \(element + carryOverNumber)\n\nSo we can now place a \((element + carryOverNumber) / secondNumber) above the \(element)\n\n")


        }
            
            sumArray[index] = (element + carryOverNumber) / secondNumber
              
            exampleText.append("     \(sumArray.toPrint)\n\(secondNumber) ⟌ \(firstNumberArray.toPrint)\n\n")
           
            if index < firstNumberArray.count - 1 {
            
                exampleText.append("\(firstNumberArray[index] + carryOverNumber) - \(sumArray[index]) = \(firstNumberArray[index] + carryOverNumber - sumArray[index]). So we can place the \(firstNumberArray[index] + carryOverNumber - sumArray[index]) in the corresponding place value position below the long division bracket and pull down the next number in the dividend, which is \(firstNumberArray[index + 1]) to create your next equation.\n\n")
                
            }
                           
                               print ("remainder = \(element % secondNumber)")
                
//                exampleText.append("\(i) - \(i / secondNumber) = \(i - (i / secondNumber)). So we can place a \(i - (i / secondNumber)) in the corresponding place value position below the Long Division Bracket\n\n")
                
            
            print ("carry over should be  \((element + carryOverNumber) % secondNumber)")

                
//                            carryOverNumber = (element - (element / secondNumber) * secondNumber) * 10
            
            carryOverNumber += element % secondNumber * 10
            
        }
            
            

            
            //join all sections of array into 1 section seperated by a line break
            exampleText = [exampleText.joined(separator: "")]
            
            return exampleText
        }
}

