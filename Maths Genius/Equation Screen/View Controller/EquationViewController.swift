//
//  EquationViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 20/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class EquationViewController: UIViewController {
    
    fileprivate var equationFlowController: EquationFlowController!
    fileprivate var equationViewModel: EquationViewModel!
    
    var firstNumber = Int()
    var secondNumber = Int ()
    var subject = String()
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var answerInput: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    func assignDependancies(equationFlowController: EquationFlowController, equationViewModel: EquationViewModel) {
        self.equationViewModel = equationViewModel
        self.equationFlowController = equationFlowController
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        
        //Set the values from previouse screen
        firstNumber = equationViewModel.firstNumber
        secondNumber = equationViewModel.secondNumber
        subject = equationViewModel.subject
        
        //set mainscreen details
        self.view.backgroundColor = UIColor.Shades.standardBlack
        self.title = subject
        labelSetup()
        updateNumbers()
    }
    
    func labelSetup() {
        
        //set up numbers and operation labels
        if subject == SubjectType.Additions.name() {
            operation.text = "+"
        } else if subject == SubjectType.Subtractions.name() {
            operation.text = "-"
        } else if subject == SubjectType.Multiplications.name() {
            operation.text = "×"
        } else if subject == SubjectType.Divisions.name() {
            operation.text = "÷"
        }
        
        operation.numberLabelSetup()
        operation.textAlignment = .center
        
        firstNumberLabel.numberLabelSetup()
        firstNumberLabel.textAlignment = .center
        secondNumberLabel.numberLabelSetup()
        secondNumberLabel.textAlignment = .center
        answerInput.numberTextSetUp()
        
        submitButton.setTitle("Submit", for: .normal)
        DispatchQueue.main.async { [weak self] in
            self?.submitButton.titleButtonSetup()
        }
    }
    
    func updateNumbers() {
        firstNumberLabel.text = String(firstNumber)
        secondNumberLabel.text = String(secondNumber)
        
    }
    
    func additionSubmitButton() {
        if integer(from: answerInput) == firstNumber + secondNumber {
            alertBoxWithAction(title: "WELL DONE",
                               message: "You gave the correct andswer",
                               options: "Let me try another addition", "Let me try a different type of equation") { (option) in
                                switch(option) {
                                case 0:
                                    
                                    //Update numbers with new random numbers set to the same digit counts
                                    if self.firstNumber.digits.count == 4 {
                                        self.firstNumber = Int.random(in: 1000...9999)
                                    } else if self.firstNumber.digits.count == 3 {
                                        self.firstNumber = Int.random(in: 100...999)
                                    } else if self.firstNumber.digits.count == 2 {
                                        self.firstNumber = Int.random(in: 10...99)
                                    } else {
                                        self.firstNumber = Int.random(in: 0...9)
                                    }
                                    
                                    if self.secondNumber.digits.count == 4 {
                                        self.secondNumber = Int.random(in: 1000...9999)
                                    } else if self.secondNumber.digits.count == 3 {
                                        self.secondNumber = Int.random(in: 100...999)
                                    } else if self.secondNumber.digits.count == 2 {
                                        self.secondNumber = Int.random(in: 10...99)
                                    } else {
                                        self.secondNumber = Int.random(in: 0...9)
                                    }
                                    
                                    //reset text field to empty and update numbers on screen
                                    self.answerInput.text = ""
                                    self.updateNumbers()
                                case 1:
                                    
                                    //Remove all viewcontrollers from the navigation stack
                                    self.navigationController!.viewControllers.removeAll()
                                    
                                    self.equationFlowController.showMain()
                                default:
                                    break
                                }
            }
        } else {
            alertBoxWithAction(title: "Incorrect Answer",
                               message: "Unfortunatly the answer is incorrect",
                               options: "Let me try the answer again", "Help me, with an example", "Show me how with this equation") { (option) in
                                switch(option) {
                                case 1:
                                    self.equationFlowController.showHelpScreen(firstNumber: 1234, secondNumber: 567, subject: self.subject)
                                case 2:
                                    self.equationFlowController.showHelpScreen(firstNumber: self.firstNumber, secondNumber: self.secondNumber, subject: self.subject)
                                default:
                                    break
                                }
            }
        }
    }
    
    func subtractionSubmitButton() {
        
        var secondNumberUperLimit4Digit = 9999
        var secondNumberUpperLimit3Digit = 999
        var secondNumberUpperLimit2Digit = 99
        var secondNumberUpperLimit1Digit = 9
        

        
        if integer(from: answerInput) == firstNumber - secondNumber {
            alertBoxWithAction(title: "WELL DONE",
                               message: "You gave the correct andswer",
                               options: "Let me try another subtraction", "Let me try a different type of equation") { (option) in
                                switch(option) {
                                case 0:
                                    
                                    //Update numbers with new random numbers set to the same digit counts
                                    if self.firstNumber.digits.count == 4 {
                                        self.firstNumber = Int.random(in: 1000...9999)
                                    } else if self.firstNumber.digits.count == 3 {
                                        self.firstNumber = Int.random(in: 100...999)
                                    } else if self.firstNumber.digits.count == 2 {
                                        self.firstNumber = Int.random(in: 10...99)
                                    } else {
                                        self.firstNumber = Int.random(in: 0...9)
                                    }
                                    
                                    if self.subject == SubjectType.Subtractions.name() && self.firstNumber.digits.count == self.secondNumber.digits.count {
                                        secondNumberUperLimit4Digit = self.firstNumber
                                        secondNumberUpperLimit3Digit = self.firstNumber
                                        secondNumberUpperLimit2Digit = self.firstNumber
                                        secondNumberUpperLimit1Digit = self.firstNumber
                                    }
                                    
                                    if self.secondNumber.digits.count == 4 {
                                        self.secondNumber = Int.random(in: 1000...secondNumberUperLimit4Digit)
                                    } else if self.secondNumber.digits.count == 3 {
                                        self.secondNumber = Int.random(in: 100...secondNumberUpperLimit3Digit)
                                    } else if self.secondNumber.digits.count == 2 {
                                        self.secondNumber = Int.random(in: 10...secondNumberUpperLimit2Digit)
                                    } else {
                                        self.secondNumber = Int.random(in: 0...secondNumberUpperLimit1Digit)
                                    }
                                    
                                    //reset text field to empty and update numbers on screen
                                    self.answerInput.text = ""
                                    self.updateNumbers()
                                case 1:
                                    
                                    //Remove all viewcontrollers from the navigation stack
                                    self.navigationController!.viewControllers.removeAll()
                                    
                                    self.equationFlowController.showMain()
                                default:
                                    break
                                }
            }
        } else {
            alertBoxWithAction(title: "Incorrect Answer",
                               message: "Unfortunatly the answer is incorrect",
                               options: "Let me try the answer again", "Help me, with an example", "Show me how with this equation") { (option) in
                                switch(option) {
                                case 1:
                                    self.equationFlowController.showHelpScreen(firstNumber: 1234, secondNumber: 567, subject: self.subject)
                                case 2:
                                    self.equationFlowController.showHelpScreen(firstNumber: self.firstNumber, secondNumber: self.secondNumber, subject: self.subject)
                                default:
                                    break
                                }
            }
        }
    }
    
    
    func multiplyButton() {
        if integer(from: answerInput) == firstNumber * secondNumber {
            alertBoxWithAction(title: "WELL DONE",
                               message: "You gave the correct andswer",
                               options: "Let me try another multiplication", "Let me try a different type of equation") { (option) in
                                switch(option) {
                                case 0:
                                    
                                    //Update numbers with new random numbers set to the same digit counts
                                    if self.firstNumber.digits.count == 4 {
                                        self.firstNumber = Int.random(in: 1000...9999)
                                    } else if self.firstNumber.digits.count == 3 {
                                        self.firstNumber = Int.random(in: 100...999)
                                    } else if self.firstNumber.digits.count == 2 {
                                        self.firstNumber = Int.random(in: 10...99)
                                    } else {
                                        self.firstNumber = Int.random(in: 0...9)
                                    }
                                    
                                    if self.secondNumber.digits.count == 4 {
                                        self.secondNumber = Int.random(in: 1000...9999)
                                    } else if self.secondNumber.digits.count == 3 {
                                        self.secondNumber = Int.random(in: 100...999)
                                    } else if self.secondNumber.digits.count == 2 {
                                        self.secondNumber = Int.random(in: 10...99)
                                    } else {
                                        self.secondNumber = Int.random(in: 0...9)
                                    }
                                    
                                    //reset text field to empty and update numbers on screen
                                    self.answerInput.text = ""
                                    self.updateNumbers()
                                case 1:
                                    
                                    //Remove all viewcontrollers from the navigation stack
                                    self.navigationController!.viewControllers.removeAll()
                                    
                                    self.equationFlowController.showMain()
                                default:
                                    break
                                }
            }
        } else {
            alertBoxWithAction(title: "Incorrect Answer",
                               message: "Unfortunatly the answer is incorrect",
                               options: "Let me try the answer again", "Help me, with an example", "Show me how with this equation") { (option) in
                                switch(option) {
                                case 1:
                                    self.equationFlowController.showHelpScreen(firstNumber: 1234, secondNumber: 567, subject: self.subject)
                                case 2:
                                    self.equationFlowController.showHelpScreen(firstNumber: self.firstNumber, secondNumber: self.secondNumber, subject: self.subject)
                                default:
                                    break
                                }
            }
        }
    }
    
    func divideButton() {
        
        print ("The sum is \(firstNumber) divided by \(secondNumber) equals \(firstNumber / secondNumber)")
         if integer(from: answerInput) == firstNumber / secondNumber {
             alertBoxWithAction(title: "WELL DONE",
                                message: "You gave the correct andswer",
                                options: "Let me try another division", "Let me try a different type of equation") { (option) in
                                 switch(option) {
                                 case 0:
                                     
                                     //Update numbers with new random numbers set to the same digit counts
                                     if self.firstNumber.digits.count == 4 {
                                         self.firstNumber = Int.random(in: 1000...9999)
                                     } else if self.firstNumber.digits.count == 3 {
                                         self.firstNumber = Int.random(in: 100...999)
                                     } else if self.firstNumber.digits.count == 2 {
                                         self.firstNumber = Int.random(in: 10...99)
                                     } else {
                                         self.firstNumber = Int.random(in: 0...9)
                                     }
                                     
                                     if self.secondNumber.digits.count == 4 {
                                         self.secondNumber = Int.random(in: 1000...9999)
                                     } else if self.secondNumber.digits.count == 3 {
                                         self.secondNumber = Int.random(in: 100...999)
                                     } else if self.secondNumber.digits.count == 2 {
                                         self.secondNumber = Int.random(in: 10...99)
                                     } else {
                                         self.secondNumber = Int.random(in: 0...9)
                                     }
                                     
                                     //reset text field to empty and update numbers on screen
                                     self.answerInput.text = ""
                                     self.updateNumbers()
                                 case 1:
                                     
                                     //Remove all viewcontrollers from the navigation stack
                                     self.navigationController!.viewControllers.removeAll()
                                     
                                     self.equationFlowController.showMain()
                                 default:
                                     break
                                 }
             }
         } else {
             alertBoxWithAction(title: "Incorrect Answer",
                                message: "Unfortunatly the answer is incorrect",
                                options: "Let me try the answer again", "Help me, with an example", "Show me how with this equation") { (option) in
                                 switch(option) {
                                 case 1:
                                     self.equationFlowController.showHelpScreen(firstNumber: 1234, secondNumber: 567, subject: self.subject)
                                 case 2:
                                     self.equationFlowController.showHelpScreen(firstNumber: self.firstNumber, secondNumber: self.secondNumber, subject: self.subject)
                                 default:
                                     break
                                 }
             }
         }
     }
    
    @IBAction func answerInput(_ sender: Any) {
    }
    @IBAction func submitButton(_ sender: Any) {
        
        if subject == SubjectType.Additions.name() {
            additionSubmitButton()
        } else if subject == SubjectType.Subtractions.name() {
            subtractionSubmitButton()
        } else if subject == SubjectType.Multiplications.name() {
            multiplyButton()
        } else if subject == SubjectType.Divisions.name() {
            divideButton()
        }
        
        
    }
}
