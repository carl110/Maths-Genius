//
//  MySum.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 05/11/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class MySumViewController: UIViewController, PickerViewDelegate {
    
    
    
    fileprivate var mySumFlowController: MySumFlowController!
    fileprivate var mySumViewModel: MySumViewModel!
    
    private var operationSelected = "+"

    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var answerInputLabel: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var firstNumberInput: UITextField!
    @IBOutlet weak var secondNumberInput: UITextField!
    @IBOutlet weak var answerInput: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var operationSelection: OperationPickerView!
    
    func assignDependancies(mySumFlowController: MySumFlowController, mySumViewModel: MySumViewModel) {
        self.mySumViewModel = mySumViewModel
        self.mySumFlowController = mySumFlowController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        labelSetup()
        self.hideKeyboardWhenTappedAround()
        operationSelection.rowDelegate = self
    }
    
    func initialSetup() {
        
        //set mainscreen details
        self.view.backgroundColor = UIColor.Shades.standardBlack
        self.title = "My Sum"
        answerInput.keyboardType = .numberPad
        answerInput.keyboardAppearance = .dark
        firstNumberInput.keyboardType = .numberPad
        firstNumberInput.keyboardAppearance = .dark
        secondNumberInput.keyboardType = .numberPad
        secondNumberInput.keyboardAppearance = .dark
    }
    
    func labelSetup() {
        
        //Dispatch used to get wounding to work on both sides together
        DispatchQueue.main.async { [weak self] in
            self?.operationSelection.roundCorners(for: [.bottomRight, .bottomLeft], cornerRadius: SingletonClass.sharedInstance.cornerRoundingNumber)
        }
        firstNumberInput.mySumNumberTextSetUp()
        secondNumberInput.mySumNumberTextSetUp()
        answerInput.mySumNumberTextSetUp()
        operationSelection.backgroundColor = UIColor.Yellows.gryffindorYellow
        firstNumberLabel.mySumLabelSetup()
        secondNumberLabel.mySumLabelSetup()
        operationLabel.mySumLabelSetup()
        answerInputLabel.mySumLabelSetup()
        submitButton.titleButtonSetup()
        firstNumberLabel.text = "First Number"
        secondNumberLabel.text = "Second Number"
        operationLabel.text = "Operation"
        answerInputLabel.text = "Answer"
        submitButton.setTitle("Help", for: .normal)
    }
    
    func pickerViewSelectedItem(operation: String) {
        operationSelected = operation
    }
    
    func submitAnswer() {
        var sum = Int()
        let firstNumber: Int? = Int(firstNumberInput.text!)
        let secondNumber: Int? = Int(secondNumberInput.text!)
        var subject = "Additions"
        
        if operationSelected == "+" {
            sum = firstNumber! + secondNumber!
            subject = SubjectType.Additions.name()
        } else if operationSelected == "-" {
            sum = firstNumber! - secondNumber!
            subject = SubjectType.Subtractions.name()
        } else if operationSelected == "÷" {
            sum = firstNumber! / secondNumber!
            subject = SubjectType.Divisions.name()
        } else if operationSelected == "×" {
            sum = firstNumber! * secondNumber!
            subject = SubjectType.Multiplications.name()
        }
        
        //If the number contains decimals then stop and show alert
        guard firstNumber! % secondNumber! == 0 else {
            alert(message: "This Division contains remainder, the help secotion can only help with whole numbers. Please try a different equation.")
            return
        }
        
        //Sum is correct
        if integer(from: answerInput) == sum {
            alertBoxWithAction(title: "WELL DONE",
                               message: "You gave the correct answer",
                               options: "Let me try a new sum", "Take me back to the Home screen") { (option) in
                                switch(option) {
                                case 0:
                                    
                                    //clear text fields
                                    self.firstNumberInput.text = ""
                                    self.secondNumberInput.text = ""
                                    self.answerInput.text = ""
                                case 1:
                                    
                                    //Remove all viewcontrollers from the navigation stack
                                    self.navigationController!.viewControllers.removeAll()
                                    self.mySumFlowController.showMain()
                                default:
                                    break
                                }
            }
        } else { //Answer incorrect
            alertBoxWithAction(title: "Incorrect Answer",
                               message: "Unfortunatly the answer you gave is wrong",
                               options: "Let me try the answer again",
                               "Help me, with an example",
                               "Show me how with this equation") { (option) in
                                switch(option) {
                                case 1:
                                    self.mySumFlowController.showHelpScreen(firstNumber: 138, secondNumber: 3, subject: subject)
                                case 2:
                                    self.mySumFlowController.showHelpScreen(firstNumber: firstNumber!, secondNumber: secondNumber!, subject: subject)
                                default:
                                    break
                                }
            }
        }
    }

    @IBAction func answerInput(_ sender: Any) {
        
        guard let answer = answerInput, !answer.isEmpty else {
            submitButton.setTitle("Help", for: .normal)
            return
        }
        
        submitButton.setTitle("Submit", for: .normal)
    }

    @IBAction func submitButton(_ sender: Any) {
        
        //If either fn or sn are empty the show alert
        guard let fnText = firstNumberInput, let snText = secondNumberInput, !fnText.isEmpty, !snText.isEmpty else {
            
            alert(message: "You must enter a number into both the First Number and Second Number fields")
            return
        }
        submitAnswer()
    }
}
