//
//  ListViewController.swift
//  swift-snapkit-demo
//
//  Created by Spencer Dangel on 5/15/19.
//  Copyright © 2019 spencerdangel. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = UIStackView();
        stackView.axis = .vertical;
        stackView.spacing = 10;
        
        self.view.addSubview(stackView);
        stackView.snp.makeConstraints{ make in
            make.left.right.top.equalToSuperview();
        }
        
        for i in 1...100 {
            let label = UILabel();
            label.text = String(i);
            label.textAlignment = .center;
            
            stackView.addArrangedSubview(label);
            label.snp.makeConstraints{ make in
                make.width.equalToSuperview();
            }
        }
    }
}
