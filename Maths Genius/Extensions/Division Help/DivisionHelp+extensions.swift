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
        
        
        //Add 0's for an long as the first number is to the sumArray
        for _ in firstNumberArray {
            sumArray.append(0)
        }
        
        //Show original equation
        var exampleText = ["Using the eqaution \(firstNumber) ÷ \(secondNumber) you can do the following :\n\n",
            "\(secondNumber) ⟌ \(firstNumber)\n\n"]
        
        //Run through each digit in feirst number to complete equation example
        for (index, element) in firstNumberArray.enumerated() {
            
            //On first run add starting statement
            if index == 0 {
                exampleText.append("Lets start by taking the largest place value digit from your dividend, which in this case is \(element) and create the new equation with your divisor\n\n\(element) ÷ \(secondNumber)\n\n")
            } else {
                exampleText.append("Your new equation is \(element + carryOverNumber) ÷ \(secondNumber)\n\n")
            }

            //If digit is larger than denominator then set as 0
            if element + carryOverNumber < secondNumber {
                
                exampleText.append("Since the \(secondNumber) is larger than the \(element + carryOverNumber) we can place a 0 above the \(element).\n\n")
            } else {
                exampleText.append("The \(secondNumber) (the Divisor) can be multipled ")
                
                //Change wording if one or more times
                if (element + carryOverNumber) / secondNumber == 1 {
                    exampleText.append("only once")
                } else {
                    exampleText.append("\((element + carryOverNumber) / secondNumber) times")
                }
                
                exampleText.append(" before it becomes larger than the \(element + carryOverNumber)\n\nSo we can now place a \((element + carryOverNumber) / secondNumber) above the \(element)\n\n")
            }
            
            //Add digit to sumArray to show progress of equation
            sumArray[index] = (element + carryOverNumber) / secondNumber
            
            //Add .'s for the number of digits in the divisor to make the equation line up
            for i in 0...secondNumber.digits.count {
                print (i)
                exampleText.append("..")
            }
            
            exampleText.append("..\(sumArray.toPrint)\n\(secondNumber) ⟌ \(firstNumberArray.toPrint)\n\n")
            
            //Add details of continuing euation calculation before the last run
            if index < firstNumberArray.count - 1 {
                
                exampleText.append("\(firstNumberArray[index] + carryOverNumber) - \(sumArray[index] * secondNumber) = \(firstNumberArray[index] + carryOverNumber - sumArray[index] * secondNumber)\n So we can place the \(firstNumberArray[index] + carryOverNumber - sumArray[index] * secondNumber) in the corresponding place value position below the long division bracket and pull down the next number in the dividend, which is \(firstNumberArray[index + 1]) to create your next equation. -- [\(firstNumberArray[index] + carryOverNumber - sumArray[index] * secondNumber)\(firstNumberArray[index + 1])]\n\n")
            }
            
            carryOverNumber = ((element + carryOverNumber) % secondNumber) * 10
        }
        
        exampleText.append("You should now have your answer as \(firstNumber / secondNumber)\n\nYou can Int check your answer by multiplying your answer with the divisor.\n\(firstNumber / secondNumber) × \(secondNumber) = \(firstNumber)")

        //join all sections of array into 1 section seperated by a line break
        exampleText = [exampleText.joined(separator: "")]
        
        return exampleText
    }
}

