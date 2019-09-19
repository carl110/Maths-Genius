//
//  NumberSelectionViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit



class NumberSelectionViewController: UIViewController {
    
    fileprivate var numberSelectionViewModel: NumberSelectionViewModel!
    fileprivate var numberSelectionFlowController: NumberSelectionFlowController!
    
    var subject = String()
    var firstNumber = Int()
    var secondNumber = Int()
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var firstNumberOutcome: UILabel!
    @IBOutlet weak var secondNumberOutcome: UILabel!
    @IBOutlet weak var firstNumberSelector: UISegmentedControl!
    @IBOutlet weak var secondNumberSelector: UISegmentedControl!
    @IBOutlet weak var continueButton: UIButton!
    
    func assignDependancies(numberSelectionFlowController: NumberSelectionFlowController, numberSelectionViewModel: NumberSelectionViewModel){
        self.numberSelectionFlowController = numberSelectionFlowController
        self.numberSelectionViewModel = numberSelectionViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set subject name from button push on previouse page
        subject = numberSelectionViewModel.subject
        
        setUp()
    }
    
    func setUp() {
        firstNumberLabel.titleLabelSetUp()
        secondNumberLabel.titleLabelSetUp()
        firstNumberLabel.text = "Select how large you would like the first number in the equasion"
        secondNumberLabel.text = "Select how large you would like the first number in the equasion"
        
        firstNumberOutcome.subTitleLabelSetUp()
        secondNumberOutcome.subTitleLabelSetUp()
        
        continueButton.subTitleButtonSetup()
        continueButton.setTitle("Continue to \(subject)", for: .normal)
        
        self.view.backgroundColor = UIColor.Shades.standardBlack
        self.title = "Select your Numbers for \(subject)"
        
        //disable selector and button to force pick order
        secondNumberSelector.isEnabled = false
        
        continueButton.disableButton()
    }
    
    @IBAction func firstNumberSelector(_ sender: Any) {
        

        
        //enable all segments in secondnumberselector
        for i in 0...3 {
            secondNumberSelector.setEnabled(true, forSegmentAt: i)
        }
        secondNumberSelector.isEnabled = true
        
        //random number for selection
        switch firstNumberSelector.selectedSegmentIndex
        {
        case 0:
            firstNumberOutcome.text = "You have selected Thousands for your first number. \n This means your first number will be between 1000 and 9999"
            firstNumber = Int.random(in: 1000...9999)
        case 1:
            firstNumberOutcome.text = "You have selected Hundreds for your first number. \n This means your first number will be between 100 and 999"
            firstNumber = Int.random(in: 100...999)
        case 2:
            firstNumberOutcome.text = "You have selected Tens for your first number. \n This means your first number will be between 10 and 99"
            firstNumber = Int.random(in: 10...99)
        case 3:
            firstNumberOutcome.text = "You have selected Units for your first number. \n This means your first number will be between 1 and 9"
            firstNumber = Int.random(in: 1...9)
        default:
            break
        }
        
        if subject == Subject.Subtractions.name() && firstNumberSelector.selectedSegmentIndex > 0 {
            for i in 1...self.firstNumberSelector.selectedSegmentIndex {
                //unselect segments in seconNumberSelector
                secondNumberSelector.selectedSegmentIndex = UISegmentedControl.noSegment
                secondNumberOutcome.text = ""
                
                self.secondNumberSelector.setEnabled(false, forSegmentAt: i - 1)
            }
        }
    }
    @IBAction func secondNumberSelector(_ sender: Any) {
        
        print ("segment selected \(secondNumberSelector.selectedSegmentIndex)")
        
        switch secondNumberSelector.selectedSegmentIndex
        {
        case 0:
            secondNumberOutcome.text = "You have selected Thousands for your second number. \n This means your second number will be between 1000 and 9999"
            
            if subject == Subject.Subtractions.name() && firstNumberSelector.selectedSegmentIndex == secondNumberSelector.selectedSegmentIndex {
                secondNumber = Int.random(in: 1000...firstNumber)
            } else {
                secondNumber = Int.random(in: 1000...9999)
            }
            
        case 1:
            secondNumberOutcome.text = "You have selected Hundreds for your second number. \n This means your second number will be between 100 and 999"
            
            if subject == Subject.Subtractions.name() && firstNumberSelector.selectedSegmentIndex == secondNumberSelector.selectedSegmentIndex {
                secondNumber = Int.random(in: 100...firstNumber)
            } else {
                secondNumber = Int.random(in: 100...999)
            }
            
        case 2:
            secondNumberOutcome.text = "You have selected Tens for your second number. \n This means your second number will be between 10 and 99"
            
            if subject == Subject.Subtractions.name() && firstNumberSelector.selectedSegmentIndex == secondNumberSelector.selectedSegmentIndex {
                secondNumber = Int.random(in: 10...firstNumber)
            } else {
                secondNumber = Int.random(in: 10...99)
            }

        case 3:
            secondNumberOutcome.text = "You have selected Units for your second number. \n This means your second number will be between 1 and 9"
            
            if subject == Subject.Subtractions.name() && firstNumberSelector.selectedSegmentIndex == secondNumberSelector.selectedSegmentIndex {
                secondNumber = Int.random(in: 1...firstNumber)
            } else {
                secondNumber = Int.random(in: 1...9)
            }

        default:
            break
        }
        
        //enable button to proceed to next page
        continueButton.enableButton()
    }
    
    @IBAction func continueButton(_ sender: Any) {
        
        numberSelectionFlowController.showAdditions(firstNumber: firstNumber, secondNumber: secondNumber, subject: subject)
        
    }
    
}
