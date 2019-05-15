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
