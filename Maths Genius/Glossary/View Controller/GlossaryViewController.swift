//
//  GlossaryViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 25/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class GlossaryViewController: UIViewController {

        fileprivate var glossaryFlowController: GlossaryFlowController!
        fileprivate var glossaryViewModel: GlossaryViewModel!
    fileprivate var glossaryModel = GlossaryModel()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cascadingTable: CascadingTable!
    
    func assignDependancies(glossaryFlowController: GlossaryFlowController, glossaryViewModel: GlossaryViewModel) {
            self.glossaryViewModel = glossaryViewModel
            self.glossaryFlowController = glossaryFlowController
        }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            screenSetUp()
            titleLabelSetup()
            glossaryItemsSetup()
        }
    
    func screenSetUp() {
        self.title = "GLOSSARY"
        self.view.backgroundColor = UIColor.Shades.standardBlack
    }
    
    func titleLabelSetup() {
        titleLabel.text = "Touch the name to view the description..."
        titleLabel.titleLabelSetUp()
    }
    
    func glossaryItemsSetup() {
        
        cascadingTable.tableSectionName.append(contentsOf: glossaryModel.glossaryItems)
        
        cascadingTable.tableCellData.append(contentsOf: glossaryModel.glossaryDeffinition)
        

        cascadingTable.reloadData()
    }
}
