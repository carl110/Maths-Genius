//
//  AdditionsHelp+extensions.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 24/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func roundNumber(firstNumber: Int, secondNumber: Int) -> [String] {
        
        
        let firstNumberRound = 10 - firstNumber.digits.last
        let secondNumberRound = 10 - secondNumber.digits.last
        
        var exampleText = ["Using the equation \(firstNumber) + \(secondNumber) we can do the following :\n"]
        
        exampleText.append("Add \(firstNumberRound) to \(firstNumber)")
        exampleText.append("Add \(secondNumberRound) to \(secondNumber)\n")
        exampleText.append("Your new equation is \(firstNumberRound + firstNumber) + \(secondNumberRound + secondNumber)\n")
        exampleText.append("\(firstNumberRound + firstNumber) + \(secondNumberRound + secondNumber) = \(firstNumberRound + firstNumber + secondNumberRound + secondNumber)\n")
        exampleText.append("The numbers added to make the round equation are \(firstNumberRound) + \(secondNumberRound) = \(firstNumberRound + secondNumberRound)\n")
        exampleText.append("\nNow take the equated round number and minus the added numbers\n")
        
        exampleText.append("\(firstNumberRound + firstNumber + secondNumberRound + secondNumber) - \(firstNumberRound + secondNumberRound) = \(firstNumber + secondNumber)")
        
        
        //join all sections of array into 1 section seperated by a line break
        exampleText = [exampleText.joined(separator: "\n")]
        
        return exampleText
    }
    
    func usingPlaceValues(firstNumber: Int, secondNumber: Int) -> [String] {
        
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
        let fnUnit = firstNumberArray[3]
        let fnTen = firstNumberArray[2] * 10
        let fnHund = firstNumberArray[1] * 100
        let fnThou = firstNumberArray[0] * 1000
        let snUnit = secondNumberArray[3]
        let snTen = secondNumberArray[2] * 10
        let snHund = secondNumberArray[1] * 100
        let snThou = secondNumberArray[0] * 1000
        
        
        //If first and second number is more than 9 or 99 etc then add all values at that point and below together to get figure. Else if number contains numbers at place value just use those 2 digits
        
        //Intor and unit calculations
        var exampleText = ["Using the equation \(firstNumber) + \(secondNumber) we can do the following : \n\n \(String(format: "%04d", firstNumber))\n+\(String(format: "%04d", secondNumber))\n------\n  \(String(format: "%04d", (fnUnit + snUnit).digits.last))"]
        
        //Tens calculation
        if fnUnit + snUnit > 9 {
            exampleText.append("   - Add the 10 to the next row\n  \(String(format: "%04d", ((fnTen + snTen) + (((fnUnit + snUnit).digits[0]) * 10)).digits.secondToLast * 10))")
        } else if firstNumber.digits.count > 1 || secondNumber.digits.count > 1 || (fnUnit + snUnit).digits.count  > 1 {
            exampleText.append("\n  \(String(format: "%04d", (fnTen + snTen).digits.secondToLast * 10))")
            
        }
        
        //Hundres calculation
        if fnTen + snTen + fnUnit + snUnit > 99 {
            exampleText.append("   - Add the 100 to the next row\n  \(String(format: "%04d", ((fnHund + snHund) + (((fnTen + snTen + fnUnit + snUnit).digits[0]) * 100)).digits.thirdToLast * 100))")
        } else if (firstNumber + secondNumber).digits.count > 2 {
            exampleText.append("\n \(String(format: "%04d", (fnHund + snHund).digits.thirdToLast * 100))")
        }
        
        //Thousdands calculation
        if fnHund + snHund + fnTen + snTen + fnUnit + snUnit > 999 {
            exampleText.append("   - Add the 1000 to the next row\n  \(String(format: "%04d", (((fnThou + snThou) + (((fnHund + snHund + fnTen + snTen + fnUnit + snUnit).digits[0]) * 1000)).digits.fourthToLast * 1000)))")
        } else if (firstNumber + secondNumber).digits.count > 3 {
            exampleText.append("\n  \(String(format: "%04d", (fnThou + snThou).digits.fourthToLast * 1000))")
        }
        
        //Ten thousands calculation
        if fnThou + snThou + fnHund + snHund + fnTen + snTen + fnUnit + snUnit > 9999 {
            exampleText.append("   - Add the 10000 to the next row\n \(String(format: "%04d", ((fnThou + snThou) + (((fnHund + snHund).digits[0]))*1000).digits.fithToLast * 10000)) - This is Ten Thousands")
        }
        
        //Sum of equation
        exampleText.append("\n\nNow add the numbers from the first to last row. And your answer should be : \n\n\(firstNumber + secondNumber)")
        
        //join all sections of array into 1 section seperated by a line break
        exampleText = [exampleText.joined(separator: "\n")]
        
        return exampleText
    }
    
    func hundredsSquare(firstNumber: Int, secondNumber: Int) -> [String] {
        
        //create an array of the numbers
        var secondNumberArray = secondNumber.digits
        
        while 4 - secondNumberArray.count > 0 {
            secondNumberArray.insert(0, at: 0)
        }
        
        //Split numbers into their place values
        let snUnit = secondNumberArray[3]
        let snTen = secondNumberArray[2]
        
        var exampleText = [String]()
        
        //If number over 100 hundered then this example is not useful
        if (firstNumber + secondNumber) > 100 {
            exampleText.append("The sum of \(firstNumber) and \(secondNumber) is more than 100 so the hundres square will not work. Please look at another help item.")
            
        } else {
            
            //Show original equation
            exampleText.append("Using the eqaution\n\(firstNumber) + \(secondNumber)\nyou can do the following :\n\n")
            
            exampleText.append("On the Hundreds Square you have in front of you mark the number \(firstNumber) as your starting position\n\n")
            
            //if no usits go straight to tens
            if snUnit == 0 {
                exampleText.append("Since the unit number is 0 lets go straight to the tens number\n\n")
            } else {
                exampleText.append("Now add \(snUnit) from the second number to the \(firstNumber) on your Hundred Square\n\n")
                
                exampleText.append("You should now count \(snUnit) to the right accross the row and, cross out -\n|")
                
                for i in 0...snUnit - 1 {
                    exampleText.append(" \(firstNumber + i) |")
                }
                
                exampleText.append("\n\nNow mark the \(firstNumber + snUnit) on your hundreds square\n\n")
            }
            
            if snTen == 0 {
                exampleText.append("Since there is no tens number. The number you have marked on your hundreds square is the finnal answer\n\n")
            } else {
                exampleText.append("Now add \(snTen * 10) from the \(secondNumber) to the \(firstNumber + snUnit) on your Hundred Square\n\n")
                
                exampleText.append("You should now go \(snTen) down on the column and cross out -\n")
                
                for i in 0...snTen - 1 {
                    exampleText.append(" \((firstNumber + snUnit) + i * 10) \n\n")
                }
                exampleText.append("Now mark \(firstNumber + secondNumber) on your hundreds square\n\n")
            }
            
            exampleText.append("Your hundreds square should now show the correct answer for \(firstNumber) + \(secondNumber) which is-\n\n\(firstNumber) + \(secondNumber) = \(firstNumber + secondNumber)")
            
        }
        
        //join all sections of array into 1 section seperated by a line break
        exampleText = [exampleText.joined(separator: "")]
        
        return exampleText
}

}
