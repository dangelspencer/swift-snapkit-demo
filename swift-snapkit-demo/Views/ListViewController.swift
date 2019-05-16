//
//  ListViewController.swift
//  swift-snapkit-demo
//
//  Created by Spencer Dangel on 5/15/19.
//  Copyright © 2019 spencerdangel. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    let list: [Int] = [];
    var count: Int = 1;
    
    let stackView = UIStackView();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white;
        
        let scrollView = UIScrollView();
        scrollView.delaysContentTouches = false;

        self.view.addSubview(scrollView);
        scrollView.snp.makeConstraints{ make in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide);
            make.left.right.width.equalToSuperview();
        }
        
        let addItemButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 25));
        addItemButton.setTitle("Add Item", for: .normal);
        addItemButton.setTitleColor(UIColor.blue, for: .normal);
        addItemButton.setTitleColor(UIColor.black, for: .highlighted);
        addItemButton.addTarget(self, action: #selector(self.addItem), for: .touchUpInside);
        
        scrollView.addSubview(addItemButton);
        addItemButton.snp.makeConstraints{ make in
            make.top.equalToSuperview();
            make.centerX.equalToSuperview();
            make.width.equalTo(200);
            make.height.equalTo(25);
        }
        
        stackView.axis = .vertical;
        stackView.spacing = 10;

        scrollView.addSubview(stackView);
        stackView.snp.makeConstraints{ make in
            make.top.equalTo(addItemButton.snp.bottom).offset(20);
            make.left.right.bottom.width.equalToSuperview();
        }
        
        for _ in 1...10 {
            self.addItem();
        }
    }
    
    @objc func addItem() {
        let label = UILabel();
        label.text = String(self.count);
        label.textAlignment = .center;
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeItem(gesture:)));
        label.addGestureRecognizer(tapGesture);
        label.isUserInteractionEnabled = true;

        self.stackView.addArrangedSubview(label);
        label.snp.makeConstraints{ make in
            make.width.equalToSuperview();
        }

        self.count += 1;
    }
    
    @objc func removeItem(gesture: UITapGestureRecognizer) {
        gesture.view?.removeFromSuperview();
    }
}
