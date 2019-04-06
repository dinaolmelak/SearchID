//
//  SignInViewController.swift
//  SearchID
//
//  Created by Dinaol Melak on 4/3/19.
//  Copyright © 2019 Dinaol Melak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    var db: Firestore!
    @IBOutlet weak var emailTextIn: UITextField!
    @IBOutlet weak var passwordTextIn: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapOnBack(_ sender: Any) {
        goBack()
    }
    @IBAction func didTapSignIn(_ sender: Any) {
        let myLostVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lostVCID") as! LostViewController
        self.addChild(myLostVC)
        self.view.addSubview(myLostVC.view)
        
        
        
        Auth.auth().signIn(withEmail: emailTextIn.text!, password: passwordTextIn.text!)
            
        
        myLostVC.didMove(toParent: self)
        
    }
    @IBAction func didTapGesture(_ sender: Any) {
        self.view.endEditing(true)

    }
    
    
    
    
    
    
    
    
    
    func goBack(){
        let myhomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as! ViewController
        self.addChild(myhomeVC)
        self.view.addSubview(myhomeVC.view)
        myhomeVC.didMove(toParent: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
