//
//  ListViewController.swift
//  swift-snapkit-demo
//
//  Created by Spencer Dangel on 5/15/19.
//  Copyright © 2019 spencerdangel. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    // class variables
    let list: [Int] = [];
    var count: Int = 1;
    
    let stackView = UIStackView();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white;
        
        // lock a button to add new items to the top of the view
        let addItemButton = UIButton();
        addItemButton.setTitle("Add Item", for: .normal);
        addItemButton.setTitleColor(UIColor.blue, for: .normal);
        addItemButton.setTitleColor(UIColor.black, for: .highlighted);
        addItemButton.addTarget(self, action: #selector(self.addItem), for: .touchUpInside);
        
        self.view.addSubview(addItemButton);
        addItemButton.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide);
            make.centerX.equalToSuperview();
            make.width.equalTo(200);
            make.height.equalTo(25);
        }
        
        // lock the close button to the bottom of the view
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
        
        // add a scroll view in case our list overflows the remaining space
        // also, scroll views are magic, they automatically handle scrolling based on the size of their child views
        let scrollView = UIScrollView();
        scrollView.delaysContentTouches = false;
        
        self.view.addSubview(scrollView);
        scrollView.snp.makeConstraints{ make in
            // set the scrollView to take the space between the two buttons
            make.top.equalTo(addItemButton.snp.bottom).offset(10);
            make.bottom.equalTo(closeButton.snp.top).offset(-10);
            
            // tell the scrollView to use all available horizontal space
            make.left.right.width.equalToSuperview();
        }
        
        // use a stack view for the list because it will manage some constraints for us
        stackView.axis = .vertical; // tells the stack view to manage the horizontal constraints automatically
        stackView.spacing = 10; // leave 10 pixels of space between each item

        scrollView.addSubview(stackView);
        stackView.snp.makeConstraints{ make in
            make.edges.width.equalToSuperview(); // set the view to use all of the available space of the parent view
        }
        
        for _ in 1...10 { // swift for loop
            self.addItem();
        }
    }
    
    @objc func addItem() {
        let label = UILabel(); // create a label to hold the item
        label.text = String(self.count); // tell it to use the next number
        label.textAlignment = .center; // so the text appears in the center of the screen
        
        // add a tap gesture so items can be removed, similar to defining button targets
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeItem(gesture:)));
        label.addGestureRecognizer(tapGesture); // add the gesture to the view
        label.isUserInteractionEnabled = true;

        // add the view to the stack view
        // note that it is using an arranged subview, this tells the stack view that we want it to manage the constraints automatically
        // you can still add a subview the normal way to stack views, it just won't manage any constraints for you
        self.stackView.addArrangedSubview(label);
        label.snp.makeConstraints{ make in
            make.width.equalToSuperview(); // take the full width of the parent view
        }

        self.count += 1; // prepare for the next item
    }
    
    @objc func removeItem(gesture: UITapGestureRecognizer) {
        // removes the view from its superview and automatically re-renders the view
        // gestures pass along a reference to the view they were attached to, making this possible
        // the ? behind "view" tells it to fail gracefully if the view is nil, with an ! a runtime error would be thrown if the view was nil
        gesture.view?.removeFromSuperview();
    }
    
    @objc func closeView() {
        self.dismiss(animated: true, completion: nil);
    }
}
