//
//  LoginVC.swift
//  Test Project for VertageLab
//
//  Created by Aleksandr Khalupa on 24.06.2021.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var loginEmailTF: UITextField!
    
    @IBOutlet weak var passwordLoginTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.borderWidth = 0.3
        loginEmailTF.layer.borderWidth = 0.3
        passwordLoginTF.layer.borderWidth = 0.3
    }

    @IBAction func pressedLogin(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMapVC", sender: self)
    }
    
}

