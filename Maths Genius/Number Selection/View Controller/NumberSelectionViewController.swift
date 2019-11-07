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
    
    private var subject = String()
    private var firstNumber = Int()
    private var secondNumber = Int()
    
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
        firstNumberLabel.bodyLabelSetUp()
        firstNumberLabel.text = "Select how large you would like the first number in the equasion"
        secondNumberLabel.bodyLabelSetUp()
        secondNumberLabel.text = "Select how large you would like the first number in the equasion"
        
        firstNumberOutcome.bodyLabelSetUp()
        secondNumberOutcome.bodyLabelSetUp()
        
        continueButton.subTitleButtonSetup()
        continueButton.setTitle("Continue to \(subject)", for: .normal)
        
        self.view.backgroundColor = UIColor.Shades.standardBlack
        self.title = "Number selection"
        
        //disable selector and button to force pick order
        secondNumberSelector.isEnabled = false
        
        firstNumberSelector.backgroundColor = UIColor.Yellows.gryffindorYellow
        secondNumberSelector.backgroundColor = UIColor.Yellows.gryffindorYellow
        
        continueButton.disableButton()
    }
    
    @IBAction func firstNumberSelector(_ sender: Any) {
        
        //Disable button to force a second number selection
        continueButton.disableButton()
        
        //remove tint form slected second number
        if #available(iOS 13.0, *) {
            secondNumberSelector.selectedSegmentTintColor = UIColor.Transparent.clear
        } else {
            secondNumberSelector.tintColor = UIColor.Transparent.clear
        }
        
        //unselect segment for second number
        secondNumberSelector.selectedSegmentIndex = UISegmentedControl.noSegment

        //enable all segments in secondnumberselector
        for segment in 0...3 {
            secondNumberSelector.setEnabled(true, forSegmentAt: segment)
        }
        
        //set segments to selectable
        secondNumberSelector.isEnabled = true
        
        //random number for selection
        switch firstNumberSelector.selectedSegmentIndex
        {
        case 0:
            numberSelectionText(numberOutcome: firstNumberOutcome, lowerNumber: 1000, upperNumber: 9999, numberPlace: "first")
            //            firstNumberOutcome.text = "You have selected Thousands for your first number. \n This means your first number will be between 1000 and 9999"
            firstNumber = Int.random(in: 1000...9999)
        case 1:
            numberSelectionText(numberOutcome: firstNumberOutcome, lowerNumber: 100, upperNumber: 999, numberPlace: "first")
            firstNumber = Int.random(in: 100...999)
        case 2:
            numberSelectionText(numberOutcome: firstNumberOutcome, lowerNumber: 10, upperNumber: 99, numberPlace: "first")
            firstNumber = Int.random(in: 10...99)
        case 3:
            numberSelectionText(numberOutcome: firstNumberOutcome, lowerNumber: 1, upperNumber: 9, numberPlace: "first")
            firstNumber = Int.random(in: 1...9)
        default:
            break
        }
        
        if (subject == SubjectType.Subtractions.name() || subject == SubjectType.Divisions.name()) && firstNumberSelector.selectedSegmentIndex > 0 {
            for segment in 1...self.firstNumberSelector.selectedSegmentIndex {
                //unselect segments in seconNumberSelector
                secondNumberSelector.selectedSegmentIndex = UISegmentedControl.noSegment
                secondNumberOutcome.text = ""
                
                self.secondNumberSelector.setEnabled(false, forSegmentAt: segment - 1)
            }
        }
    }
    @IBAction func secondNumberSelector(_ sender: Any) {
        
        //Add tint to show selectiomn
        if #available(iOS 13.0, *) {
            secondNumberSelector.selectedSegmentTintColor = UIColor.Shades.standardWhite
        } else {
            secondNumberSelector.tintColor = UIColor.Shades.standardWhite
        }
        
        switch secondNumberSelector.selectedSegmentIndex
        {
        case 0:
            numberSelectionText(numberOutcome: secondNumberOutcome, lowerNumber: 1000, upperNumber: 9999, numberPlace: "second")
            subtractionOrDivision(lowerNumber: 1000, upperNumber: 9999)
        case 1:
            numberSelectionText(numberOutcome: secondNumberOutcome, lowerNumber: 100, upperNumber: 999, numberPlace: "second")
            subtractionOrDivision(lowerNumber: 100, upperNumber: 999)
        case 2:
            numberSelectionText(numberOutcome: secondNumberOutcome, lowerNumber: 10, upperNumber: 99, numberPlace: "second")
            subtractionOrDivision(lowerNumber: 10, upperNumber: 99)
        case 3:
            numberSelectionText(numberOutcome: secondNumberOutcome, lowerNumber: 1, upperNumber: 9, numberPlace: "second")
            subtractionOrDivision(lowerNumber: 1, upperNumber: 9)
        default:
            break
        }
        //enable button to proceed to next page
        continueButton.enableButton()
    }
    
    func subtractionOrDivision(lowerNumber: Int, upperNumber: Int) {
        
        //If subtraction make second number smaller than or equal to first number
        if subject == SubjectType.Subtractions.name() && firstNumberSelector.selectedSegmentIndex == secondNumberSelector.selectedSegmentIndex {
            secondNumber = Int.random(in: lowerNumber...firstNumber)
        } else if subject == SubjectType.Divisions.name() { //If division make sure second number is a divisor of firstnumber
            secondNumber = firstNumber.randomDivisable(lowerLimit: lowerNumber, upperLimit: upperNumber)
            print ("subject is division \(secondNumber) fn = \(firstNumber)")
        }else { //Otherwise allow full random selection
            secondNumber = Int.random(in: lowerNumber...upperNumber)
        }
    }
    
    @IBAction func continueButton(_ sender: Any) {
        numberSelectionFlowController.showEquation(firstNumber: firstNumber, secondNumber: secondNumber, subject: subject)
    }
}
