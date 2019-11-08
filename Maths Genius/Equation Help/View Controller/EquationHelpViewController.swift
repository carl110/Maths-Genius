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
    fileprivate var subtractionHelpModel = SubtractionHelpModel()
    fileprivate var additionsHelpModel = AdditionsHelpModel()
    fileprivate var multiplicationHelpModel = MultiplicationHelpModel()
    fileprivate var divisionHelpModel = DivisionHelpModel()
    
    private var firstNumber = Int()
    private var secondNumber = Int()
    private var helpTitle = String()
    
    private var exampleText = [String]()
    private var stepText = [String]()
    private var stepImage = [UIImage]()
    
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
        helpSubjectSetup()
        cellDataSetUp()
    }
    
    func objectSetUp() {
        firstNumber = equationHelpViewModel.firstNumber
        secondNumber = equationHelpViewModel.secondNumber
        helpTitle = equationHelpViewModel.helpTitle
        pageTitle.text = equationHelpViewModel.helpTitle
        pageTitle.titleLabelSetUp()
        
    }
    
    func pageSetup() {
        self.view.backgroundColor = UIColor.Shades.standardBlack
        self.title = equationHelpViewModel.subject
    }
    
    func buttonSetup() {
        returnToEquation.setTitle("Return to the \(equationHelpViewModel.subject)", for: .normal)
        returnToEquation.subTitleButtonSetup()
        newEquation.setTitle("Let me try a new equation", for: .normal)
        newEquation.subTitleButtonSetup()
    }
    
    func cellDataSetUp() {
        customCollectionView.cellData = stepText + exampleText
        customCollectionView.cellImage = stepImage
    }
    
    func helpSubjectSetup() {
        
        switch helpTitle {
            
        //Additions
        case HelpSubject.Additions.RoundingNumbers.rawValue:
            stepText = additionsHelpModel.roundingNumberStepText
            stepImage = additionsHelpModel.roundingNumberStepImage
            exampleText = roundNumber(firstNumber: firstNumber, secondNumber: secondNumber)
        case HelpSubject.Additions.UsingPlaceValues.rawValue:
            stepText = additionsHelpModel.usingPlaceValuesStepText
            stepImage = additionsHelpModel.usingPlaceValuesStepImage
            exampleText = usingPlaceValues(firstNumber: firstNumber, secondNumber: secondNumber)
        case HelpSubject.Additions.HundredsSquare.rawValue:
            stepText = additionsHelpModel.hundresSquareStepText
            stepImage = additionsHelpModel.hundredsSquareStepImage
            exampleText = hundredsSquare(firstNumber: firstNumber, secondNumber: secondNumber)
        
        //Subtractions
        case HelpSubject.Subtractions.SubtractByBorrowing.rawValue:
            stepText = subtractionHelpModel.subtractByBorrowingStepText
            stepImage = subtractionHelpModel.subtractByBorrowingStepImage
            exampleText = subtractByBorrowing(firstNumber: firstNumber, secondNumber: secondNumber)
        
        //Multiplication
        case HelpSubject.Multiplications.PeopleAndSweets.rawValue:
            stepText = multiplicationHelpModel.peopleAndSweetsStepText
            stepImage = multiplicationHelpModel.peopleAndSweetsStepImage
            exampleText = peopleAndSweets(firstNumber: firstNumber, secondNumber: secondNumber)
        
        //Division
        case HelpSubject.Divisions.LongDivision.rawValue:
            stepText = divisionHelpModel.longDivisionStepText
            stepImage = divisionHelpModel.longDivisionStepImage
            exampleText = longDivision(firstNumber: firstNumber, secondNumber: secondNumber)
        default:
            break
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
