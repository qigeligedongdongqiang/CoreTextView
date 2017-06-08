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
        
        let ctView = CTDisplayView(frame: view.bounds)
        view.addSubview(ctView)
        
        let config:CTFrameParserConfig = CTFrameParserConfig()
        config.textColor = UIColor.red
        config.width = ctView.width()
        
        let data = CTFrameParser.frameParser("dd", config: config)
        ctView.data = data
        ctView.backgroundColor = UIColor.white
        ctView.setHeight(height: data.height)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

