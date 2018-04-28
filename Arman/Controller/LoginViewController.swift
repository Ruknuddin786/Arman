//
//  ViewController.swift
//  Arman
//
//  Created by Mohd Ruknuddin on 23/04/18.
//  Copyright © 2018 Mohd Ruknuddin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginUserId: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getAccess(_ sender: UIButton) {
        
        let accessKey : String = "Admin"
        
        if loginUserId != nil && loginPassword != nil {
            
            if loginUserId.text == accessKey && loginPassword.text == accessKey {
                print(true)
                self.performSegue(withIdentifier: "messagingSague", sender: self)
            } else {
                print("Please enter vaild UserId and Password ")
                errorMessage.textColor = UIColor.red
                errorMessage.text = "UserId/Password is incorrect"
            }
            
        }
    }
    
    override var prefersStatusBarHidden: Bool{
        return true;
    }
    
    
    
}

