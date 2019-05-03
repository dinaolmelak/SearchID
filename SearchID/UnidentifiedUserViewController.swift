//
//  UnidentifiedUserViewController.swift
//  SearchID
//
//  Created by Dinaol Melak on 5/1/19.
//  Copyright © 2019 Dinaol Melak. All rights reserved.
//

import UIKit
import Firebase


class UnidentifiedUserViewController: UIViewController {
    var db: Firestore!
    
    @IBOutlet weak var searchIDLabel: UILabel!
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var middleInitialInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    //var email: String!
    var fullName: String!
    var lostIDLastSix: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        
        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapSearch(_ sender: Any) {
        
        let alert = UIAlertController(title: "Are you sure?", message: "\(firstNameInput.text!), \(middleInitialInput.text!), and \(lastNameInput.text!) is correct?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Not Sure", style: UIAlertAction.Style.default, handler: { (AlertAction) in
            alert.dismiss(animated: true)

        }))
        alert.addAction(UIAlertAction(title: "Sure!", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true)
            self.view.endEditing(true)
            
            self.storeEmail()
            self.searchIDLabel.text = "The ID has been Successfully SearchID 😁"
            
        }))
        self.present(alert,animated: true, completion: nil)
    }
    
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Sure!", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true)
        }))
        self.present(alert,animated: true, completion: nil)
        
    }
    
    
    @IBAction func didTapGesture(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
    func storeEmail(){
        let fname = firstNameInput.text!.lowercased().trimmingCharacters(in: .whitespaces)
        let mname = middleInitialInput.text!.lowercased().trimmingCharacters(in: .whitespaces)
        let lname = lastNameInput.text!.lowercased().trimmingCharacters(in: .whitespaces)
        let email = "\(fname).\(mname).\(lname)@students.jsums.edu"
        let fullName = "\(String(describing: firstNameInput.text!)) \(String(describing: lastNameInput.text!))"
        
        //let lostIDVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "lostVCID") as! LostViewController
        let docRef = db.collection("users").document(lostIDLastSix)
        docRef.setData([
        "Email": email,
        "isLost": false,
        "fullName": fullName
        
        ])
        docRef.updateData(["isLost": true])
        
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
