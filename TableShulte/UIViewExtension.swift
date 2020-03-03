//
//  UIViewExtension.swift
//  TableShulte
//
//  Created by Егор on 02.03.2020.
//  Copyright © 2020 Egor Gurba. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setGradientBackgrount(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
