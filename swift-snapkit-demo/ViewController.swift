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
        
        let subview = UIView();
        self.view.addSubview(subview);
        subview.snp.makeConstraints { make in
            if #available(iOS 11, *) {
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin);
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottomMargin);
            } else {
                make.top.equalTo(self.view);
                make.bottom.equalTo(self.view);
            }
            
            make.left.right.equalToSuperview();
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.present(ListViewController(), animated: false);
    }
}

