//
//  BasicConstraintsViewController.swift
//  swift-snapkit-demo
//
//  Created by Spencer Dangel on 5/15/19.
//  Copyright © 2019 spencerdangel. All rights reserved.
//

import UIKit

class BasicConstraintsViewController: UIViewController {

    // viewDidLoad() runs the first time the view is loaded
    // if you wanted to run code everytime the view is opened, you would use viewDidAppear()
    override func viewDidLoad() {
        super.viewDidLoad()

        // set the background color of the view
        self.view.backgroundColor = UIColor.white;
        
        // create a box for the top left hand corner
        let topLeftBox = UIView();
        topLeftBox.backgroundColor = UIColor.blue;
        
        self.view.addSubview(topLeftBox);
        topLeftBox.snp.makeConstraints{ make in
            make.left.top.equalToSuperview(); // lock the view to the top left corner of the parent view
            make.width.height.equalTo(150); // set the width and height
        }
        
        // create a box for the bottom right hand corner, to demonstrate using safeAreaLayoutGuide
        let bottomRightBox = UIView();
        bottomRightBox.backgroundColor = UIColor.red;
        
        self.view.addSubview(bottomRightBox);
        bottomRightBox.snp.makeConstraints{ make in
            make.right.equalToSuperview(); // lock to right side of parent view
            make.bottom.equalTo(self.view.safeAreaLayoutGuide); // lock to the bottom of the parent view, compensating for rounded corners on newer iphones
            make.width.height.equalTo(150);
        }
        
        // circle example
        let centerCircle = UIView();
        centerCircle.backgroundColor = UIColor.green;
        centerCircle.layer.cornerRadius = 100;
        centerCircle.layer.masksToBounds = true; // makes the cornerRadius apply
        
        self.view.addSubview(centerCircle);
        centerCircle.snp.makeConstraints{ make in
            make.center.equalToSuperview(); // sets center of view to center of superview (could also use centerX and centerY individually)
            make.width.height.equalTo(200);
        }
        
        // offset a view from another view
        let offsetCircle = UIView();
        offsetCircle.backgroundColor = UIColor.black;
        offsetCircle.layer.cornerRadius = 25;
        offsetCircle.layer.masksToBounds = true;
        
        self.view.addSubview(offsetCircle);
        offsetCircle.snp.makeConstraints{ make in
            make.centerX.equalTo(centerCircle.snp.centerX).offset(-40); // pushes the center of the view left by 40 pixels
            make.centerY.equalTo(centerCircle.snp.centerY).offset(40); // pushes the center of the view down by 40 pixels
            make.width.height.equalTo(50);
        }
        
        // add a close button so we can get back to the navigation view
        let closeButton = UIButton();
        closeButton.setTitle("Close", for: .normal);
        closeButton.setTitleColor(UIColor.blue, for: .normal);
        closeButton.setTitleColor(UIColor.black, for: .highlighted);
        closeButton.addTarget(self, action: #selector(self.closeView), for: .touchUpInside);
        
        self.view.addSubview(closeButton);
        closeButton.snp.makeConstraints{ make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide);
            make.centerX.equalToSuperview();
            make.width.equalTo(200);
            make.height.equalTo(25);
        }
    }
    
    @objc func closeView() {
        // navigates back to the previous view
        self.dismiss(animated: true, completion: nil);
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
