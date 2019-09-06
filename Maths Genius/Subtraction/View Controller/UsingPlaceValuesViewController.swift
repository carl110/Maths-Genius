//
//  UsingPlaceValuesViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 05/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class UsingPlaceValuesViewController: UIViewController {
    
    fileprivate var usingPlaceValuesFlowController: UsingPlaceValuesFlowController!
    fileprivate var usingPlaceValuesViewModel: UsingPlaceValuesViewModel!
    
    @IBOutlet weak var pageTitle: UILabel!
    
    @IBOutlet weak var helpContents: UILabel!
    
    
    func assignDependancies(usingPlaceValuesFlowController: UsingPlaceValuesFlowController, usingPlaceValuesViewModel: UsingPlaceValuesViewModel) {
        self.usingPlaceValuesViewModel = usingPlaceValuesViewModel
        self.usingPlaceValuesFlowController = usingPlaceValuesFlowController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        // Do any additional setup after loading the view.
    }
    
    func setUp() {
        pageTitle.text = "Using Place Values"
        
        helpContents.text = "If the number is small enough, you may use your fingers, or pencils, or any other item you have handy. /n Count the number of pencils for the first number and then count the number of pencils for the second number /n Now count all of the pencils together. This is your answer."
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
