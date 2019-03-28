//
//  ViewController.swift
//  SearchID
//
//  Created by Dinaol Melak on 3/23/19.
//  Copyright © 2019 Dinaol Melak. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func didTapOnFound(_ sender: Any){
        let createdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        //let createdVC = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "secondVC") as! CreatedViewController
        self.addChild(createdVC)
        createdVC.outputLabelText = textFieldLabel.text!
        self.view.addSubview(createdVC.view)
        createdVC.didMove(toParent: self)
        
    }
    
    
    
    
    

}

