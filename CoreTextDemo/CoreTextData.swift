//
//  CoreTextData.swift
//  CoreTextDemo
//
//  Created by Ngmm_Jadon on 2017/6/8.
//  Copyright © 2017年 Ngmm_Jadon. All rights reserved.
//

import UIKit

class CoreTextData: NSObject {
    var ctFrame: CTFrame?
    var height:CGFloat = 0
//    var imageArray:NSArray {
//        didSet{
//            fillImagePosition()
//        }
//    }
    
    init(ctFrame: CTFrame, height: CGFloat) {
        self.ctFrame = ctFrame
        self.height = height
//        self.imageArray = []
    }
    
//    func fillImagePosition() {
//        if imageArray.count == 0 {
//            return
//        }
//        let lines: NSArray = CTFrameGetLines(ctFrame!)
//        let lineCount = lines.count
//        let lineOrigins = [CGFloat](repeating: 0.0, count: lineCount)
//        CTFrameGetLineOrigins(ctFrame!, CFRangeMake(0, 0), lineOrigins)
//        
//    }
    
   

}
