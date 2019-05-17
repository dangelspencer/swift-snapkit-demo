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

    // This is the first view to get loaded in the app
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navView = UIView(); // create a container view to hold our nav buttons
        self.view.addSubview(navView); // add it to the current view
        
        let constraintsButton = UIButton(); // create a button to open the constraints view
        constraintsButton.setTitle("Constraints Example", for: .normal); // set the title
        constraintsButton.setTitleColor(UIColor.blue, for: .normal); // set the title color
        /*
         tell it what function to call when pressed
         Parameters:
            1. tells the button which object contains the action function
            2. the function that should be called when the button is pressed
            3. what event the action should fire on
        */
        constraintsButton.addTarget(self, action: #selector(self.launchConstraints), for: .touchUpInside);
        
        // add the button to the navigation view
        navView.addSubview(constraintsButton);
        
        // define the rules that determine where the button appears in the view
        constraintsButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview(); // set the center of the button equal to the parent view (navView)
            make.width.equalTo(200); // set the width to 200
            make.height.equalTo(25); // set the height to 25
        }
        
        let listButton = UIButton(); // create another button for the list example
        listButton.setTitle("List Example", for: .normal);
        listButton.setTitleColor(UIColor.blue, for: .normal);
        listButton.addTarget(self, action: #selector(self.launchList), for: .touchUpInside);
        
        navView.addSubview(listButton); // add the list button to the navigation view
        listButton.snp.makeConstraints{ make in
            make.top.equalTo(constraintsButton.snp.bottom).offset(10); // set the top of the list button to be 10 pixels below the bottom of the constraints button
            make.centerX.equalToSuperview();
            make.width.equalTo(200);
            make.height.equalTo(25);
        }
        
        // define display rules for the navView
        navView.snp.makeConstraints{ make in
            // the next two lines define the height of the view to be the same as the vertical space taken by the navigation buttons
            make.top.equalTo(constraintsButton); // set the top of the view to the top of the constraints button
            make.bottom.equalTo(listButton); // set the bottom of the view to the bottom of the list button
            
            make.center.equalToSuperview();
            make.width.equalToSuperview(); // set the width of the view
            // if the width is not defined for this view, you would not be able to click the buttons
            // this is because the view would have a width of 0 and although the buttons would be visible, since they are child views of this view the touch event would not be passed to them
        }
    }
    
    @objc func launchConstraints() {
        // launches the BasicConstraintsViewController
        // note that there is no need to import the controller, as swift files are globally available
        self.present(BasicConstraintsViewController(), animated: true);
    }
    
    @objc func launchList() {
        //launches the ListViewController
        self.present(ListViewController(), animated: true);
    }
}

