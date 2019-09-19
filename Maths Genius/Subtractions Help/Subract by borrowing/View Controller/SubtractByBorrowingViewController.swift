//
//  subtractByBorrowingViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 17/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class SubtractByBorrowingViewController: UIViewController {

    fileprivate var subtractByBorrowingFlowController: SubtractByBorrowingFlowController!
    fileprivate var subtractByBorrowingViewModel = SubtractByBorrowingViewModel()
    fileprivate var subtractionsHelpViewModel: SubtractionsHelpViewModel!
    
    var firstNumber = Int()
    var secondNumber = Int ()
    
    @IBOutlet weak var returnToEquation: UIButton!
    
    @IBOutlet weak var newEquation: UIButton!
    
    @IBOutlet weak var pageTitle: UILabel!
    
    @IBOutlet weak var customCollectionView: CustomCollectionView!
    
    func assignDependancies(subtractByBorrowingFlowController: SubtractByBorrowingFlowController, subtractionsHelpViewModel: SubtractionsHelpViewModel) {
        self.subtractionsHelpViewModel = subtractionsHelpViewModel
        self.subtractByBorrowingFlowController = subtractByBorrowingFlowController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
        buttonSetup()
        cellDataSetUp()
    }
    
    func setUpLabels() {
        firstNumber = subtractionsHelpViewModel.firstNumber
        secondNumber = subtractionsHelpViewModel.secondNumber
        
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
        customCollectionView.cellData = subtractByBorrowingViewModel.stepText
        customCollectionView.cellImage = subtractByBorrowingViewModel.stepImage
    }
    

    @IBAction func returnToEquation(_ sender: Any) {
        
        self.popBack(3)
    }
    
    @IBAction func newEquation(_ sender: Any) {
        //Remove all viewcontrollers from the navigation stack
        self.navigationController!.viewControllers.removeAll()
        
        subtractByBorrowingFlowController.showMain()
//        roundNumbersFlowController.showMain()
    }

}
