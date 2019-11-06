//
//  MySum.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 05/11/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class MySumViewController: UIViewController {
    
    fileprivate var mySumFlowController: MySumFlowController!
    fileprivate var mySumViewModel: MySumViewModel!
    
    
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    
    @IBOutlet weak var secondNumberLabel: UILabel!
    
    @IBOutlet weak var answerInputLabel: UILabel!
    @IBOutlet weak var operationLabel: UILabel!
    
    @IBOutlet weak var firstNumberInput: UITextField!
    @IBOutlet weak var secondNumberInput: UITextField!
    @IBOutlet weak var answerInput: UITextField!
    
    @IBOutlet weak var operationSelection: OperationPickerView!

    func assignDependancies(mySumFlowController: MySumFlowController, mySumViewModel: MySumViewModel) {
        self.mySumViewModel = mySumViewModel
        self.mySumFlowController = mySumFlowController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        labelSetup()
    }
    
    func initialSetup() {
        
        //set mainscreen details
        self.view.backgroundColor = UIColor.Shades.standardBlack
        self.title = "My Sum"
        answerInput.keyboardType = .numberPad
        firstNumberInput.keyboardType = .numberPad
        secondNumberInput.keyboardType = .numberPad
        
    }
    
    func labelSetup() {
        firstNumberInput.mySumNumberTextSetUp()
        secondNumberInput.mySumNumberTextSetUp()
        answerInput.mySumNumberTextSetUp()
        operationSelection.backgroundColor = UIColor.Yellows.gryffindorYellow
        
        
        firstNumberLabel.mySumLabelSetup()
        secondNumberLabel.mySumLabelSetup()
        operationLabel.mySumLabelSetup()
        answerInputLabel.mySumLabelSetup()
        
        firstNumberLabel.text = "First Number"
        secondNumberLabel.text = "Second Number"
        operationLabel.text = "Operation"
        answerInputLabel.text = "Answer"
        
    }
    
    @IBAction func firstNumberInput(_ sender: UITextField) {
        
    }

}
