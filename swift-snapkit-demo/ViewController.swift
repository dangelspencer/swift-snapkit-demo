//
//  ViewController.swift
//  swift-snapkit-demo
//
//  Created by Spencer Dangel on 5/15/19.
//  Copyright © 2019 spencerdangel. All rights reserved.
//

import SnapKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let basicConstraintsView = BasicConstraintsViewController();
        self.view.addSubview(basicConstraintsView.view);
    }


}

