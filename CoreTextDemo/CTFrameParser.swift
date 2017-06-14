//
//  CTFrameParser.swift
//  CoreTextDemo
//
//  Created by Ngmm_Jadon on 2017/6/8.
//  Copyright © 2017年 Ngmm_Jadon. All rights reserved.
//

import UIKit

class CTFrameParser: NSObject {
    
    class func parserTemplateFlie(_ path: NSString, config: CTFrameParserConfig) -> CoreTextData {
        let content = self.loadTemplateFile(path, config: config)
        return self.parserAttributedContent(content, config: config)
    }
    
    class func loadTemplateFile(_ path: NSString, config: CTFrameParserConfig) -> NSAttributedString {
        let data = NSData(contentsOfFile: path as String)
        let result = NSMutableAttributedString()
        if (data != nil) {
            let array:NSArray = try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            if array.isKind(of: NSArray.self) {
                for dic in array {
                    if let dict = dic as? NSDictionary {
                        let type = dict["type"]
                        if (type as! NSString).isEqual(to:"txt") {
                            let attributedStr = self.parserAttributedContentConvert(dict, config: config)
                            result.append(attributedStr)
                        }
                    }
                }
            }
        }
        return result
    }
    
    class func parserAttributedContentConvert(_ dict: NSDictionary, config: CTFrameParserConfig) -> NSAttributedString {
        let attributes:NSMutableDictionary = self.attributes(config) as! NSMutableDictionary
        
        let colorStr = (dict["color"]) as? String
        if (colorStr != nil) {
            let hexValue = Int(strtoul(colorStr, nil, 16))
            let color = ColorHEX(hexValue: hexValue)
            attributes.setObject(color, forKey: kCTForegroundColorAttributeName as! NSCopying)
        }
        
        let fontSize = dict["fontSize"] as? CGFloat
        if (fontSize != nil) {
            if (fontSize! > 0) {
                let font = CTFontCreateWithName(config.fontName as CFString?, fontSize!, nil)
                attributes.setObject(font, forKey: kCTFontAttributeName as! NSCopying)
            }
        }
        
        let content = dict["content"] as! NSString
        
        return NSAttributedString(string: content as String, attributes: attributes.copy() as? [String : Any])
    }
    
    class func parserAttributedContent(_ content: NSAttributedString, config: CTFrameParserConfig) -> CoreTextData {
        let frameSetter = CTFramesetterCreateWithAttributedString(content)
        let restrictSize = CGSize(width: config.width, height: CGFloat(MAXFLOAT))
        let coretextSize = CTFramesetterSuggestFrameSizeWithConstraints(frameSetter, CFRangeMake(0, 0), nil, restrictSize, nil)
        let textHeight = coretextSize.height
        
        let frame = self.createFrame(frameSetter, config: config, height: textHeight)
        
        let data = CoreTextData(ctFrame: frame, height: textHeight)
        
        return data
    }
    
//    class func frameParser(_ content: NSString, config: CTFrameParserConfig) -> CoreTextData {
//
//        let attributes = self.attributes(config)
//        let contentStr = NSAttributedString(string: content as String, attributes: attributes as? [String : Any])
//        let frameSetter = CTFramesetterCreateWithAttributedString(contentStr)
//        let restrictSize = CGSize(width: config.width, height: CGFloat(MAXFLOAT))
//        let coretextSize = CTFramesetterSuggestFrameSizeWithConstraints(frameSetter, CFRangeMake(0, 0), nil, restrictSize, nil)
//        let textHeight = coretextSize.height
//        
//        let frame = self.createFrame(frameSetter, config: config, height: textHeight)
//        
//        let data = CoreTextData(ctFrame: frame, height: textHeight)
//        
//        return data
//    }
    
    // MARK: ------设置描述------
    class func attributes(_ config: CTFrameParserConfig) -> NSDictionary {
        //设置字体
        let fontName = config.fontName
        let fontSize = config.fontSize
        let fontRef = CTFontCreateWithName(fontName as CFString?, fontSize, nil)
        
        //设置行间距
        var lineSpace = config.lineSpace
        let settings: [CTParagraphStyleSetting] = [CTParagraphStyleSetting(spec: CTParagraphStyleSpecifier.lineSpacingAdjustment, valueSize: MemoryLayout<CGFloat>.size, value: &lineSpace), CTParagraphStyleSetting(spec: CTParagraphStyleSpecifier.maximumLineSpacing, valueSize: MemoryLayout<CGFloat>.size, value: &lineSpace), CTParagraphStyleSetting(spec: CTParagraphStyleSpecifier.minimumLineSpacing, valueSize: MemoryLayout<CGFloat>.size, value: &lineSpace)]
        let theParagaraphRef = CTParagraphStyleCreate(settings, 3)
        
        //设置字体颜色
        let textColor = config.textColor
        
        let dict = NSMutableDictionary()
        dict.setObject(fontRef, forKey: kCTFontAttributeName as! NSCopying)
        dict.setObject(theParagaraphRef, forKey: kCTParagraphStyleAttributeName as! NSCopying)
        dict.setObject(textColor.cgColor, forKey: kCTForegroundColorAttributeName as! NSCopying)
        
        return dict
    }
    
    // MARK: ------创建frame------
    class func createFrame(_ frameSetter: CTFramesetter, config: CTFrameParserConfig, height: CGFloat) -> CTFrame {
        let path = CGMutablePath()
        path.addRect(CGRect(x: 0, y: 0, width: config.width, height: height))
        
        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil)
        
        return frame
    }

}
