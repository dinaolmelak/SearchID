//
//  SecondViewController.swift
//  SearchID
//
//  Created by Dinaol Melak on 3/24/19.
//  Copyright © 2019 Dinaol Melak. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    var outputLabelText: String!
    //@IBOutlet weak var displayField: UILabel!
    // var inputText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = outputLabelText
        //performSegue(withIdentifier: "display", sender: self)
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapOnCancel(_ sender: Any) {
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "firstVC") as! ViewController
        self.addChild(firstVC)
        self.view.addSubview(firstVC.view)
        firstVC.didMove(toParent: self)
        
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
