//
//  UIView+extensions.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    //round corners of a view, individually or all together
    func roundCorners(for corners: UIRectCorner, cornerRadius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    func setRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }

}

extension UIViewController {

func setupNavigationMultilineTitle() {
    guard let navigationBar = self.navigationController?.navigationBar else { return }
    for sview in navigationBar.subviews {
        for ssview in sview.subviews {
            guard let label = ssview as? UILabel else { break }
            if label.text == self.title {
                label.numberOfLines = 0
                label.lineBreakMode = .byWordWrapping
                label.sizeToFit()
                UIView.animate(withDuration: 0.3, animations: {
                    navigationBar.frame.size.height = 57 + label.frame.height
                })
            }
        }
    }
}
}
