//
//  VCLogin.swift
//  ChatAppFirebase
//
//  Created by Kushal on 05/01/18.
//  Copyright © 2018 Gaurishankar. All rights reserved.
//

import UIKit

class VCLogin: UIViewController {

    @IBOutlet weak var txt_username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   

    @IBAction func btn_loginPress(_ sender: Any) {
        
        performSegue(withIdentifier: "chatRoom", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "chatRoom"
        {
            if let dis = segue.destination as? ViewController
            {
                dis.UserName=txt_username.text
            }
        }
    }

}
