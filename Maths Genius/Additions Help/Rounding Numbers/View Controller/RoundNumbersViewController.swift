//
//  RoundNumbersViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 12/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class RoundNumbersViewController: UIViewController {
    
    fileprivate var roundNumbersFlowController: RoundNumbersFlowController!
    fileprivate var additionsHelpViewModel: AdditionsHelpViewModel!
    fileprivate var roundNumbersModel = RoundingNumbersModel()
    
    var firstNumber = Int()
    var secondNumber = Int ()
    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var step1Label: UILabel!
    @IBOutlet weak var step2Label: UILabel!
    @IBOutlet weak var step3Label: UILabel!
    
    @IBOutlet weak var step1Image: UIImageView!
    @IBOutlet weak var step2Image: UIImageView!
    @IBOutlet weak var step3Image: UIImageView!
    
    @IBOutlet weak var exampleLabel: UILabel!
    
    
    func assignDependancies(roundNumbersFlowController: RoundNumbersFlowController, additionsHelpViewModel: AdditionsHelpViewModel) {
        self.additionsHelpViewModel = additionsHelpViewModel
        self.roundNumbersFlowController = roundNumbersFlowController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
        example()
    }
    
    func setUpLabels() {
        firstNumber = additionsHelpViewModel.firstNumber
        secondNumber = additionsHelpViewModel.secondNumber
        
        pageTitle.text = "Rounding Numbers"
        pageTitle.titleLabelSetUp()
        self.view.backgroundColor = UIColor.Shades.standardBlack
        
        step1Label.subTitleLabelSetUp()
        step2Label.subTitleLabelSetUp()
        step3Label.subTitleLabelSetUp()
        
        step1Label.text = roundNumbersModel.step1
        step2Label.text = roundNumbersModel.step2
        step3Label.text = roundNumbersModel.step3

        step1Image.image = UIImage(named: "roundingNumberStep1")
        step2Image.image = UIImage(named: "roundingNumberStep2")
        step3Image.image = UIImage(named: "roundingNumberStep3")
        
    }
    
    func example() {
        
        exampleLabel.exampleLabelSetUp()
        
        let firstNumberRound = 10 - firstNumber.digits.last
        let secondNumberRound = 10 - secondNumber.digits.last
        
        exampleLabel.text = "Using the equation \(firstNumber) + \(secondNumber) we can do the following : \n\nAdd \(firstNumberRound) the \(firstNumber)\nAdd \(secondNumberRound) to \(secondNumber)\n\nYour new equation is \(firstNumberRound + firstNumber) + \(secondNumberRound + secondNumber)\n\n\(firstNumberRound + firstNumber) + \(secondNumberRound + secondNumber) = \(firstNumberRound + firstNumber + secondNumberRound + secondNumber)\nThe numbers added to make the round equation are \(firstNumberRound) + \(secondNumberRound) = \(firstNumberRound + secondNumberRound)\n\nNow take the equated round number and minus the added numbers\n\n\(firstNumberRound + firstNumber + secondNumberRound + secondNumber) - \(firstNumberRound + secondNumberRound) = \(firstNumber + secondNumber)"
        
    }
    

    
}
