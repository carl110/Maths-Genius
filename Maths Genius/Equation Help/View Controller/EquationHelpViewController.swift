//
//  EquationHelpViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 20/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class EquationHelpViewController: UIViewController {
    
    fileprivate var equationHelpFlowController: EquationHelpFlowController!
    fileprivate var equationHelpViewModel: EquationHelpViewModel!
    fileprivate var equationHelpModel = EquationHelpModel()
    
    var firstNumber = Int()
    var secondNumber = Int ()
    
    var subtractByBorrowingExample = ["Text example"]
    
    @IBOutlet weak var returnToEquation: UIButton!
    
    @IBOutlet weak var newEquation: UIButton!
    
    @IBOutlet weak var pageTitle: UILabel!
    
    @IBOutlet weak var customCollectionView: CustomCollectionView!
    
    func assignDependancies(equationHelpFlowController: EquationHelpFlowController, equationHelpViewModel: EquationHelpViewModel) {
        self.equationHelpViewModel = equationHelpViewModel
        self.equationHelpFlowController = equationHelpFlowController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
        buttonSetup()
        cellDataSetUp()
        
    }
    
    func setUpLabels() {
        firstNumber = equationHelpViewModel.firstNumber
        secondNumber = equationHelpViewModel.secondNumber
        
        subtractByBorrowingExample = subtractByBorrowing(firstNumber: firstNumber, secondNumber: secondNumber)
        
        pageTitle.text = "Rounding Numbers"
        pageTitle.titleLabelSetUp()
        self.view.backgroundColor = UIColor.Shades.standardBlack
        
        
        
    }
    
    func buttonSetup() {
        returnToEquation.subTitleButtonSetup()
        newEquation.subTitleButtonSetup()
        
        returnToEquation.setTitle("Return to the equation", for: .normal)
        newEquation.setTitle("Let me try a new equation", for: .normal)
    }
    
    func cellDataSetUp() {
        customCollectionView.cellData = equationHelpModel.stepText + subtractByBorrowingExample
        customCollectionView.cellImage = equationHelpModel.stepImage
    }
    
    @IBAction func returnToEquation(_ sender: Any) {
        
        self.popBack(3)
    }
    
    @IBAction func newEquation(_ sender: Any) {
        //Remove all viewcontrollers from the navigation stack
        self.navigationController!.viewControllers.removeAll()
        
        equationHelpFlowController.showMain()
        //        roundNumbersFlowController.showMain()
    }
    
}
