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
    fileprivate var additionsHelpModel = AdditionsHelpModel()
    
    var firstNumber = Int()
    var secondNumber = Int()
    var helpTitle = String()
    
    var exampleText = [String]()
    var stepText = [String]()
    var stepImage = [UIImage]()
    
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
        objectSetUp()
        pageSetup()
        buttonSetup()
        print ("Help Title \(helpTitle)")
        helpSubjectSetup()
        print ("Step text = \(stepText)")
        cellDataSetUp()
    }
    
    func objectSetUp() {
        firstNumber = equationHelpViewModel.firstNumber
        secondNumber = equationHelpViewModel.secondNumber
        helpTitle = equationHelpViewModel.helpTitle
        pageTitle.text = equationHelpViewModel.helpTitle
        
    }
    
    func pageSetup() {
        self.view.backgroundColor = UIColor.Shades.standardBlack
        self.title = equationHelpViewModel.helpTitle
    }
    
    func buttonSetup() {
        returnToEquation.setTitle("Return to the equation", for: .normal)
        returnToEquation.subTitleButtonSetup()
        newEquation.setTitle("Let me try a new equation", for: .normal)
        newEquation.subTitleButtonSetup()
    }
    
    func cellDataSetUp() {
        customCollectionView.cellData = stepText + exampleText
        customCollectionView.cellImage = stepImage
    }
    
    func helpSubjectSetup() {
        if helpTitle == HelpSubject.Additions.RoundingNumbers.name() {
            stepText = additionsHelpModel.roundingNumberStepText
            stepImage = additionsHelpModel.roundingNumberStepImage
            exampleText = roundNumber(firstNumber: firstNumber, secondNumber: secondNumber)
        }
        
        if helpTitle == HelpSubject.Additions.UsingPlaceValues.name() {
            stepText = additionsHelpModel.usingPlaceValuesStepText
            stepImage = additionsHelpModel.usingPlaceValuesStepImage
            exampleText = usingPlaceValues(firstNumber: firstNumber, secondNumber: secondNumber)
        }
        
        if helpTitle == HelpSubject.Subtractions.SubtractByBorrowing.name() {
            stepText = equationHelpModel.subtractByBorrowingStepText
            stepImage = equationHelpModel.subtractByBorrowingStepImage
            exampleText = subtractByBorrowing(firstNumber: firstNumber, secondNumber: secondNumber)
        }
    }
    
    @IBAction func returnToEquation(_ sender: Any) {
        
        //go back to equation in stack
        self.popBack(3)
    }
    
    @IBAction func newEquation(_ sender: Any) {
        
        //Remove all viewcontrollers from the navigation stack and return to main
        self.navigationController!.viewControllers.removeAll()
        equationHelpFlowController.showMain()
    }
    
}
