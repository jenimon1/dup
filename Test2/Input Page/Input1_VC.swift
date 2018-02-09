//
//  ipVC.swift
//  Test2
//
//  Created by Monrada Juycharoen on 10/8/2560 BE.
//  Copyright © 2560 Monrada Juycharoen. All rights reserved.
//

import UIKit
import SwiftyOnboard
import AlertOnboarding


class Input1_VC: UIViewController, AlertOnboardingDelegate {
    
    @IBOutlet var textField: UITextField!
    
    ///////INTRO
    var alertView: AlertOnboarding!

    var arrayOfImage = ["Intro1", "Intro2", "Intro3"]
    var arrayOfTitle = ["CREATE ACCOUNT", "CHOOSE THE PLANET", "DEPARTURE"]
    var arrayOfDescription = ["In your profile, you can view the statistics of its operations and the recommandations of friends",
                              "Purchase tickets on hot tours to your favorite planet and fly to the most comfortable intergalactic spaceships of best companies",
                              "In the process of flight you will be in cryogenic sleep and supply the body with all the necessary things for life"]
    ///////INTRO///////
    
    
    override func viewDidLoad() {
        self.title = "ADOL"
        // Do any additional setup after loading the view, typically from a nib.
        // 192.168.95.163
        
        ///////INTRO
        super.viewDidLoad()
        
        alertView = AlertOnboarding(arrayOfImage: arrayOfImage, arrayOfTitle: arrayOfTitle, arrayOfDescription: arrayOfDescription)
        alertView.delegate = self
        
        // Edit
        self.alertView.colorForAlertViewBackground = UIColor().HexToColor(hexString: "#f3F2f8", alpha: 1.0)
        self.alertView.colorButtonText = UIColor.white
        self.alertView.colorButtonBottomBackground = UIColor().HexToColor(hexString: "#785bdc", alpha: 1.0)

        self.alertView.show()
        ///////INTRO///////

    }
    
    
    @IBAction func press_nextButton(_ sender: Any) {
       let input2 = Input2_VC()
        input2.getIP(ipStr: textField.text!)
    }
    
    
    
    ///////INTRO
    @IBAction func showAlert(_ sender: Any) {
        print("WORK")
        
        
//         self.alertView.colorForAlertViewBackground = UIColor(red: 173/255, green: 206/255, blue: 183/255, alpha: 1.0)
//         self.alertView.colorButtonText = UIColor.whiteColor()
//         self.alertView.colorButtonBottomBackground = UIColor(red: 65/255, green: 165/255, blue: 115/255, alpha: 1.0)
//
//         self.alertView.colorTitleLabel = UIColor.whiteColor()
//         self.alertView.colorDescriptionLabel = UIColor.whiteColor()
//
//         self.alertView.colorPageIndicator = UIColor.whiteColor()
//         self.alertView.colorCurrentPageIndicator = UIColor(red: 65/255, green: 165/255, blue: 115/255, alpha: 1.0)
//
//         self.alertView.percentageRatioHeight = 0.5
//         self.alertView.percentageRatioWidth = 0.5
        

        self.alertView.show()
    }
    
    func alertOnboardingSkipped(_ currentStep: Int, maxStep: Int) {
        print("Onboarding skipped the \(currentStep) step and the max step he saw was the number \(maxStep)")
    }
    
    func alertOnboardingCompleted() {
        print("Onboarding completed!")
    }
    
    func alertOnboardingNext(_ nextStep: Int) {
        print("Next step triggered! \(nextStep)")
    }
    ///////INTRO///////
    
    

    
//    Send input ip and page title to MainVC page
//    @IBAction func doneAC(_ sender: Any) {
//        let vc = MainVC()
//        let intro1 = Intro1()
//        vc.customInit(ipStr: textfield.text!, title: "ADOL")
//        self.navigationController?.pushViewController(intro1, animated: true)
//    }
    
}



// Extension of UI color
extension UIColor{
    func HexToColor(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }

    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
}


