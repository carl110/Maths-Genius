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
    
    @IBOutlet weak var step1Image: UIImageView!
    
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
        step1Label.text = "THIS IS SOME SAMPLE TEXT"
        step1Image.image = UIImage(named: "wand")
    }
    
    func example() {
        
        exampleLabel.exampleLabelSetUp()
        
        exampleLabel.text = "Using the equation \(firstNumber) + \(secondNumber) we can do the following : \n\n"
        
    }
    

    
}
