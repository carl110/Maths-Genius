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
    var subject = String()
    var helpTitle = String()

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var customTable: CustomTable!
    

    func assignDependancies(helpScreenFlowController: HelpScreenFlowController, helpScreenViewModel: HelpScreenViewModel) {
    self.helpScreenViewModel = helpScreenViewModel
    self.helpScreenFlowController = helpScreenFlowController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        customTable.cellDelegate = self
    }
    
    func setUp() {
        
        firstNumber = helpScreenViewModel.firstNumber
        secondNumber = helpScreenViewModel.secondNumber
        subject = helpScreenViewModel.subject
        
        self.title = "How to..."
        self.view.backgroundColor = UIColor.Shades.standardBlack
        
        titleLabel.text = "Select the help item below..."
        titleLabel.titleLabelSetUp()
        
        tableSetUp()
    }
    
    func tableSetUp() {
        customTable.backgroundColor = UIColor.Shades.standardBlack
        
        if subject == SubjectType.Additions.name() {
            print ("Additions chosen")
            customTable.customCellsData = ["Using Place Values", "Rounding Numbers"]
        } else if subject == SubjectType.Subtractions.name() {
            print ("Subtractions chosen")
            customTable.customCellsData = ["Subtract By Borrowing"]
        }
        
    }


    func cellWasSelected(id: Int, title: String) {
        
        helpTitle = title
        
                        helpScreenFlowController.equationHelp(firstNumber: firstNumber, secondNumber: secondNumber, helpTitle: helpTitle)

    }
}
