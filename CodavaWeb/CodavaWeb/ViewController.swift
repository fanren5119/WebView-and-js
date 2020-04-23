//
//  ViewController.swift
//  CodavaWeb
//
//  Created by freshera on 2020/4/23.
//  Copyright © 2020 wiseinfoiotDev. All rights reserved.
//

import UIKit

class ViewController: CDVViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightItem = UIBarButtonItem(title: "确定", style: .plain, target: self, action: #selector(respondsToRightItem))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    @objc func respondsToRightItem() {
        let js = "uploadData('图片', '123456')"
        self.commandDelegate.evalJs(js)
    }
}

