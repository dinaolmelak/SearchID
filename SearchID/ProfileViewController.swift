//
//  ProfileViewController.swift
//  SearchID
//
//  Created by Dinaol Melak on 4/18/19.
//  Copyright © 2019 Dinaol Melak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileViewController: UIViewController {

    var db: Firestore!
    let user = Auth.auth().currentUser
    @IBOutlet weak var myIDLost: UISwitch!


    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var displayName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        
        db = Firestore.firestore()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser?.displayName != nil{
            displayName.text = Auth.auth().currentUser?.displayName
        }else{
            displayName.text = "Name"
            
        }
        
        if let user = user{
            let currentUserUID:String
            currentUserUID = user.uid
            print("this is userUID \(currentUserUID)")
            
            
            let docRef = self.db.collection("usersID").document(currentUserUID)
            
            docRef.getDocument { (documentSnapshot, Error) in
                if let document = documentSnapshot, document.exists{
                    let data = document.data()
                    //let emailFromDB = data!["Email"]!//This is the email of the person who lost their ID
                    let lostIDLastSix = data!["lastSix"]!
                    let lostLastSix = (lostIDLastSix as! String)
                    print(lostLastSix)
                    
                    
                    let docRef2 = self.db.collection("users").document(lostLastSix)
                    docRef2.getDocument{ (userDocument, errorFound) in
                        if let document = userDocument, document.exists{
                            let userData = document.data()
                            let isLostValue = userData!["isLost"]!
                            let isLostIDValue = (isLostValue as! Bool)
                            
                            if isLostIDValue == true{
                                self.myIDLost.isOn = true
                            }
                            else{
                                self.myIDLost.isOn = false
                            }
                            //myIDLost = isLostIDValue
                        }
                        
                    }
                    
                    
                    
                }
            }
            print(currentUserUID)
        }
    }
    
    @IBAction func didTapSignOut(_ sender: Any) {
        
        try! Auth.auth().signOut()
        let goHomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as! ViewController
        
        self.addChild(goHomeVC)
        self.view.addSubview(goHomeVC.view)
        goHomeVC.didMove(toParent: self)
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func didTapMyIDLost(_ sender: Any) {
        
        if myIDLost.isOn == true{
            if let user = user{
                let currentUserUID:String
                currentUserUID = user.uid
                print("this is userUID \(currentUserUID)")
                
                
                let docRef = self.db.collection("usersID").document(currentUserUID)
                
                docRef.getDocument { (documentSnapshot, Error) in
                    if let document = documentSnapshot, document.exists{
                        let data = document.data()
                        //let emailFromDB = data!["Email"]!//This is the email of the person who lost their ID
                        let lostIDLastSix = data!["lastSix"]!
                        let lostLastSix = (lostIDLastSix as! String)
                        print(lostLastSix)
                        
                        
                        let docRef2 = self.db.collection("users").document(lostLastSix)
                        /*
                         docRef2.getDocument { (docSnap, error) in
                         if let doc = docSnap, document.exists{
                         let docData = doc.data()
                         let statusOfID = docData!["isLost"]
                         
                         
                         }
                         }
                         */
                        docRef2.updateData(["isLost" : false])
                        
                        
                    }
                }
                print(currentUserUID)
            }
        } else{
            if let user = user{
                let currentUserUID:String
                currentUserUID = user.uid
                print("this is userUID \(currentUserUID)")
                
                
                let docRef = self.db.collection("usersID").document(currentUserUID)
                
                docRef.getDocument { (documentSnapshot, Error) in
                    if let document = documentSnapshot, document.exists{
                        let data = document.data()
                        //let emailFromDB = data!["Email"]!//This is the email of the person who lost their ID
                        let lostIDLastSix = data!["lastSix"]!
                        let lostLastSix = (lostIDLastSix as! String)
                        print(lostLastSix)
                        
                        
                        let docRef2 = self.db.collection("users").document(lostLastSix)
                        /*
                         docRef2.getDocument { (docSnap, error) in
                         if let doc = docSnap, document.exists{
                         let docData = doc.data()
                         let statusOfID = docData!["isLost"]
                         
                         
                         }
                         }
                         */
                        docRef2.updateData(["isLost" : true])
                        
                        
                    }
                }
                print(currentUserUID)
            }
        }
        
        
        
        
        
        
    }
    
    @IBAction func tapEditDispayName(_ sender: Any) {
        let alert = UIAlertController(title: "Edit Name", message: "Please Enter a Prefered Name", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Input Name", style: .default) { (UIAlertAction) in
            _ = alert.textFields![0] as UITextField
            self.displayName.text = alert.textFields![0].text
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = alert.textFields![0].text
            changeRequest?.commitChanges{ (error) in
                print("success commiting")
                let userInfo = Auth.auth().currentUser?.providerData
                
            }
            
        }
        
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Name Here"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (alertAction) in
            alert.dismiss(animated: true)
        }))
        alert.addAction(action)
        self.present(alert, animated: true)
        
        //self.displayName.text = alert.textFields![0].text
        //self.displayName.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    
    
    
    
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
