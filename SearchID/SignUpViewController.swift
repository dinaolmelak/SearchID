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
    
    var db: Firestore!
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        //performSegue(withIdentifier: "display", sender: self)
        // Do any additional setup after loading the view.
        db = Firestore.firestore()
    }
    @IBAction func didTapBack(_ sender: Any) {
        goBack()
        
    }
    @IBAction func didTapSignUp(_ sender: Any) {
        let myLostVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lostVCID") as! LostViewController
        self.addChild(myLostVC)
        self.view.addSubview(myLostVC.view)
        
        let email = emailTextIn.text!
        let password = passwordIn.text!
        let jsuIDNum = jsuIDNumberIn.text!
        let fullName = fullNameTextIn.text!
        
        //myDoc.collection("Users").addDocument(data: ["JSU_ID":jsuIDNumberIn.text!])
        //myDoc.setData(["JSU_ID":jsuIDNumberIn.text!])
        
        
        //Auth.auth().cre
        Auth.auth().createUser(withEmail: email, password: password)
        let userUID = Auth.auth().currentUser!.uid
        db.collection("users").document(userUID).setData([
                "Full Name": fullName,
                "JSU_ID": jsuIDNum,
                "Email": email ])
        
        
        
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
