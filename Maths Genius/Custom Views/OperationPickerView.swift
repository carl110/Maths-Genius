//
//  OperationPickerView.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 06/11/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class OperationPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let operation = ["+", "−", "×", "÷"]
    
    override func awakeFromNib() {
        dataSource = self
        delegate = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        operation.count
    }

    //Setup for row titles and attributes
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let title = UILabel()
        
        title.font = UIFont.systemFont(ofSize: self.frame.height, weight: UIFont.Weight.bold)
        title.textColor = UIColor.Reds.gryffindorRed
        title.backgroundColor = UIColor.Yellows.gryffindorYellow
        
        title.text =  operation[row]
        title.textAlignment = .center

        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return self.frame.height
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print ("\(operation[row]) has been selected")
    }
    
}
