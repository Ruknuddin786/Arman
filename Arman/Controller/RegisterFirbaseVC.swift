//
//  RegisterFirbaseVC.swift
//  Arman
//
//  Created by Mohd Ruknuddin on 01/05/18.
//  Copyright © 2018 Mohd Ruknuddin. All rights reserved.
//

import UIKit
import Firebase

class RegisterFirbaseVC: UIViewController {
    
    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var passwordId: UITextField!
    
    @IBOutlet weak var registerErrorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func cancelFunc(_ sender: UIButton) {
        performSegue(withIdentifier: "regCancel", sender: self)
    }
    
    @IBAction func firebaseRegisterAccess(_ sender: AnyObject) {
        
        Auth.auth().createUser(withEmail: emailId.text!, password: passwordId.text!) { (user, error) in
            
            if error != nil{
                self.registerErrorMessage.textColor = UIColor.red
                self.registerErrorMessage.contentMode = .scaleToFill
                self.registerErrorMessage.numberOfLines = 0
                self.registerErrorMessage.text = error?.localizedDescription
                print(error!)
            } else{
                print("User has been added succefully")
                
                self.performSegue(withIdentifier: "pageRegToCatlog", sender: self)
            }
            
        }
        
    }
    

    

}
