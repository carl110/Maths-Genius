//
//  AdditionsViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class AdditionsViewController: UIViewController {
    
    fileprivate var additionsViewModel: AdditionsViewModel!
    fileprivate var additionsFlowController: AdditionsFlowController!
    
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    
    @IBOutlet weak var firstNumberSelector: UISegmentedControl!
    
    @IBOutlet weak var secondNumberSelector: UISegmentedControl!
    
    func assignDependancies(additionsFlowController: AdditionsFlowController, additionsViewModel: AdditionsViewModel){
        self.additionsFlowController = additionsFlowController
        self.additionsViewModel = additionsViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        firstNumberLabel.text = "Select how large you would like the first number in the equasion"
        secondNumberLabel.text = "Select how large you would like the first number in the equasion"
    }
    
    @IBAction func firstNumberSelector(_ sender: Any) {
    }
    @IBAction func secondNumberSelector(_ sender: Any) {
    }
}
