//
//  Macros.swift
//  CoreTextDemo
//
//  Created by Ngmm_Jadon on 2017/6/8.
//  Copyright © 2017年 Ngmm_Jadon. All rights reserved.
//

import UIKit

func ColorRGBA(r: CGFloat,g: CGFloat,b: CGFloat,a: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func ColorHEX(hexValue:NSInteger) -> UIColor {
    return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((hexValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(hexValue & 0xFF))/255.0, alpha: 1.0)
}

#if DEBUG
    
    func debugLog(_ format: String, _ args: CVarArg...) {
        NSLog(format, args)
    }
    
#else
    
    func debugLog(_ format: String, _ args: CVarArg...) {
        
    }

#endif
