//
//  ViewController.swift
//  CoreTextDemo
//
//  Created by Ngmm_Jadon on 2017/6/7.
//  Copyright © 2017年 Ngmm_Jadon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let ctView = CTDisplayView()
        view.addSubview(ctView)
        
        ctView.backgroundColor = UIColor.white
        ctView.setX(view.x())
        ctView.setY(view.y()+64)
        ctView.setWidth(width: view.width())
        
        let config:CTFrameParserConfig = CTFrameParserConfig()
        config.textColor = UIColor.red
        config.width = ctView.width()
        config.lineSpace = 10
        config.fontName = "PingFangSC-Regular"
        config.fontSize = 12
        
        let path = Bundle.main.path(forResource: "template", ofType: "json")
        let data = CTFrameParser.parserTemplateFlie(path! as NSString , config: config)
        ctView.data = data
        ctView.setHeight(height: data.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

