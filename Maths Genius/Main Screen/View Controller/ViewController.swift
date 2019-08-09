//
//  ViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var mainFlowController: MainFlowController!

    @IBOutlet weak var introductionTable: IntroductionTable!
    @IBOutlet weak var viewTutorial: UIButton!
    
    func assignDependancies(mainFlowController: MainFlowController) {
        self.mainFlowController = mainFlowController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    func setUp() {
        viewTutorial.backgroundColor = UIColor.Yellows.mustardYellow
        viewTutorial.setTitleColor(UIColor.Shades.standardGrey, for: .normal)
        viewTutorial.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        viewTutorial.centerTextHorizontally(spacing: 8)
        viewTutorial.roundCorners(for: .allCorners, cornerRadius: 8)
        
        self.title = "Select you subject"
        
        DispatchQueue.main.async { [weak self] in
           self?.introductionTable.roundCorners(for: .allCorners, cornerRadius: 8)
        }
        
    }
    
    
    @IBAction func viewTutorial(_ sender: Any) {
        mainFlowController.showAdditions()    }
    

}

