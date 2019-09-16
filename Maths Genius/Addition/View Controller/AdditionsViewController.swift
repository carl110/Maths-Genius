//
//  AdditionsViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 11/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class AdditionsViewController: UIViewController {
    
    fileprivate var additionsViewModel: AdditionsViewModel!
    fileprivate var additionsFlowController: AdditionsFlowController!
    
    var firstNumber = Int()
    var secondNumber = Int ()
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var answerInput: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    func assignDependancies(additionsFlowController: AdditionsFlowController, additionsViewModel: AdditionsViewModel){
        self.additionsFlowController = additionsFlowController
        self.additionsViewModel = additionsViewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        
        //Set the values from previouse screen
        firstNumber = additionsViewModel.firstNumber
        secondNumber = additionsViewModel.secondNumber
        
        //set mainscreen details
        self.view.backgroundColor = UIColor.Shades.standardBlack
        self.title = "Additions"
        labelSetup()
        updateNumbers()
    }
    
    func labelSetup() {
        
        //set up numbers and operation labels
        operation.text = "+"
        operation.numberLabelSetup()
        
        firstNumberLabel.numberLabelSetup()

        secondNumberLabel.numberLabelSetup()

        answerInput.numberTextSetUp()
        
        submitButton.setTitle("Submit", for: .normal)
        DispatchQueue.main.async {
           self.submitButton.titleButtonSetup()
        }
    }
    
    func updateNumbers() {
        firstNumberLabel.text = String(firstNumber)
        secondNumberLabel.text = String(secondNumber)
        
    }

    @IBAction func answerInput(_ sender: Any) {
    }
    @IBAction func submitButton(_ sender: Any) {
        if integer(from: answerInput) == firstNumber + secondNumber {
            print ("Correct andswer")
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
                                    
                                    self.additionsFlowController.showMain()
                                default:
                                    break
                                }
            }
        } else {
            print ("Wrong answer")
            alertBoxWithAction(title: "Incorrect Answer",
                               message: "Unfortunatly the answer is incorrect",
                               options: "Let me try the answer again", "Help me", "Show me how") { (option) in
                                switch(option) {
                                case 1:
                                    self.additionsFlowController.showHelpScreen(firstNumber: 1234, secondNumber: 567)
                                case 2:
                                    self.additionsFlowController.showHelpScreen(firstNumber: self.firstNumber, secondNumber: self.secondNumber)
                                default:
                                    break
                                }
            }
        }
    }
}
