//
//  SecondViewController.swift
//  SearchID
//
//  Created by Dinaol Melak on 3/24/19.
//  Copyright © 2019 Dinaol Melak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextIn: UITextField!
    @IBOutlet weak var jsuIDNumberIn: UITextField!
    @IBOutlet weak var emailTextIn: UITextField!
    @IBOutlet weak var passwordIn: UITextField!
    @IBOutlet weak var phoneNumberIn: UITextField!
    
    
    var db: Firestore!
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        //performSegue(withIdentifier: "display", sender: self)
        // Do any additional setup after loading the view.
        db = Firestore.firestore()
    }
    /*
    @IBAction func didTapBack(_ sender: Any) {
        
        goBack()
        
    }
 */
    @IBAction func didTapSignUp(_ sender: Any) {
        let switchCar: Character
        
        if jsuIDNumberIn.text?.count != 6 || jsuIDNumberIn.text == "" {
            switchCar = "a"
        }else if emailTextIn.text == "" || !((emailTextIn.text!.contains("@"))){
            switchCar = "b"
        }else if(passwordIn.text == "" || passwordIn.text!.count < 6){
            switchCar = "c"
        }else if(fullNameTextIn.text == ""){
            switchCar = "d"
        }else if(phoneNumberIn.text == ""){
            switchCar = "e"
        }
        else if(fullNameTextIn.text == "" && passwordIn.text == "" && (emailTextIn.text == "" || !((emailTextIn.text?.contains("@"))!)) && (jsuIDNumberIn.text?.count != 6 || jsuIDNumberIn.text == "")){
            switchCar = "f"
        }else {
            switchCar = "z"
        }
        
        switch switchCar{
        case "a":
            createAlert(title: "JSU ID Missing", message: "Please enter the last 6 digits of your JSU ID")
        case "b":
            createAlert(title: "Incorrect Email", message: "Please check your email")
        case "c":
            createAlert(title: "Password Needed", message: "Please enter a password for your account")
        case "d":
            createAlert(title: "Full Name Needed", message: "Please enter your first and last name")
        case "e":
            createAlert(title: "Info Needed", message: "Please input your number so that you get instant Alert")
        case "f":
            createAlert(title: "Info Needed", message: "Please fill out the needed information")
            
        default:
            
            let email = emailTextIn.text!
            let password = passwordIn.text!
            let jsuIDNum = jsuIDNumberIn.text!
            let fullName = fullNameTextIn.text!
            let phoneNumber = phoneNumberIn.text!
            
            //myDoc.collection("Users").addDocument(data: ["JSU_ID":jsuIDNumberIn.text!])
            //myDoc.setData(["JSU_ID":jsuIDNumberIn.text!])
            
            
            
            Auth.auth().createUser(withEmail: email, password: password) { (dataResult, error) in
                if error == nil && dataResult != nil {
                    print("sign up success")
                    let userUID = Auth.auth().currentUser!.uid
                    
                    self.db.collection("users").document(jsuIDNum).setData([
                        "fullName": fullName,
                        "userUID": userUID,
                        "JSU_ID": jsuIDNum,
                        "Email": email,
                        "isLost": false,
                        "phoneNumber": phoneNumber
                        ])
                    
                    print("uploaded Data for info")
                    
                    self.db.collection("usersID").document(userUID).setData([
                        "lastSix": jsuIDNum
                        ])
                    print("uploaded usersID")
                    
                    
                    self.performSegue(withIdentifier: "signUpToMainTab", sender: self)
                    //self.goToMainTabController()
                } else {
                    print("sign up failed \(error!.localizedDescription)")
                }
            }
            
        }//switch closes here
        
        
        

    }
    @IBAction func didTapGesture(_ sender: Any) {
        self.view.endEditing(true)
        
    }
    
    @IBAction func didTapOnYesAccount(_ sender: Any) {
        let signInViewVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signInVCID") as! SignInViewController
        self.addChild(signInViewVC)
        self.view.addSubview(signInViewVC.view)
        signInViewVC.didMove(toParent: self)
        
        
    }
    
    
    
    
    
    func goToMainTabController(){
        
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
    /*
    func goBack(){
        self.view.endEditing(true)
        let myhomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as! ViewController
        self.addChild(myhomeVC)
        self.view.addSubview(myhomeVC.view)
        myhomeVC.didMove(toParent: self)
    }
    */
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true)
        }))
        self.present(alert,animated: true)
        
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
