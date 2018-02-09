//
//  Input2_VC.swift
//  Test2
//
//  Created by Monrada Juycharoen on 2/5/2561 BE.
//  Copyright © 2561 Monrada Juycharoen. All rights reserved.
//

import UIKit
import SearchTextField

class Input2_VC: UIViewController {
    
    var ipStr : String!

    @IBOutlet var object_textfield: SearchTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Textfield
//        self.object_textfield.filterStrings(["Red", "Blue", "Yellow"])


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getIP(ipStr : String) {
        self.ipStr = ipStr
        print(self.ipStr)
    }

}
