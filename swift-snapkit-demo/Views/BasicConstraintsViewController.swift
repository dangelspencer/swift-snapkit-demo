//
//  BasicConstraintsViewController.swift
//  swift-snapkit-demo
//
//  Created by Spencer Dangel on 5/15/19.
//  Copyright © 2019 spencerdangel. All rights reserved.
//

import UIKit

class BasicConstraintsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let topLeftBox = UIView();
        topLeftBox.backgroundColor = UIColor.blue;
        
        self.view.addSubview(topLeftBox);
        topLeftBox.snp.makeConstraints{ make in
            make.left.top.equalToSuperview();
            make.width.height.equalTo(150);
        }
        
        let bottomRightBox = UIView();
        bottomRightBox.backgroundColor = UIColor.red;
        
        self.view.addSubview(bottomRightBox);
        bottomRightBox.snp.makeConstraints{ make in
            make.bottom.right.equalToSuperview();
            make.width.height.equalTo(150);
        }
        
        let centerCircle = UIView();
        centerCircle.backgroundColor = UIColor.green;
        centerCircle.layer.cornerRadius = 100;
        centerCircle.layer.masksToBounds = true;
        
        self.view.addSubview(centerCircle);
        centerCircle.snp.makeConstraints{ make in
            make.center.equalToSuperview();
            make.width.height.equalTo(200);
        }
        
        let offsetCircle = UIView();
        offsetCircle.backgroundColor = UIColor.gray;
        offsetCircle.layer.cornerRadius = 25;
        offsetCircle.layer.masksToBounds = true;
        
        self.view.addSubview(offsetCircle);
        offsetCircle.snp.makeConstraints{ make in
            make.centerX.equalTo(centerCircle.snp.centerX).offset(-40);
            make.centerY.equalTo(centerCircle.snp.centerY).offset(40);
            make.width.height.equalTo(50);
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
