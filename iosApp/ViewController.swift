//
//  ViewController.swift
//  iosApp
//
//  Created by Hmoo Myat Theingi on 11/01/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class UserStandards {
 @nonobjc class var isLogin: Bool? {
        get {
            return UserDefaults.standard.value(forKey: "isLogin") as? Bool
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "isLogin")
        }
    }
}
