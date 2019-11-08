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
    
    private var firstNumber = Int()
    private var secondNumber = Int ()
    private var subject = String()
    
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
        initialSetup()
        labelSetup()
        updateNumbers()
        self.hideKeyboardWhenTappedAround()
    }
    
    func initialSetup() {
        
        //Set the values from previouse screen
        firstNumber = equationViewModel.firstNumber
        secondNumber = equationViewModel.secondNumber
        subject = equationViewModel.subject
        
        //set mainscreen details
        self.view.backgroundColor = UIColor.Shades.standardBlack
        self.title = subject
        answerInput.keyboardType = .numberPad
    }
    
    func labelSetup() {
        
        //Plavce operation value in label
        switch subject {
        case String(describing: SubjectType.Additions):
            operation.text = SubjectType.Additions.rawValue
        case String(describing: SubjectType.Subtractions):
            operation.text = SubjectType.Subtractions.rawValue
        case String(describing: SubjectType.Multiplications):
            operation.text = SubjectType.Multiplications.rawValue
        case String(describing: SubjectType.Divisions):
            operation.text = SubjectType.Divisions.rawValue
        default:
            break
        }
        
        operation.numberLabelSetup()
        firstNumberLabel.numberLabelSetup()
        secondNumberLabel.numberLabelSetup()
        answerInput.numberTextSetUp()
        submitButton.setTitle("Submit", for: .normal)
        submitButton.titleButtonSetup()
    }
    
    func updateNumbers() {
        
        //set labels to new values
        firstNumberLabel.text = String(firstNumber)
        secondNumberLabel.text = String(secondNumber)
    }
    
    func submitAnswer() {
        var sum = Int()
        
        //Set operation for sum calculation
        if subject == String(describing: SubjectType.Additions) {
            sum = (firstNumber + secondNumber)
        } else if subject == String(describing: SubjectType.Subtractions) {
            sum = (firstNumber - secondNumber)
        } else if subject == String(describing: SubjectType.Multiplications) {
            sum = firstNumber * secondNumber
        } else if subject == String(describing: SubjectType.Divisions) {
            sum = firstNumber / secondNumber
        }
        
        if integer(from: answerInput) == sum {
            alertBoxWithAction(title: "WELL DONE",
                               message: "You gave the correct answer",
                               options: "Let me try another \(subject.lowercased().dropLast())",
            "Let me try a different type of equation") { (option) in
                switch(option) {
                case 0:
                    self.setFirstNumber()
                    self.setSecondNumber()
                    
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
                               message: "Unfortunatly the answer you gave is wrong",
                               options: "Let me try the answer again",
                               "Help me, with an example",
                               "Show me how with this equation") { (option) in
                                switch(option) {
                                case 1:
                                    self.equationFlowController.showHelpScreen(firstNumber: 138, secondNumber: 3, subject: self.subject)
                                case 2:
                                    self.equationFlowController.showHelpScreen(firstNumber: self.firstNumber, secondNumber: self.secondNumber, subject: self.subject)
                                default:
                                    break
                                }
            }
        }
    }
    
    func setFirstNumber() {
        
        //Update numbers with new random numbers set to the same digit counts
        var fnLowerLimit = 0
        var fnUpperLimit = 0
        
        for index in 1...firstNumber.digits.count {
            fnLowerLimit *= 10
            fnUpperLimit *= 10
            fnUpperLimit += 9
            
            //If digit count is 1 ensure lower limit is atleast 1
            if index == 1 {
                fnLowerLimit = 1
            }
        }
        firstNumber = Int.random(in: fnLowerLimit...fnUpperLimit)
    }
    
    func setSecondNumber() {
        
        var secondNumberUpperLimit = 0
        var secondNumberLowerLimit = 0
        
        if (subject == String(describing: SubjectType.Subtractions) || subject == String(describing: SubjectType.Divisions)) &&  firstNumber.digits.count == secondNumber.digits.count {
            //Make secondnumber <= first number
            secondNumberUpperLimit = firstNumber
        } else {
            
            //set second number based on place values chosen
            for _ in 1...secondNumber.digits.count {
                secondNumberUpperLimit *= 10
                secondNumberUpperLimit += 9
            }
        }
        
        //set second number based on place values chosen
        for index in 1...secondNumber.digits.count {
            secondNumberLowerLimit *= 10
            //If digit count is 1 ensure lower limit is atleast 1
            if index == 1 {
                secondNumberLowerLimit = 1
            }
        }
        
        //If division make sure first number is divisable by second, else just pick random number
        if subject == String(describing: SubjectType.Divisions) {
            secondNumber = firstNumber.randomDivisable(lowerLimit: secondNumberLowerLimit, upperLimit: secondNumberUpperLimit)
        } else {
            self.secondNumber = Int.random(in: secondNumberLowerLimit...secondNumberUpperLimit)
        }
    }
    
    @IBAction func submitButton(_ sender: Any) {
        submitAnswer()
    }
}
