//
//  LoginFirbaseVCViewController.swift
//  Arman
//
//  Created by Mohd Ruknuddin on 01/05/18.
//  Copyright © 2018 Mohd Ruknuddin. All rights reserved.
//

import UIKit
import Firebase

class LoginFirbaseVCViewController: UIViewController {

    @IBOutlet weak var loginmailId: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var loginErrorMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func loginCancelFun(_ sender: UIButton) {
        performSegue(withIdentifier: "loginCancel", sender: self)
    }
    
    @IBAction func firbaseLoginAccess(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: loginmailId.text!, password: loginPassword.text!){ (user, error) in
            if error != nil{
                print(error!)
                self.loginErrorMessage.textColor = UIColor.red
                self.loginErrorMessage.contentMode = .scaleToFill
                self.loginErrorMessage.numberOfLines = 0
                self.loginErrorMessage.text = error?.localizedDescription
            } else{
                print("User has been signin succefully")
                
                self.performSegue(withIdentifier: "goLoginToCatlog", sender: self)
            }
        }
        
    }
    
}
