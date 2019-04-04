//
//  SignInViewController.swift
//  SearchID
//
//  Created by Dinaol Melak on 4/3/19.
//  Copyright © 2019 Dinaol Melak. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func didTapOnBack(_ sender: Any) {
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
