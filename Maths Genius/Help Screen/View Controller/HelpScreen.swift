//
//  HelpScreen.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 30/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class HelpScreenViewController: UIViewController, HelpSectionSelectedDelegate {
    
    fileprivate var helpScreenFlowController: HelpScreenFlowController!
    fileprivate var helpScreenViewModel: HelpScreenViewModel!
    fileprivate var helpScreenModel = HelpScreenModel()
    
    var firstNumber = Int()
    var secondNumber = Int ()

    @IBOutlet weak var customTable: CustomTable!
    

    func assignDependancies(helpScreenFlowController: HelpScreenFlowController, helpScreenViewModel: HelpScreenViewModel) {
    self.helpScreenViewModel = helpScreenViewModel
    self.helpScreenFlowController = helpScreenFlowController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        customTable.cellDelegate = self

        firstNumber = helpScreenViewModel.firstNumber
        secondNumber = helpScreenViewModel.secondNumber
        
    }
    
    func setUp() {
        
        self.title = "How to..."
        self.view.backgroundColor = UIColor.Shades.standardBlack
        
        tableSetUp()
    }
    
    func tableSetUp() {
        customTable.customCellsData = ["Using Place Values", "Rounding Numbers", "qsfeewqf"]
    }

    func cellWasSelected(id: Int) {
        
        //switch using cell idex to goto next screen
        switch id {
        case 0:
            helpScreenFlowController.showUsingPlaceValues(firstNumber: 9999, secondNumber: 9999)
        case 1:
            helpScreenFlowController.showRoundingNumbers(firsyNumber: firstNumber, secondNumber: secondNumber)
        default:
            break
        }
    }
}
