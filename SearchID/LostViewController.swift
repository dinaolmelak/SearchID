//
//  LostViewController.swift
//  SearchID
//
//  Created by Dinaol Melak on 4/4/19.
//  Copyright © 2019 Dinaol Melak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import UserNotifications

class LostViewController: UIViewController {
    var db: Firestore!
    @IBOutlet weak var lostIDNumberLabel: UILabel!
    @IBOutlet weak var numberIDTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        /*
        ref.child("Users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["username"] as? String ?? ""
            let user = User(username: username)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }*/
    }
    @IBAction func didTapSearch(_ sender: Any) {
        
        lostIDNumberLabel.text = "SearchID!!!"
        
        let docRef = db.collection("Users").document("firstUser")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
        print("Dinaol is the best")
        /*
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        //let userID = Auth.auth().currentUser?.uid
        
        ref.child("Users").child("firstUser").observeSingleEvent(of: .value) { (DataSnapshot) in
            let value = DataSnapshot.value as? NSDictionary
            print(value!)
        }
       */
        
        
        /*
         let userID = Auth.auth().currentUser?.uid
         ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
         // Get user value
         let value = snapshot.value as? NSDictionary
         let username = value?["username"] as? String ?? ""
         let user = User(username: username)
         
         // ...
         }) { (error) in
         print(error.localizedDescription)
         }
         */
        //Look through the database to see if the ID belongs to someone
        
        //if it does get the ID, trigger the alert to that person
        
        //if it does not get the ID Change lostIDNumberLabel to ID Not Found
        
        
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
