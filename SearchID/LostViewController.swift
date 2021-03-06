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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let unidentifiedVC = segue.destination as! UnidentifiedUserViewController
        unidentifiedVC.lostIDLastSix = numberIDTextField.text
    }
    @IBAction func didTapSearch(_ sender: Any) {
        self.view.endEditing(true)
        
        
        if numberIDTextField.text!.count > 6 || numberIDTextField.text!.count < 6 || numberIDTextField.text! == ""{
            createAlert(title: "Incorrect Value", message: "Please check your input and try again")
        }
        guard let inputID = numberIDTextField!.text  else {
            return
            
        }
        
        let docRef = db.collection("users").document(inputID)
        
        docRef.getDocument { (documentSnapshot, Error) in
            if let document = documentSnapshot, document.exists{
                let data = document.data()
                //let emailFromDB = data!["Email"]!//This is the email of the person who lost their ID
                let lostIDName = data!["fullName"]!
                self.lostIDLabel.text = "Please take \(lostIDName)'s ID to the JSU Library"
                docRef.updateData(["isLost":true])

            }else {
                print ("doesn't exist")
                let alert = UIAlertController(title: "ID Info", message: "Does the ID have first name, middle name/(M.I), and last Name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { (action) in
                    alert.dismiss(animated: true)
                    self.createAlert(title: "Sorry!", message: "SearchID was unable to contact the person")
                }))
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (actionWhenYes) in
                    self.performSegue(withIdentifier: "unidentifiedUserSegue", sender: self)
                }))
                self.present(alert,animated: true)
                
                
                
                
                
            }
 
        }
        //docRef.setValue(true, forKey: "isLost")//How I tried to edit file on database
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
       
        
    }
    
    
    @IBAction func didTapGesture(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
    
    /*
    @IBAction func didTapGoHome(_ sender: Any) {
        self.view.endEditing(true)
        let goHomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as! ViewController
        
        self.addChild(goHomeVC)
        self.view.addSubview(goHomeVC.view)
        goHomeVC.didMove(toParent: self)
    }
 */
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
