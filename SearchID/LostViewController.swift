//
//  LostViewController.swift
//  SearchID
//
//  Created by Dinaol Melak on 4/4/19.
//  Copyright © 2019 Dinaol Melak. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LostViewController: UIViewController {
    var db: Firestore!
    @IBOutlet weak var lostIDLabel: UILabel!
    @IBOutlet weak var numberIDTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        
    }
    @IBAction func didTapSearch(_ sender: Any) {
        
        
        guard let person = numberIDTextField!.text else {
            return
            
        }
        
        let docRef = db.collection("users").document(person)
        
        docRef.getDocument { (documentSnapshot, Error) in
            if let document = documentSnapshot, document.exists{
                let data = document.data()
                let emailFromDB = data!["Email"]!
                self.lostIDLabel.text = (emailFromDB as! String)
            }
        }
        /*
        docRef.getDocument { (document, error) in
         if let document = document, document.exists {
         let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
         
            print(dataDescription)
         } else {
         print("Document does not exist")
         }
         }
        */
        
        //lostIDNumberLabel.text = (dinaol["Email"] as! String)
        //lostIDNumberLabel.text = (userEmail as! String)
       
        self.view.endEditing(true)
    }
    @IBAction func didTapGoHome(_ sender: Any) {
        self.view.endEditing(true)
        let goHomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as! ViewController
        
        self.addChild(goHomeVC)
        self.view.addSubview(goHomeVC.view)
        goHomeVC.didMove(toParent: self)
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
