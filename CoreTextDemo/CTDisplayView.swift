//
//  CTDisplayView.swift
//  CoreTextDemo
//
//  Created by Ngmm_Jadon on 2017/6/7.
//  Copyright © 2017年 Ngmm_Jadon. All rights reserved.
//

import UIKit

class CTDisplayView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var data:CoreTextData?
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        //翻转坐标系
        context?.textMatrix = CGAffineTransform.identity
        context?.translateBy(x: 0, y: self.bounds.size.height)
        context?.scaleBy(x: 1, y: -1)
        
        let path = CGMutablePath()
        path.addRect(self.bounds)
        
        if data != nil {
            CTFrameDraw((self.data?.ctFrame)!, context!)
        }
    }

}
