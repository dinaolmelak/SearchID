//
//  ViewController.swift
//  SearchID
//
//  Created by Dinaol Melak on 3/23/19.
//  Copyright © 2019 Dinaol Melak. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapCreateAccount(_ sender: Any) {
        let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUpVCID") as! SignUpViewController
        self.addChild(signUpVC)
        self.view.addSubview(signUpVC.view)
        signUpVC.didMove(toParent: self)
        
        
        
    }
    @IBAction func didTapSignIn(_ sender: Any) {
        let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signInVCID") as! SignInViewController
        self.addChild(signInVC)
        self.view.addSubview(signInVC.view)
        signInVC.didMove(toParent: self)
        
    }
    
    
    
    

}

/*
 //This is how to pass data
 let createdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUpVC") as! SignUpViewController
 //let createdVC = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC") as! CreatedViewController
 self.addChild(createdVC)
 createdVC.outputLabelText = textFieldLabel.text!
 self.view.addSubview(createdVC.view)
 createdVC.didMove(toParent: self)
 */
