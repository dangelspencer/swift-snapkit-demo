# swift-snapkit-demo

Quick demo of swift view layouts with snapkit

## Requirements
* Xcode
    * Install from the app store
* Cocoapods
    * Run `gem install cocoapods`

## Setup
1. Create a new ios app
2. In the root project folder, run `pod init`
3. Run `pod install` to generate the `.xcworkspace` file
4. Open the project with the `.xcworkspace` file

## Adding Snapkit
1. Open the pod init file
2. Add the line `pod 'SnapKit'` under the outer target (under `use_frameworks!`)
3. Run `pod install`