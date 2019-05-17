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
        
        let navView = UIView();
        
        self.view.addSubview(navView);
        
        let constraintsButton = UIButton();
        constraintsButton.setTitle("Constraints Example", for: .normal);
        constraintsButton.setTitleColor(UIColor.blue, for: .normal);
        constraintsButton.addTarget(self, action: #selector(self.launchConstraints), for: .touchUpInside);
        
        navView.addSubview(constraintsButton);
        constraintsButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview();
            make.width.equalTo(200);
            make.height.equalTo(25);
        }
        
        let listButton = UIButton();
        listButton.setTitle("List Example", for: .normal);
        listButton.setTitleColor(UIColor.blue, for: .normal);
        listButton.addTarget(self, action: #selector(self.launchList), for: .touchUpInside);
        
        navView.addSubview(listButton);
        listButton.snp.makeConstraints{ make in
            make.top.equalTo(constraintsButton.snp.bottom).offset(10);
            make.centerX.equalToSuperview();
            make.width.equalTo(200);
            make.height.equalTo(25);
        }
        
        navView.snp.makeConstraints{ make in
            make.top.equalTo(constraintsButton);
            make.bottom.equalTo(listButton);
            make.center.equalToSuperview();
            make.width.equalToSuperview();
        }
    }
    
    @objc func launchConstraints() {
        self.present(BasicConstraintsViewController(), animated: true);
    }
    
    @objc func launchList() {
        self.present(ListViewController(), animated: true);
    }
}

