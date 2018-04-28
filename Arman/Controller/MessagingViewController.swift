//
//  MessagingViewController.swift
//  Arman
//
//  Created by Mohd Ruknuddin on 27/04/18.
//  Copyright © 2018 Mohd Ruknuddin. All rights reserved.
//

import Foundation
import UIKit

class MessagingViewController: UIViewController{
    
    @IBOutlet weak var sideMenuConstraint : NSLayoutConstraint!
    
    var isSideMenuHidden    = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loginViewSegue
        
        sideMenuConstraint.constant = -140
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sideMenuOption(_ sender: UIBarButtonItem) {
        
        if isSideMenuHidden {
            sideMenuConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.loadViewIfNeeded()
            })
            
        } else {
            sideMenuConstraint.constant = -140
            
            UIView.animate(withDuration: 0.3, animations: {
                self.loadViewIfNeeded()
            })
            
        }
        isSideMenuHidden = !isSideMenuHidden
    }
    
    
    @IBAction func doLogout(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "loginViewSegue", sender: self)
    }
}
