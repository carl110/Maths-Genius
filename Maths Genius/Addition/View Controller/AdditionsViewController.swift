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
    }
    
    func labelSetup() {
        
        //set up numbers and operation labels
        operation.text = "+"
        operation.numberLabelSetup()
        
        firstNumberLabel.numberLabelSetup()
        firstNumberLabel.text = String(firstNumber)
        
        secondNumberLabel.numberLabelSetup()
        secondNumberLabel.text = String(secondNumber)
        
        answerInput.numberTextSetUp()
        
        submitButton.setTitle("Submit", for: .normal)
        DispatchQueue.main.async {
           self.submitButton.titleButtonSetup()
        }
    }

    @IBAction func answerInput(_ sender: Any) {
    }
    @IBAction func submitButton(_ sender: Any) {
        if integer(from: answerInput) == firstNumber + secondNumber {
            print ("Correct andswer")
        } else {
            print ("Wrong answer")
            alertBoxWithAction(title: "Incorrect Answer",
                               message: "Unfortunatly the answer is incorrect",
                               options: "Let me try the answer again", "Help me", "Show me how") { (option) in
                                switch(option) {
                                case 1:
                                    self.additionsFlowController.showHelpScreen(firstNumber: self.firstNumber, secondNumber: self.secondNumber)
                                case 2:
                                    print ("Show me")
                                default:
                                    break
                                }
            }
        }
    }
}
