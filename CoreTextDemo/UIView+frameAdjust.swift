//
//  UIView+frameAdjust.swift
//  CoreTextDemo
//
//  Created by Ngmm_Jadon on 2017/6/8.
//  Copyright © 2017年 Ngmm_Jadon. All rights reserved.
//

import UIKit

extension UIView {
    
    func x() -> CGFloat {
        return self.frame.origin.x
    }
    
    func y() -> CGFloat {
        return self.frame.origin.y
    }
    
    func centerX() -> CGFloat {
        return self.center.x
    }
    
    func centerY() -> CGFloat {
        return self.center.y
    }
    
    func width() -> CGFloat {
        return self.frame.size.width
    }
    
    func height() -> CGFloat {
        return self.frame.size.height
    }
    
    func setX(_ x: CGFloat) {
        self.frame.origin.x = x
    }
    
    func setY(_ y: CGFloat) {
        self.frame.origin.y = y
    }
    
    func setCenterX(_ centerX: CGFloat) {
        self.center.x = centerX
    }
    
    func setCenterY(_ centerY: CGFloat) {
        self.center.y = centerY
    }
    
    func setWidth(width: CGFloat) {
        self.frame.size.width = width
    }
    
    func setHeight(height: CGFloat) {
        self.frame.size.height = height
    }
    
}
