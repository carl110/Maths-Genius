//
//  TutorialViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class TutorialViewController: UIViewController {
    
    fileprivate var tutorialViewModel: TutorialViewModel!
    fileprivate var tutorialFlowController: TutorialFlowController!
    
    @IBOutlet weak var tutorialLabel: UILabel!
    
    func assignDependancies(tutorialFlowController: TutorialFlowController, tutorialViewModel: TutorialViewModel){
        self.tutorialFlowController = tutorialFlowController
        self.tutorialViewModel = tutorialViewModel
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        setUp()
    }
    
    func setUp() {
        self.title = "Tutorial"

        
        tutorialLabel.text = "This is placeholder text for the tutorial"
    }
    
}
