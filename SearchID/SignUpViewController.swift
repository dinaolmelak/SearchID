//
//  SecondViewController.swift
//  SearchID
//
//  Created by Dinaol Melak on 3/24/19.
//  Copyright © 2019 Dinaol Melak. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //performSegue(withIdentifier: "display", sender: self)
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapBack(_ sender: Any) {
        let myhomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as! ViewController
        self.addChild(myhomeVC)
        self.view.addSubview(myhomeVC.view)
        myhomeVC.didMove(toParent: self)
        
        /*
        let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as! SignInViewController
        self.addChild(signInVC)
        self.view.addSubview(signInVC.view)
        signInVC.didMove(toParent: self)
        */
        
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
