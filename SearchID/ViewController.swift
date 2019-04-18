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
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil{
            goToTabController()
        }
        
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
    
    
    
    
    
    
    
    
    
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true)
        }))
        self.present(alert,animated: true, completion: nil)
        
    }
    
    func goToTabController(){
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        mainTabController.selectedViewController = mainTabController.viewControllers?[2]
        present(mainTabController, animated: true, completion: nil)
        
        /*
        let myLostVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lostVCID") as! LostViewController
        self.addChild(myLostVC)
        self.view.addSubview(myLostVC.view)
        myLostVC.didMove(toParent: self)
        */
        
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
