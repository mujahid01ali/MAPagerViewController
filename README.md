# MAPagerViewController

[![CI Status](https://img.shields.io/travis/mujahid01ali/MAPagerViewController.svg?style=flat)](https://travis-ci.org/mujahid01ali/MAPagerViewController)
[![Version](https://img.shields.io/cocoapods/v/MAPagerViewController.svg?style=flat)](https://cocoapods.org/pods/MAPagerViewController)
[![License](https://img.shields.io/cocoapods/l/MAPagerViewController.svg?style=flat)](https://cocoapods.org/pods/MAPagerViewController)
[![Platform](https://img.shields.io/cocoapods/p/MAPagerViewController.svg?style=flat)](https://cocoapods.org/pods/MAPagerViewController)

MAPagerViewController is a versatile top tab pager designed for seamless navigation between different tabs in your iOS application. With a user-friendly interface, it facilitates effortless tab scrolling and tapping, enhancing the overall user experience. This library empowers developers to enable users to effortlessly switch between different tabs, elevating app navigation and simplifying resource management.

## Features

*- **Seamless Navigation:** Navigate effortlessly between different tabs with smooth scrolling and tapping functionality.*
  
*- **User-Friendly Interface:** Enhance the overall user experience with a clean and intuitive design.*
  
*- **Customization:** Tailor the appearance of tabs with options for setting borders, fonts, and colors to match your app's style.*

*- **Icon Support:** Include icons for each tab to provide visual cues for users.*


<img src="https://github.com/mujahid01ali/MAPagerViewController/assets/12751356/044fb533-cd95-4d1d-a0d6-c894428dfa45" width="200" height="400">

## Example

**- To integrate MAPagerViewController into your UIViewController, simply add the following code:**

```swift

    lazy var pagerView: MAPagerView = {
        let view = MAPagerView()
        return MAPagerView()
    }()
    
    var tabs: [MATab] {
        return [
            MATab(icon: UIImage(systemName: "cricket.ball.fill"), title: "Music", screen: ViewController(), isSelected: true),
            MATab(title: "Entertainment", screen: ViewController2()),
            MATab(title: "World News", screen: ViewController3())
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setPager()
    }
    
    private func setPager() {
        pagerView.configuration = PagerConfiguration(tabs: tabs)
        pagerView.callingViewControllers = self
        pagerView.setChildViews()
 
    }
```
<img src="https://github.com/mujahid01ali/MAPagerViewController/assets/12751356/1078247c-8b7e-47ab-9aa3-000eaf5b6891" width="200" height="400">

<br/>
<br/>

**- Adding Borders and Colors:**  
To apply a border with color to tabs in a *```pagerView```*, you can achieve this by adding the following configuration(*```TabConfiguration```*) within the specified *```pagerView```*.

```swift
let tabConfig = MATabConfiguration(borderRadius: 8.0,
                                           borderWidth: 1.5,
                                           font: .systemFont(ofSize: 16, weight: .bold),
                                           selectedCellBorderColor: .brown,
                                           bottomIndicatorColor: .brown)
pagerView.configuration = PagerConfiguration(tabs: tabs,
                                                     tabConfig: tabConfig)
```

<img src="https://github.com/mujahid01ali/MAPagerViewController/assets/12751356/407bfc28-af68-4069-a357-2336fb78c1b6" width="200" height="400">


<br/>
<br/>

**- Adding Icons to Tabs:**  
  To include icons for the tabs, utilize the *```icon```* parameter within the *```Tab```* model.

```swift
MATab(icon: UIImage(systemName: "cricket.ball.fill"), title: "Music", screen: ViewController(), isSelected: true)

```

<img src="https://github.com/mujahid01ali/MAPagerViewController/assets/12751356/10dfa05e-7ccd-475e-8258-4a48f1117f35" width="200" height="400">

**- Customizing Tab States:**  
  You can further enhance the appearance of your tabs by customizing their states. The following properties in *```TabConfiguration```* and *```PagerConfiguration```* provides extensive customization options:

  - *`selectedTabBackgroundColor`*: Set the background color of the selected tab.
  - *`selectedTextColor`*: Define the text color of the selected tab.
  - *`selectedTintColor`*: Specify the tint color of the selected tab.
  - *`bottomIndicatorColor`*: Set the color of the bottom indicator that highlights the selected tab.
  - *`font`*: Customize the text font color for all tabs.
  - *`pagerBackgroundColor`*: Set the pager background color.
  - *`isScrollingEnable`*: Define the controller are scrollable.
  
  <br />
  Feel free to experiment with these properties to achieve the desired look and feel for your tabs.
  <br />
  <br />

<img src="https://github.com/mujahid01ali/MAPagerViewController/assets/12751356/e0e1b122-e824-4c14-af0c-d738c1adbaa2" width="200" height="400">


## Requirements
- Swift 5.0+
- iOS 13.0+
- XCode 8+

## Installation

MAPagerViewController is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MAPagerViewController'
```

## Author

mujahid01ali, magg2761@gmail.com

## License

MAPagerViewController is available under the MIT license. See the LICENSE file for more info.
