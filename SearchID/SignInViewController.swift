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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
 
    
    
    @IBAction func didTapOnBack(_ sender: Any) {
        self.view.endEditing(true)
        goToHomeVC()
    }
    @IBAction func didTapSignIn(_ sender: Any) {
        guard let email = self.emailTextIn.text, let password = self.passwordTextIn.text else{
            self.createAlert(title: "email or password", message: "email or password can't be empty")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (dataResult, error) in
            if dataResult != nil && error == nil{
                print("Signed IN!!!!")
                self.performSegue(withIdentifier: "signInToTab", sender: self)
                //self.goToTabController()
            }else{
                print("ERROR\(error!.localizedDescription)")
            }
            
            
            
        }
        
        
        
       /*
        if emailTextIn.text == ""{
            createAlert(title: "Email Empty", message: "Please enter your email")
        }else if passwordTextIn.text == "" {
            createAlert(title: "Password Empty", message: "Please enter your password")
        }else if (emailTextIn.text == "" && passwordTextIn.text == ""){
            createAlert(title: "Email and Password Empty", message: "Please enter your email and password")
        }else{
        */
        
        
            //Auth.auth().signIn(withEmail: emailTextIn.text!, password: passwordTextIn.text!)
        //}
        
        
        
        
        
        
    }
    @IBAction func didTapGesture(_ sender: Any) {
        self.view.endEditing(true)
        
    }
    
    
    @IBAction func didTapOnNoAccount(_ sender: Any) {
        let signUpController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUpVCID") as! SignUpViewController
        self.addChild(signUpController)
        self.view.addSubview(signUpController.view)
        signUpController.didMove(toParent: self)
        
    }
    
    
    
    
    func goToTabController(){
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        mainTabController.selectedViewController = mainTabController.viewControllers?[0]
        present(mainTabController, animated: true, completion: nil)
        
        /*
        let myLostVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lostVCID") as! LostViewController
        self.addChild(myLostVC)
        self.view.addSubview(myLostVC.view)
        myLostVC.didMove(toParent: self)
        */
        
    }
    
    
    
    
    func goToHomeVC(){
        let myhomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as! ViewController
        self.addChild(myhomeVC)
        self.view.addSubview(myhomeVC.view)
        myhomeVC.didMove(toParent: self)
    }
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true)
        }))
        self.present(alert,animated: true, completion: nil)
        
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
