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
    
    init(ctFrame: CTFrame, height: CGFloat) {
        self.ctFrame = ctFrame
        self.height = height
    }

}
